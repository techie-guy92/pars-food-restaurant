# Generated by Django 5.0.7 on 2024-08-31 11:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0002_alter_order_payment_method_and_more'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='orderitem',
            options={'verbose_name': 'Order Item', 'verbose_name_plural': 'Order Items'},
        ),
        migrations.AlterField(
            model_name='reservation',
            name='approved_date',
            field=models.DateTimeField(blank=True, editable=False, null=True, verbose_name='Approved Date'),
        ),
    ]
