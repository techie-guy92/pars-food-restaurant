from rest_framework import serializers
from django.db import transaction
import logging
from .models import *

#============================================== Logger =====================================================

logger = logging.getLogger("django")


#==================================== Food Category Serializer =============================================

class FoodCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = FoodCategory
        fields = "__all__"
    

#==================================== Food Serializer ======================================================

class FoodSerializer(serializers.ModelSerializer):
    class Meta:
        model = Food
        fields = "__all__"


#==================================== Order Item Serializer ================================================

class OrderItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderItem
        fields = ["food", "quantity"]
        
            
#==================================== Online Order Serializer ==============================================

class OrderSerializer(serializers.ModelSerializer):
    discount = serializers.CharField(max_length=10, write_only=True, required=False)
    order_items = OrderItemSerializer(many=True, write_only=True)

    class Meta:
        model = Order
        fields = ["order_items", "discount"]

    def create(self, validated_data):
        order_items_data = validated_data.pop("order_items")
        discount_code = validated_data.pop("discount", None)
        request = self.context.get("request")
        validated_data["online_customer"] = request.user
        validated_data["order_type"] = "online"
        validated_data["payment_method"] = "online"

        try:
            with transaction.atomic():
                order = Order.objects.create(**validated_data)
                for order_item_data in order_items_data:
                    OrderItem.objects.create(order=order, **order_item_data)
                
                order.calculate_order_items()

                discount_message = None
                if discount_code:
                    try:
                        discount = Discount.objects.get(code=discount_code, is_active=True)
                        discount_amount = order.total_amount * (discount.percentage / 100)
                        order.discount_amount = discount_amount
                        order.total_amount -= discount_amount
                        discount_message = f"سفارش شما ثبت شد و مبلغ {discount_amount} از فاکتور شما کاهش یافت."
                    except Discount.DoesNotExist:
                        raise serializers.ValidationError("کد تخفیف صحیح نمی باشد.")

                order.save()
                
                response_data = self.to_representation(order)
                ordered_message = f"سفارش شما ثبت شد."
                if discount_message:
                    response_data["message"] = discount_message
                else:
                    response_data["message"] = ordered_message
                    
                return response_data
            
        except Exception as error:
            logger.error("Error occurred during order creation: %s", error)
            raise serializers.ValidationError({"error": error.detail[0]})

        
#==================================== Reservation Serializer ===============================================

class ReservationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Reservation
        fields = ["start_date", "end_date", "number_of_people", "number_of_tables", "description"]
        
    def create(self, validated_data):
        reservation = Reservation.objects.create(**validated_data)
        return reservation


# ==========================================================================================================
