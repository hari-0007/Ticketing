from email import message
from attr import attr
from rest_framework import serializers
from drf_writable_nested.serializers import WritableNestedModelSerializer
from sqlalchemy import null
from rest_framework_simplejwt.tokens import RefreshToken, TokenError
from .models import *
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.utils.encoding import force_bytes, force_str
from . tokens import generate_random_password
from django.conf import settings
from django.core.mail import send_mail
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from rest_framework.exceptions import AuthenticationFailed
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer

class ChoiceField(serializers.ChoiceField):

    def to_representation(self, obj):
        if obj == '' and self.allow_blank:
            return obj
        return self._choices[obj]

    def to_internal_value(self, data):
        # To support inserts with the value
        if data == '' and self.allow_blank:
            return ''

        for key, val in self._choices.items():
            if val == data:
                return key
        self.fail('invalid_choice', input=data)

class SelfUserSerializer(serializers.ModelSerializer):
    # option = ChoiceField(choices=SelfUserModel.ADMIN_PRIVILEGE)
    privilege = ChoiceField(choices=SelfUserModel.PRIVILEGE_CHOICES)
    designation = ChoiceField(choices=SelfUserModel.DESIGNATION_CHOICES)
    level = ChoiceField(choices=SelfUserModel.LEVEL_CHOICES)

    class Meta:
        model = SelfUserModel
        fields = [
            "username",
            "email",
            "privilege",
            "belongs_to",
            "designation",
            "level",
        ]

class SelfSerializer(WritableNestedModelSerializer):
    params = SelfUserSerializer(many=True)
    
    class Meta:
        model = SelfModel
        fields = [
            "method",
            # "user_id",
            "params", 
            "access_key",
        ]

    def create(self, validated_data):
        album = validated_data.pop('params')
        for album_data in album:
            SelfUserModel.objects.create(**album_data)
        return SelfModel.objects.create(**validated_data)

class SetNewPasswordSerializer(serializers.Serializer):
    username = serializers.CharField(min_length=6, max_length=150)
    new_password = serializers.CharField(min_length=6, max_length=68, write_only=True)
    password = serializers.CharField(min_length=6, max_length=68, write_only=True)
    token = serializers.CharField()

    class Meta:
        model = SelfUserModel
        fields = [
            'username', 
            'password',
            'new_password',
            'token',
        ]

    def create(self, validated_data):
        return SelfUserModel.objects.update(password = validated_data['new_password'])

class UpdateUserSerializer(serializers.Serializer):
    username = serializers.CharField(min_length=6, max_length=150, allow_null=True)
    email = serializers.EmailField(min_length=4, max_length=150, allow_null=True)
    belongs_to = serializers.CharField(min_length=5, max_length=200, allow_null=True)
    privilege = ChoiceField(choices=SelfUserModel.PRIVILEGE_CHOICES)
    designation = ChoiceField(choices=SelfUserModel.DESIGNATION_CHOICES)
    level = ChoiceField(choices=SelfUserModel.LEVEL_CHOICES)

    class Meta:
        model = SelfUserModel
        fields = [
            'username',
            'email',
            'belongs_to',
            'privilege',
            'designation',
            'level',
        ]

    def create(self, validated_data):
        return SelfUserModel.objects.update(**validated_data)

class LogoutSerializer(serializers.Serializer):
    token = serializers.CharField()

    class Meta:
        model = TokenModel
        fields = [
            'token',
        ]

    def create(self, validated_data):
        BlacklistModel.objects.create(**validated_data)
        return TokenModel.objects.filter(**validated_data).delete()