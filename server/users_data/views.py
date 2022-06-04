from django.shortcuts import render
from rest_framework import generics
from rest_framework.permissions import AllowAny
from .serializers import *
from random import randint
from rest_framework import status
from rest_framework.response import Response

# Create your views here.

class UserView(generics.ListCreateAPIView):
    serializer_class = UserMainSerializer

    def post(self, request):

        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({"result": "Successfully Inserted"}, status=status.HTTP_201_CREATED)
        