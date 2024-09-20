from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.http import HttpResponseForbidden
from .models import *
from .forms import *


#==================================== Custom User Admin =========================================

class CustomUserAdmin(UserAdmin):
    add_form = CustomUserForm
    
    list_display = ("id", "last_name", "first_name", "email", "user_type", "is_active", "is_admin", "is_superuser", "activation_code", "date_joined",)
    list_filter = ("user_type", "is_active", "is_admin", "is_superuser",)
    ordering = ("last_name", "first_name",)
    search_fields = ("last_name", "first_name", "date_joined",)
    list_editable = ()
    
    def get_list_display(self, request):
        if request.user.is_superuser:
            self.list_editable = ("is_active", "is_admin",)
        else:
            self.list_editable = ("is_active",)
        return super().get_list_display(request)
    
    add_fieldsets = (
        ("Personal Info", {"fields":("first_name", "last_name",)}),
        ("Authentication", {"fields":("email", "password", "re_password")}),
    )
    fieldsets = (
        ("Personal Info", {"fields":("first_name", "last_name",)}),
        ("Authentication", {"fields":("email", "password",)}), 
    )
    
    def get_add_fieldsets(self, request, obj=None):
        add_fieldsets = list(self.add_fieldsets)
        if request.user.is_superuser:
            add_fieldsets += (
                ("Status", {"fields": ("user_type", "is_active", "is_admin", "is_superuser",)}),
                ("Permissions", {"fields": ("user_permissions", "groups",)}),
                )
        elif request.user.is_admin:
            add_fieldsets.append(("Status", {"fields": ("is_active",)}))
        return add_fieldsets 

    def get_fieldsets(self, request, obj=None):
        fieldsets = list(super().get_fieldsets(request, obj))
        if request.user.is_superuser:
            fieldsets += (
                ("Status", {"fields": ("user_type", "is_active", "is_admin", "is_superuser",)}),
                ("Permissions", {"fields": ("user_permissions", "groups",)}),
                )
        elif request.user.is_admin:
            fieldsets.append(("Status", {"fields": ("is_active",)}))
        return fieldsets

    filter_horizontal = ("user_permissions", "groups",)
    
    def has_delete_permission(self, request, obj=None):
        if obj and not request.user.is_superuser:
            return obj.id == request.user.id
        return super().has_delete_permission(request, obj)
    
    def change_view(self, request, object_id, form_url='', extra_context=None):
        user = CustomUser.objects.get(pk=object_id)
        if user != request.user and not request.user.is_superuser and user.is_admin:
            return HttpResponseForbidden('<h1 style="color:red; text-align:center; margin-top:100px"> شما اجازه مشاهده برسی کردن صفحه دیگر ادمین ها را ندارید </h1>')
        if user != request.user and user.is_superuser:
            return HttpResponseForbidden('<h1 style="color:black; text-align:center; margin-top:100px"> شما اجازه مشاهده برسی کردن صفحه دیگر ابر کاربر ها را ندارید </h1>')
        return super().change_view(request, object_id, form_url, extra_context)

admin.site.register(CustomUser, CustomUserAdmin)
    
    
#==================================== User Profile Admin ========================================
    
@admin.register(UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("user", "phone", "gender", "created_at",)
    list_filter = ("gender",)
    search_fields = ("phone",)
    ordering = ("created_at",)
    

#==================================== User Profile Admin ========================================

@admin.register(InPersonCustomer)
class InPersonCustomerAdmin(admin.ModelAdmin):
    list_display = ("id", "last_name", "first_name", "phone", "date_joined",)
    ordering = ("last_name", "first_name",)
    search_fields = ("phone",)
    
    
#================================================================================================