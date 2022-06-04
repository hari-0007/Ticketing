from rest_framework import serializers
from drf_writable_nested.serializers import WritableNestedModelSerializer
from .models import *

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

class UserSerializer(serializers.ModelSerializer):
    user_privilege = ChoiceField(choices=UserModel.PRIVILEGE_CHOICES)

    class Meta:
        model = UserModel
        fields = [
            "user_name",
            "user_email",
            "user_privilege",
            "user_belongs_to",
            ]

class UserMainSerializer(WritableNestedModelSerializer):
    params = UserSerializer(many=True)
    
    class Meta:
        model = UserMainModel
        fields = [
            "method",
            "organization_id",
            "params", 
            "access_key",
            ]

    def create(self, validated_data):
        album = validated_data.pop('params')
        for album_data in album:
            UserModel.objects.create(**album_data)
        return UserMainModel.objects.create(**validated_data)
