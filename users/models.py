from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.utils import timezone
from os import path
from uuid import uuid4
from PIL import Image
from django.conf import settings


#======================================= Needed Method ===================================================

def upload_to(instance, filename):
    file_name, ext = path.splitext(filename) 
    new_filename = f"{uuid4()}{ext}"
    user = instance.user
    user_full_name = user.get_full_name().replace(" ", "_") 
    return f"images/users/{user_full_name}/{new_filename}"


#====================================== Custom User Manager Model =======================================

class CustomUserManager(BaseUserManager):
    def create_user(self, first_name, last_name, email, password=None): 
        if not email:
            raise ValueError("وارد کردن ایمیل ضروری است")
        
        user = self.model(
            first_name = first_name.capitalize(),
            last_name = last_name.capitalize(),
            email = self.normalize_email(email),
        )
        user.set_password(password)
        user.user_type = "client"
        user.save(using=self._db)
        return user
    
    def create_superuser(self, first_name, last_name, email, password=None):
        user = self.create_user(
            first_name = first_name,
            last_name = last_name,
            email = email,
            password = password,
        )
        user.is_active = True 
        user.is_admin = True 
        user.is_superuser = True 
        user.user_type = "backend"
        user.save(using=self._db)
        return user 


#======================================= Custom User Model =============================================

class CustomUser(AbstractBaseUser, PermissionsMixin):
    first_name = models.CharField(max_length=30, blank=True, verbose_name="First Name")
    last_name = models.CharField(max_length=30, blank=True, verbose_name="Last Nmae")
    email = models.EmailField(max_length=100, unique=True, verbose_name="Email")
    activation_code = models.CharField(max_length=20, blank=True, null=True, verbose_name="Activation Code")
    is_active = models.BooleanField(default=False, verbose_name="Being Active")
    is_admin = models.BooleanField(default=False, verbose_name= "Being Admin")
    is_superuser = models.BooleanField(default=False, verbose_name="Being Superuser")
    user_type = models.CharField(max_length=20, blank=True, choices=[("backend", "Backend User"), ("frontend", "Frontend User"), ("admin", "Admin User"), ("client", "Client")], default="client", verbose_name="User Type")
    _original_user_type = None
    date_joined = models.DateTimeField(auto_now_add=True, editable=False, verbose_name="Date Joined")
    
    def get_full_name(self):
        return f"{self.first_name} {self.last_name}"
    
    def __str__(self):
        return self.get_full_name()
    
    class Meta:
        verbose_name = "User"
        verbose_name_plural = "Users"
    
    @property    
    def is_staff(self):
        return self.is_admin
    
    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ["first_name", "last_name",]
    
    objects = CustomUserManager()
    
    
#==================================== User Profile Model ==============================================

class UserProfile(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name="UserProfile_user", verbose_name="User")
    phone = models.CharField(max_length=20, unique=True, verbose_name="Phone Number")
    gender = models.CharField(max_length=20, choices=[("male", "آقا"), ("female", "خانوم"), ("other", "دیگر")], default="other", verbose_name="Gender")
    bio = models.TextField(blank=True, null=True, verbose_name="Bio")
    image = models.ImageField(upload_to=upload_to, blank=True, null=True, verbose_name="Image")
    created_at = models.DateTimeField(auto_now_add=True, editable=False, verbose_name="Image")
    
    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        if self.image:
            img_name = self.image.name  
            img_path = self.image.path  
            target_size = (200, 200)
            img = Image.open(img_path)
            img.thumbnail(target_size)
            img.save(img_path)
            
    def __str__(self):
        return f"{self.user}"
    
    class Meta:
        verbose_name = "User Profile"
        verbose_name_plural = "Users Profile"
        
        
#==================================== In-Person Customer Model ========================================

class InPersonCustomer(models.Model):
    first_name = models.CharField(max_length=30, blank=True, verbose_name="First Name")
    last_name = models.CharField(max_length=30, blank=True, verbose_name="Last Nmae")
    phone = models.CharField(max_length=20, unique=True, verbose_name="Phone Number")
    date_joined = models.DateTimeField(auto_now_add=True, editable=False, verbose_name="Date Joined")
    
    def __str__(self):
        return f"{self.first_name} {self.last_name}"
    
    def clean(self):
       self.capitalize_full_name()
    
    def capitalize_full_name(self):
        self.first_name = self.first_name.capitalize()
        self.last_name = self.last_name.capitalize()
    
    def save(self, *args, **kwargs):
        self.full_clean()
        super().save(*args, **kwargs)
        
    class Meta:
        verbose_name = "Customer"
        verbose_name_plural = "Customers"
        
        
#========================================================================================================


