from rest_framework import status, viewsets
from rest_framework.views import APIView
from rest_framework import generics
from rest_framework.response import Response
from rest_framework.permissions import IsAdminUser, IsAuthenticated
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.pagination import PageNumberPagination
from rest_framework.filters import SearchFilter
from django.core.mail import send_mail
from django.contrib.auth import authenticate
from drf_spectacular.utils import extend_schema
from django.shortcuts import get_object_or_404
from django.conf import settings
from .models import *
from .serializers import *

#======================================= Needed Methods ===========================================

def email_sender(Subject, Message, HTML_Content, To):
    Sending_From = settings.EMAIL_HOST_USER
    Message = EmailMultiAlternatives(Subject, Message, Sending_From, To)
    Message.attach_alternative(HTML_Content, "text/html")
    Message.send()


#======================================== Custom User View ========================================

class SignupAPIView(APIView):
    @extend_schema(
        request = CustomUserSerializer,
        responses = {201: CustomUserSerializer}
    )
    
    def post(self, request):
        email = request.data.get("email")
        if CustomUser.objects.filter(email=email).exists():
            return Response({"error": "ایمیل مورد نظر ثبت نام کرده است"}, status=status.HTTP_400_BAD_REQUEST)
        
        serializer = CustomUserSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            token = RefreshToken.for_user(user).access_token
            domain = settings.ALLOWED_HOSTS[0]
            verification_link = f"http://{domain}/verify-email?token={str(token)}"
            subject = "Verify your email"
            message = f"Click the link to verify your email: {verification_link}"
            html_content = f"<p>Hello Dear {user.first_name} {user.last_name}<br><br></p><p>Click the link to verify your email: <a href='{verification_link}'>Verify Email</a></p>"
            email_sender(subject, message, html_content, [user.email])
            return Response({'message': "اطلاعات شما ثبت شد، برای تکمیل فرایند ثبت نام به ایمیل خود بروید و ایمل تایید را تایید کنید."}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


#======================================= Verify Email View ====================================

class VerifyEmailAPIView(APIView):    
    def get(self, request):
        token = request.GET.get("token")
        if not token:
            return Response({"error": "توکن ارسال نشده است."}, status=status.HTTP_400_BAD_REQUEST)
        
        try:
            payload = RefreshToken(token).payload
            user_id = payload["user_id"]
            user = CustomUser.objects.get(id=user_id)
            user.is_active = True
            user.save()
            return Response({"message": "ثبت نام شما کامل شد."}, status=status.HTTP_200_OK)
        
        except CustomUser.DoesNotExist:
            return Response({"error": "ایمیل مورد نظر یافت نشد، دوباره ثبت نام کنید"}, status=status.HTTP_404_NOT_FOUND)
        except Exception as error:
            return Response({"error": str(error)}, status=status.HTTP_400_BAD_REQUEST)
        

class ResendVerificationEmailAPIView(APIView):
    def post(self, request):
        email = request.data.get("email")
        try:
            user = CustomUser.objects.get(email=email)
            if user.is_active:
                return Response({"message": "ایمیل شما قبلا تایید شده بوده است."}, status=status.HTTP_200_OK)
            
            token = RefreshToken.for_user(user).access_token
            domain = settings.ALLOWED_HOSTS[0]
            verification_link = f"http://{domain}/verify-email?token={str(token)}"
            subject = "Verify your email"
            message = f"Click the link to verify your email: {verification_link}"
            html_content = f"<p>Click the link to verify your email: <a href='{verification_link}'>Verify Email</a></p>"
            email_sender(subject, message, html_content, [user.email])
            return Response({"message": "ایمیل تایید دوباره ارسال شد."}, status=status.HTTP_200_OK)
        
        except CustomUser.DoesNotExist:
            return Response({"error": "ایمیل مورد نظر یافت نشد، دوباره ثبت نام کنید"}, status=status.HTTP_404_NOT_FOUND)


#======================================= User Profile View ======================================

class UserProfileAPIView(APIView):
    permission_classes = [IsAuthenticated]
    @extend_schema(
        request = UserProfileSerializer,
        responses = {201: UserProfileSerializer}
    )
    
    def post(self, request, format=None):
        serializer = UserProfileSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({"message": "اطلاعات شما تکمیل شد"}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
       
 
#======================================= Login View ============================================

class LoginAPIView(APIView):
    @extend_schema(
        request = LoginSerializer,
        responses = {201: LoginSerializer}
    )
    
    def post(self, request):
        serializer = LoginSerializer(data=request.data)
        if serializer.is_valid():
            email = serializer.validated_data["email"]
            password = serializer.validated_data["password"]
            user = authenticate(username=email, password=password)
            if user is not None:
                token = RefreshToken.for_user(user).access_token
                return Response({"token": str(token)}, status=status.HTTP_200_OK)
            return Response({"error": "نام کاربری و یا رمز عبور اشتباه است."}, status=status.HTTP_400_BAD_REQUEST)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    
#======================================= Fetch Users View ============================================

class FetchUsersGenericsView(generics.ListAPIView):
    permission_classes = [IsAdminUser]
    queryset = CustomUser.objects.all().order_by("id")
    serializer_class = FetchUsersSerializers
    pagination_class = PageNumberPagination
    filter_backends = [SearchFilter]
    search_fields = ["id", "first_name", "last_name", "email"]  


#======================================= Update User View ============================================

class UpdateUserAPIView(APIView):
    def put(self, request):
        user = request.user
        serializer = UpdateUserSerializer(user, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response({"message": "اطلاعات شما با موفقیت تغییر کرد."}, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


#======================================= Forget Password View ========================================

class PasswordResetAPIView(APIView):
    def post(self, request):
        serializer = PasswordResetSerializer(data=request.data)
        if serializer.is_valid():
            email = serializer.validated_data["email"]
            try:
                user = CustomUser.objects.get(email=email)
                token = RefreshToken.for_user(user).access_token
                domain = settings.ALLOWED_HOSTS[0]
                reset_link = f"http://{domain}/reset-password?token={str(token)}"
                subject = "Password Reset Request"
                message = f"Click the link to reset your password: {reset_link}"
                html_content = f"<p>Hello Dear {user.first_name} {user.last_name}<br><br></p><p>Click the link to reset your password: <a href='{reset_link}'>Reset your password</a></p>"
                email_sender(subject, message, html_content, [user.email])
                return Response({"message": "ایمیل تعییر رمز عبور ارسال شد."}, status=status.HTTP_200_OK)
            except CustomUser.DoesNotExist:
                return Response({"error": "ایمیل وارد شده معتبر نمی باشد."}, status=status.HTTP_404_NOT_FOUND)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class SetNewPasswordAPIView(APIView):
    def post(self, request):
        serializer = SetNewPasswordSerializer(data=request.data)
        if serializer.is_valid():
            token = serializer.validated_data["token"]
            password = serializer.validated_data["password"]
            try:
                payload = RefreshToken(token).payload
                user_id = payload["user_id"]
                user = CustomUser.objects.get(id=user_id)
                user.set_password(password)
                user.save()
                return Response({"message": "رمز عبور با موفقیت تغییر کرد."}, status=status.HTTP_200_OK)
            except CustomUser.DoesNotExist:
                return Response({"error": "کاربر یافت نشد."}, status=status.HTTP_404_NOT_FOUND)
            except Exception as error:
                return Response({"error": str(error)}, status=status.HTTP_400_BAD_REQUEST)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    
#=====================================================================================================
