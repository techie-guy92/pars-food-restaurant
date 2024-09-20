from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import CustomUser


#======================================= Update user_type for new users ===================================

@receiver(post_save, sender=CustomUser)
def update_user_type_for_new_users(sender, instance, created, **kwargs):
    """
    Signal handler to update user_type for new users based on is_admin.
    """
    if created:
        if instance.is_admin and not instance.is_superuser:
            instance.user_type = "admin"
            instance.save()


#======================================= Update user_type ================================================

@receiver(post_save, sender=CustomUser)
def update_user_type(sender, instance, **kwargs):
    """
    Signal handler to update user_type as soon as is_admin changes.
    """
    if instance.is_admin and not instance.is_superuser:
        instance.user_type = "admin"
    elif not instance.is_admin and not instance.is_superuser:
        instance.user_type = "client"
    if instance.user_type != instance._original_user_type:
        CustomUser.objects.filter(pk=instance.pk).update(user_type=instance.user_type)
        

#=========================================================================================================
