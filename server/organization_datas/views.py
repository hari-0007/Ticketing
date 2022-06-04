from django.shortcuts import render
from redis import AuthenticationError
from rest_framework.generics import CreateAPIView
from rest_framework.permissions import AllowAny
from .serializers import *
from random import randint
from rest_framework import generics
import coreapi
from django.views.decorators.csrf import csrf_exempt
import json
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.exceptions import AuthenticationFailed
from rest_framework.response import Response

# Create your views here.
@csrf_exempt
@api_view(['POST'])
def organizationView(request):
    if request.method == 'POST':

        serializer = OrganizationSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()

        return Response({"result": "Successfully Inserted"}, status=status.HTTP_201_CREATED)

class UpdateOrganizationAPIView(generics.GenericAPIView):
    serializer_class = UpdateOrganizationSerializer

    def patch(self, request):
        serializer = self.serializer_class(data=request.data)   
        serializer.is_valid(raise_exception=True)
        serializer.save()
    
        return Response({"result": "Successfully Inserted"}, status=status.HTTP_201_CREATED)