from django.urls import path, re_path
from rest_framework.routers import DefaultRouter
from .views import (get_food_price, FoodCategoryModelViewSet, 
                    FoodModelModelViewSet, OrderViewSet, ReservationViewSet,  )

router = DefaultRouter()
router.register(r"categories", FoodCategoryModelViewSet, basename="food-categories")
router.register(r"foods", FoodModelModelViewSet, basename="foods")
router.register(r"orders", OrderViewSet, basename="place-orders")
router.register(r"reservations", ReservationViewSet, basename="make-reservations")

urlpatterns = [
    path("get_food_price/<int:food_id>/", get_food_price, name="get_food_price"),
]

urlpatterns += router.urls