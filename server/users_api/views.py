from lib2to3.pgen2 import token
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from regex import P
from rest_framework import status
from rest_framework.decorators import api_view 
from rest_framework.response import Response
from rest_framework.decorators import APIView
from .serializers import *
from list.settings import *
from drf_yasg.utils import swagger_auto_schema
from drf_yasg import openapi
import jwt
from django.http import HttpResponse  
from .utils import *
from django.urls import reverse
from rest_framework import viewsets
# from django.core.mail import EmailMessage
# from django.core.mail import send_mail
from datetime import timedelta
from django.utils import timezone
from .tokens import *
from django.contrib.sites.shortcuts import get_current_site
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework import generics, status, views, permissions
from rest_framework.exceptions import AuthenticationFailed
from django.utils.encoding import smart_bytes
from rest_framework_simplejwt.views import TokenObtainPairView
from datetime import datetime, timedelta

# Create your views here.

class SelfUserView(generics.ListCreateAPIView):
    serializer_class = SelfSerializer

    def post(self, request, *args, **kwargs):
        
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True) 
        serializer.save()

        return Response({"result": "success!!"}, status=status.HTTP_201_CREATED)

class LoginUserView(APIView):
    serializer_class = SelfUserSerializer

    def post(self, request):
        username = request.data['username']
        password = request.data['password']

        user = SelfUserModel.objects.filter(username=username, password=password).first()

        if user is None:
            raise AuthenticationFailed('User Not Found!!')

        else:
            payload = {
                'username': user.username,
                'exp': JWT_EXP_DELTA_SECONDS
            }
            print(JWT_EXP_DELTA_SECONDS)

            jwt_token = jwt.encode(payload, JWT_SECRET , JWT_ALGORITHM)
            TokenModel.objects.update_or_create(username=username, token = jwt_token, expired_time = JWT_EXP_DELTA_SECONDS)

            return Response({"token": jwt_token}, status=status.HTTP_200_OK)

class SetNewPasswordAPIView(generics.GenericAPIView):
    serializer_class = SetNewPasswordSerializer

    def patch(self, request):
        token = request.data['token']
        username = request.data['username']
        password = request.data['password']
        serializer = self.serializer_class(data=request.data)
        check = TokenModel.objects.filter(token=token).first()

        if check is None:
            raise AuthenticationFailed('Invalid Token!!')

        user = SelfUserModel.objects.filter(username=username, password=password).first()

        if user is None:
            raise AuthenticationFailed('Incorrect Password!!')
            
        serializer.is_valid(raise_exception=True)
        serializer.save()

        return Response({'success': True, 'message': 'Password reset successfully'}, status=status.HTTP_200_OK)

class UpdateUserAPIView(generics.GenericAPIView):
    serializer_class = UpdateUserSerializer

    def patch(self, request):
        serializer = self.serializer_class(data=request.data)   
        serializer.is_valid(raise_exception=True)
        serializer.save()
    
        return Response({'success': True, 'message': 'Update your Profile successfully!!'}, status=status.HTTP_200_OK)

class LogoutUser(APIView):
    serializer_class = LogoutSerializer
    def get(self, request):
        token = request.data['token']
        serializer = self.serializer_class(data = request.data)
        user = TokenModel.objects.filter(token=token).first()

        if user is None:
            raise AuthenticationFailed('Already Exit!!')
            
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({'message': 'Logout successfully!!'}, status=status.HTTP_200_OK)