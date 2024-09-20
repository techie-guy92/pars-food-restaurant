from django.contrib import admin
from django.contrib.admin import SimpleListFilter
from django.db.models import Q
from .models import *


#===================================== Actions ==================================================

def instance_deactivator(modeladmin, request, queryset):
    res = queryset.update(is_active=False)
    model_name = modeladmin.model._meta.verbose_name_plural
    message = f"{res} {model_name} were deactivated"
    modeladmin.message_user(request, message) 

def instance_activator(modeladmin, request, queryset):
    res = queryset.update(is_active=True)
    model_name = modeladmin.model._meta.verbose_name_plural
    message = f"{res} {model_name} were activated"
    modeladmin.message_user(request, message)


#==================================== Food Category Admin ========================================

class CategoryFilter(SimpleListFilter):
    title = "Food Categories"
    parameter_name = "category"
    
    def lookups(self, request, model_admin):
        sub_categories = FoodCategory.objects.filter(~Q(parent=None))   
        categories = set([category.parent for category in sub_categories])   
        return [(obj.id, obj.category) for obj in categories]
    
    def queryset(self, request, queryset):
        if self.value():
            return queryset.filter(parent=self.value())    
        return queryset
    

@admin.register(FoodCategory)
class FoodCategoryAdmin(admin.ModelAdmin):
    list_display = ("slug", "id", "parent",)
    list_filter = (CategoryFilter,)
    ordering = ("parent",)
    ordering = ("parent",)
    search_fields = ("parent",)


#==================================== Food Admin ===================================================

@admin.register(Food)
class FoodAdmin(admin.ModelAdmin):
    list_display = ("slug", "id", "food", "category", "price", "is_active", "created_at",)
    list_filter = ("is_active",)
    ordering = ("price",)
    search_fields = ("slug",)
    list_editable = ("is_active",)
    exclude = ("is_active", "ingredient",)
    actions = (instance_deactivator, instance_activator,)
    
    def get_actions(self, request):
        actions = super().get_actions(request)
        actions["instance_deactivator"] = (instance_deactivator, "instance_deactivator", 
                                           f"Deactivate selected {self.model._meta.verbose_name_plural}")
        actions["instance_activator"] = (instance_activator, "instance_activator", 
                                         f"Activate selected {self.model._meta.verbose_name_plural}")
        return actions

    
#==================================== Gallery Admin ================================================

@admin.register(Gallery)
class GalleryAdmin(admin.ModelAdmin):
    list_display = ("image",)
    
    
#==================================== Discount Admin ===============================================

@admin.register(Discount)
class DiscountAdmin(admin.ModelAdmin):
    list_display = ("code", "percentage", "start_date", "expiry_date", "is_active",)
    list_filter = ("percentage", "is_active", "start_date", "expiry_date",)
    ordering = ("percentage",)
    search_fields = ("percentage",)
    list_editable = ("is_active",)
    readonly_fields = ("code",)     
    exclude = ("is_active",)
    actions = (instance_deactivator, instance_activator,)
    
    def get_actions(self, request):
        actions = super().get_actions(request)
        actions["instance_deactivator"] = (instance_deactivator, "instance_deactivator", 
                                           f"Deactivate selected {self.model._meta.verbose_name_plural}")
        actions["instance_activator"] = (instance_activator, "instance_activator", 
                                         f"Activate selected {self.model._meta.verbose_name_plural}")
        return actions
        
        
#==================================== Order Admin ===================================================

class OrderItemInline(admin.TabularInline):
    model = OrderItem
    extra = 1
    readonly_fields = ("grand_total", "price",)
    
    def price(self, obj):
        return obj.item_price()
    
    def get_fieldsets(self, request, obj=None):
        return [
            ("Order items", {"fields": ("food", "price", "quantity", "grand_total",)}),
        ]
    
@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ("id", "customer", "payment_amount", "total_amount", "discount_amount", "order_type", 
                    "payment_status", "payment_method", "created_at",)
    list_filter = ("order_type", "payment_method", "payment_status",)
    ordering = ("created_at",)
    search_fields = ("created_at",)
    readonly_fields = ("total_amount",)
    exclude = ("order_type", "payment_status",)
    inlines = [OrderItemInline]
    
    def customer(self, obj):
        return obj.customer()
    
    def get_fieldsets(self, request, obj=None):
        return [
            ("Order Payment", {"fields": ("in_person_customer", "payment_method", "total_amount",)}),
        ]
        
    def save_model(self, request, obj, form, change):
        if not obj.pk:
            obj.order_type = "in_person"
            super().save_model(request, obj, form, change)   

    class Media :
        js = (
            "https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js",
            "js/admin_orders.js",
        )
        
        
#==================================== Order Item Admin ================================================

@admin.register(OrderItem)
class OrderItemAdmin(admin.ModelAdmin):
    list_display = ("id", "food", "order", "price", "quantity", "grand_total",)
    list_filter = ("food", "order",)
    search_fields = ("food__food", "order__user__username",)
    readonly_fields = ("grand_total", "item_price",)
        
    def price(self, obj):
        return obj.item_price()
    
    
#==================================== Review Admin ===================================================

@admin.register(Review)
class ReviewAdmin(admin.ModelAdmin):
    list_display = ("id", "review", "parent", "is_active", "created_at",)
    list_editable = ("is_active",)
    actions = (instance_deactivator, instance_activator,)
    
    def get_actions(self, request):
        actions = super().get_actions(request)
        actions["instance_deactivator"] = (instance_deactivator, "instance_deactivator", 
                                           f"Deactivate selected {self.model._meta.verbose_name_plural}")
        actions["instance_activator"] = (instance_activator, "instance_activator", 
                                         f"Activate selected {self.model._meta.verbose_name_plural}")
        return actions
    
    
#==================================== Holiday Admin ===================================================
@admin.register(Holiday)
class HolidayAdmin(admin.ModelAdmin):
    list_display = ("date", "description",)
    ordering = ("date",)
    search_fields = ("date",)
    
    
#==================================== Reservation Admin ================================================

@admin.register(Reservation)
class ReservationAdmin(admin.ModelAdmin):
    list_display = ("id", "user", "number_of_people", "number_of_tables", "start_date", "end_date", "reservation_date", 
                    "description", "price", "is_approved", "order_status", "available_tables", "approved_date",)
    list_filter = ("is_approved", "reservation_date", "approved_date",)
    ordering = ("reservation_date",)
    search_fields = ("user", "reservation_date", "approved_date",)
    list_editable = ("is_approved",)
    readonly_fields = ("price",)
    exclude = ("approved_date",)

    def get_fieldsets(self, request, obj=None):
        return [
            ("Customer", {"fields": ("user",)}),
            ("Order", {"fields": ("start_date", "end_date", "number_of_people", "number_of_tables", "description",)}),
            ("Order Status", {"fields": ("price", "is_approved",)}),
        ]
        
    def available_tables(self, obj):
        return obj.get_available_tables()
    
    class Media :
        js = (
            "https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js",
            "js/admin_reservation.js",
        )

#=========================================================================================================
