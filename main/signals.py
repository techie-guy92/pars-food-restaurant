from django.db.models.signals import post_save
from django.dispatch import receiver
from django.core.mail import EmailMultiAlternatives
from django.utils import timezone
from .models import Reservation, OrderItem
from django.conf import settings


#======================================= Update order_status ================================================

@receiver(post_save, sender=Reservation)
def update_order_status(sender, instance, **kwargs):
    if not hasattr(instance, "_signal_handled"):
        if instance.is_approved:
            instance.order_status = "approved"
            if instance.approved_date is None:
                send_approval_email(instance)
        elif instance.end_date < timezone.now():
            instance.order_status = "expired"
        else:
            instance.order_status = "pending"
        
        instance._signal_handled = True
        instance.save(update_fields=["order_status"])


def mail_sender(Subject, Message, HTML_Content, To):
    Sending_From = settings.EMAIL_HOST_USER
    Message = EmailMultiAlternatives(Subject, Message, Sending_From, To)
    Message.attach_alternative(HTML_Content, "text/html")
    Message.send()


def send_approval_email(reservation):
    subject = "Your Reservation is Approved"
    message = f"<h4>Pars Food<br>Hello Dear {reservation.user.first_name} {reservation.user.last_name}<br><br><h4>Your reservation has been approved.\n\nThank you for choosing us!</h4>"
    recipient_list = [reservation.user.email]
    mail_sender(subject, "", message, recipient_list)
    
    
#======================================= Update total_amount ===============================================

@receiver(post_save, sender=OrderItem)
def update_order_totals(sender, instance, **kwargs):
    order = instance.order
    order.calculate_order_items()
    order.save()


#===========================================================================================================
