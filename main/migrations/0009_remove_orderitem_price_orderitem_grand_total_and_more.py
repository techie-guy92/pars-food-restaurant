# Generated by Django 5.0.7 on 2024-09-04 16:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0008_remove_order_user_order_in_person_customer_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='orderitem',
            name='price',
        ),
        migrations.AddField(
            model_name='orderitem',
            name='grand_total',
            field=models.PositiveIntegerField(default=0, verbose_name='Grand Total'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='review',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, verbose_name='Created at'),
        ),
    ]
