# Generated by Django 5.0.7 on 2024-08-31 08:38

import django.core.validators
import django.db.models.deletion
import main.models
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Discount',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.CharField(max_length=100, unique=True, verbose_name='Code')),
                ('percentage', models.IntegerField(validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(50)], verbose_name='Percentage')),
                ('is_active', models.BooleanField(default=False, verbose_name='Being Active')),
                ('start_date', models.DateTimeField(verbose_name='Start Date')),
                ('expiry_date', models.DateTimeField(verbose_name='Expiry Date')),
            ],
            options={
                'verbose_name': 'Discount',
                'verbose_name_plural': 'Discounts',
            },
        ),
        migrations.CreateModel(
            name='FoodCategory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('category', models.CharField(max_length=100, verbose_name='Category')),
                ('slug', models.SlugField(blank=True, null=True, unique=True, verbose_name='Slug')),
                ('image', models.ImageField(upload_to=main.models.upload_to, verbose_name='Image')),
                ('parent', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='parent_FoodCategory', to='main.foodcategory', verbose_name='Parent')),
            ],
            options={
                'verbose_name': 'Category',
                'verbose_name_plural': 'Categories',
            },
        ),
        migrations.CreateModel(
            name='Food',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('food', models.CharField(max_length=100, verbose_name='Food')),
                ('price', models.PositiveIntegerField(default=0, verbose_name='Price')),
                ('slug', models.SlugField(blank=True, null=True, unique=True, verbose_name='Slug')),
                ('ingredient', models.TextField(blank=True, null=True, verbose_name='Ingredient')),
                ('is_active', models.BooleanField(default=True, verbose_name='Being Active')),
                ('image', models.ImageField(upload_to=main.models.upload_to, verbose_name='Image')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created at')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Updated at')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='categories_Food', to='main.foodcategory', verbose_name='Category')),
            ],
            options={
                'verbose_name': 'Food',
                'verbose_name_plural': 'Foods',
            },
        ),
        migrations.CreateModel(
            name='Gallery',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(upload_to=main.models.upload_to, verbose_name='Image')),
                ('gallery', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='galleries_Gallery', to='main.food', verbose_name='Food')),
            ],
            options={
                'verbose_name': 'Gallery',
                'verbose_name_plural': 'Galleries',
            },
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('order_type', models.CharField(choices=[('in_person', 'In-Person'), ('online', 'Online')], max_length=10, verbose_name='Order Type')),
                ('payment_method', models.CharField(max_length=50, verbose_name='Payment Method')),
                ('payment_status', models.CharField(max_length=20, verbose_name='Payment Status')),
                ('total_amount', models.PositiveIntegerField(verbose_name='Total Amount')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Create at')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='users_Order', to=settings.AUTH_USER_MODEL, verbose_name='User')),
            ],
            options={
                'verbose_name': 'Order',
                'verbose_name_plural': 'Orders',
            },
        ),
        migrations.CreateModel(
            name='OrderItem',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.PositiveIntegerField(default=1, verbose_name='Quantity')),
                ('price', models.CharField(max_length=30, verbose_name='Price')),
                ('food', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='foods_OrderItem', to='main.food', verbose_name='Food')),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='orders_OrderItem', to='main.order', verbose_name='Order')),
            ],
            options={
                'verbose_name': 'OrderItem',
                'verbose_name_plural': 'OrderItems',
            },
        ),
        migrations.AddField(
            model_name='order',
            name='food_items',
            field=models.ManyToManyField(through='main.OrderItem', to='main.food', verbose_name='Food Items'),
        ),
        migrations.CreateModel(
            name='Reservation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number_of_people', models.IntegerField(verbose_name='Number Of People')),
                ('number_of_tables', models.IntegerField(verbose_name='Number Of Tables')),
                ('start_date', models.DateTimeField(verbose_name='Start Date')),
                ('end_date', models.DateTimeField(verbose_name='End Date')),
                ('reservation_date', models.DateTimeField(auto_now_add=True, verbose_name='Reservation Date')),
                ('description', models.TextField(blank=True, null=True, verbose_name='Description')),
                ('is_approved', models.BooleanField(default=False, verbose_name='Being Approved')),
                ('approved_date', models.DateTimeField(blank=True, null=True, verbose_name='Approved Date')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='users_Reservation', to=settings.AUTH_USER_MODEL, verbose_name='User')),
            ],
            options={
                'verbose_name': 'Reservation',
                'verbose_name_plural': 'Reservations',
            },
        ),
        migrations.CreateModel(
            name='Review',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('review', models.TextField(verbose_name='Review')),
                ('is_active', models.BooleanField(default=False, verbose_name='Being Active')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Create at')),
                ('admin', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='admins_Review', to=settings.AUTH_USER_MODEL, verbose_name='Admin')),
                ('food', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='foods_Review', to='main.food', verbose_name='Food')),
                ('parent', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='parent_Review', to='main.review', verbose_name='Parent')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='users_Review', to=settings.AUTH_USER_MODEL, verbose_name='User')),
            ],
            options={
                'verbose_name': 'Review',
                'verbose_name_plural': 'Reviews',
            },
        ),
    ]
