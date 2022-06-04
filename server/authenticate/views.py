from django.shortcuts import render
# from requests import request

# Create your views here.
from rest_framework.generics import CreateAPIView, GenericAPIView
from rest_framework.authentication import SessionAuthentication, BasicAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.permissions import AllowAny
from .serializers import *
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import APIView
from rest_framework import status
from django.contrib.auth import authenticate, login
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from .token_auth import token_expire_handler, expires_in
from rest_framework.exceptions import AuthenticationFailed

class RegisterAdminView(CreateAPIView):
    permission_classes = ([AllowAny])
    serializer_class = ProfileSerializer

    def post(self, request):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({'success' : 'True','data' : serializer.data, 'message': 'User registered successfully'}, status=status.HTTP_201_CREATED)

class LoginAdminView(APIView):
    serializer_class = SuperAdminSerializer
    def post(self, request):
        username = request.data['username']
        password = request.data['password']

        user = User.objects.filter(username=username, password=password).first()

        if user is None:
            raise AuthenticationFailed('User not found!')

        token,_ = Token.objects.get_or_create(user=user)
        is_expired, token = token_expire_handler(token) 
        return Response({"token":token.key, "expires_in": expires_in(token),}, status=status.HTTP_200_OK)