from rest_framework import serializers
from drf_writable_nested.serializers import WritableNestedModelSerializer
from .models import *
from rest_framework.authtoken.models import Token
from django.db.models import Q
from django.contrib.auth import authenticate
from rest_framework import exceptions
from rest_framework.exceptions import AuthenticationFailed

class SuperAdminSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email', 'username', 'password',)

class ProfileSerializer(WritableNestedModelSerializer):
    # Direct ManyToMany relation
    params = SuperAdminSerializer(many=True)

    class Meta:
        model = Profile
        fields = ('method','params','access_key',)

    def create(self, validated_data):
        tracks_data = validated_data.pop('params')
        for track_data in tracks_data:
            User.objects.create(**track_data)
        return Profile.objects.create(**validated_data)
