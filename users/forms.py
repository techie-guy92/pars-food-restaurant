from django import forms 
from django.core.exceptions import ValidationError
from django.forms.widgets import PasswordInput
from re import compile, match
from .models import *

  
#======================================= Toggle Password =====================================
class CustomPasswordInput(PasswordInput):
    template_name = "password_input.html"

    def get_context(self, name, value, attrs):
        context = super().get_context(name, value, attrs)
        context['widget']['show_hide_button'] = True
        return context

    
#======================================= Custom User Form ====================================

class CustomUserForm(forms.ModelForm):
    password = forms.CharField(label="Password", widget=forms.PasswordInput(render_value=True))
    re_password = forms.CharField(label="Re_password", widget=forms.PasswordInput(render_value=True))
    
    class Meta:
        model = CustomUser
        fields = ["first_name", "last_name", "email", "user_type",]
    
    def clean_first_name(self):
        first_name = self.cleaned_data["first_name"].capitalize()
        return first_name
    
    def clean_last_name(self):
        last_name = self.cleaned_data["last_name"].capitalize()
        return last_name
      
    def clean_re_password(self):
        pass1 = self.cleaned_data.get("password")
        pass2 = self.cleaned_data.get("re_password")
        if pass1 and pass2 and pass1 != pass2:
            raise ValidationError("رمز عبور و تکرار آن یکسان نمی باشد")
        return pass2
    
    def clean_password(self):
        passwordRe = compile(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]).{8,}$")
        password = self.cleaned_data["password"]
        if not passwordRe.match(password):
            raise ValidationError("رمز عبور باید متشکل از حروف کوچک، بزرگ و عدد باشد، و هشت رقمی نیز باشد") 
        return password

    def clean_email(self):
        emailRe = compile(r"^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$")
        email = self.cleaned_data["email"]
        if not emailRe.match(email):
            raise ValidationError("ایمیل معتبر نیست")  
        return email

    def save(self, commit=True):
        user = super().save(commit=False)
        user.user_type = "client"
        user.set_password(self.cleaned_data["password"])
        if commit:
            user.save()
        return user
    
    
#=============================================================================================
