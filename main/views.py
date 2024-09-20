from rest_framework import status, viewsets
from rest_framework.response import Response
from rest_framework import generics
from rest_framework.permissions import IsAdminUser, IsAuthenticated, IsAuthenticatedOrReadOnly
from rest_framework.pagination import PageNumberPagination
from rest_framework.filters import SearchFilter
from rest_framework.decorators import action
from drf_spectacular.utils import extend_schema
from django.http import JsonResponse
from datetime import datetime
from .models import *
from .serializers import *

#==================================== admin View ======================================================

def get_food_price(request, food_id):
    food = Food.objects.get(id=food_id)
    return JsonResponse({"price": food.price})


#==================================== Food Category View ===================================================

class FoodCategoryModelViewSet(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticatedOrReadOnly]
    queryset = FoodCategory.objects.all().order_by("parent")
    serializer_class = FoodCategorySerializer
    http_method_names = ["get"]
    pagination_class = PageNumberPagination
    filter_backends = [SearchFilter]
    search_fields = ["id", "slug"]
    

#==================================== Food View ============================================================

class FoodModelModelViewSet(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticatedOrReadOnly]
    queryset = Food.objects.filter(is_active=True).order_by("-price")
    serializer_class = FoodSerializer
    http_method_names = ["get"]
    pagination_class = PageNumberPagination
    filter_backends = [SearchFilter]
    search_fields = ["id", "slug"] 

    
#==================================== Online Order View ====================================================

class OrderViewSet(viewsets.ViewSet):
    permission_classes = [IsAuthenticated]
    @extend_schema(
        request = OrderSerializer,
        responses = {201: OrderSerializer}
    )
    
    def create(self, request, *args, **kwargs):
        serializer = OrderSerializer(data=request.data, context={"request": request})
        if serializer.is_valid():
            response_data = serializer.save()
            return Response(response_data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


#==================================== Reservation View =====================================================

class ReservationViewSet(viewsets.ViewSet):
    permission_classes = [IsAuthenticated]
    @extend_schema(
        request = ReservationSerializer,
        responses = {201: ReservationSerializer}
    )
    def create(self, request, *args, **kwargs):
        serializer = ReservationSerializer(data=request.data)
        if serializer.is_valid():
            self.perform_create(serializer, request)
            return Response({"message": "درخواست رزرو شما ثبت شد، پس از تایید رستوان برای شما ایمیل تایید ارسال خواهد شد"}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def perform_create(self, serializer, request):
        serializer.save(user=request.user)

            
# ==========================================================================================================
