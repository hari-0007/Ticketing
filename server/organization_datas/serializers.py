from httplib2 import Authentication
from pyparsing import Or
from redis import AuthenticationError
from rest_framework import serializers
from drf_writable_nested.serializers import WritableNestedModelSerializer
from rest_framework.validators import UniqueValidator
from rest_framework.exceptions import AuthenticationFailed
from .models import *

class BranchSerializer(serializers.ModelSerializer):
    # branch_name = serializers.CharField(validators=[UniqueValidator(queryset=BranchModel.objects.all(),message=("Name already exists"))])
    # branch_document = UploadFileSerializer(many=True)
    
    class Meta:
        model = BranchModel
        fields = [
            "branch_name",
            "branch_email",
            "branch_phone_number",
            "branch_address",
            "branch_country",
            "branch_pincode",
            "branch_document"
        ]

    # def validate(self, attrs):
    #     branch_name = attrs.get('branch_name')
    #     print(branch_name)
    #     check = BranchModel.objects.filter(branch_name=branch_name)
    #     if check:
    #         valid = BranchModel.objects.filter(organization_id = attrs['organization_id'])
    #         if valid:
    #             raise AuthenticationFailed("Branch Name is already exit!!")
    #     return super().validate(attrs)

class OrganizationSerializer(WritableNestedModelSerializer):
    branches = BranchSerializer(many=True)
    # organization_name = serializers.CharField(validators=[UniqueValidator(queryset=OrganizationModel.objects.all(),message=("Name already exists"))])
    # organization_document = UploadFileSerializer(many=True)
    
    class Meta:
        model = OrganizationModel
        fields = [
            "method",
            "organization_name",
            "Display_name",
            "organization_email",
            "organization_phone_number",
            "organization_address",
            "organization_country",
            "organization_pincode",
            "organization_document",
            "token", 
            "access_key",
            "branches",
        ]

    def create(self, validated_data):
        album = validated_data.pop('branches')
        user = OrganizationModel.objects.create(**validated_data)
        for album_data in album:
            BranchModel.objects.create(**album_data, organization_id = user)
        return user

class UpdateBranchSerializer(serializers.Serializer):
    # branch_name = serializers.CharField(validators=[UniqueValidator(queryset=BranchModel.objects.all(),message=("Name already exists"))])
    branch_name = serializers.CharField(min_length=6, max_length=300)
    branch_email = serializers.EmailField(min_length=6, max_length=200, allow_null=True)
    branch_phone_number = serializers.CharField(min_length=6, max_length=50, allow_null=True)
    branch_address = serializers.CharField(min_length=6, max_length=700, allow_null=True)
    branch_country = serializers.CharField(min_length=2, max_length=100, allow_null=True)
    branch_pincode = serializers.IntegerField()
    branch_document = serializers.CharField(min_length=6, max_length=500, allow_null=True)
    # branch_document = UploadFileSerializer(many=True)
    
    class Meta:
        model = BranchModel
        fields = [
            "branch_name",
            "branch_email",
            "branch_phone_number",
            "branch_address",
            "branch_country",
            "branch_pincode",
            "branch_document"
        ]

    # def validate(self, attrs):
    #     branch_name = attrs.get('branch_name')
    #     print(branch_name)
    #     check = BranchModel.objects.filter(branch_name=branch_name)
    #     if check:
    #         valid = BranchModel.objects.filter(organization_id = attrs['organization_id'])
    #         if valid:
    #             raise AuthenticationFailed("Branch Name is already exit!!")
    #     return super().validate(attrs)

class UpdateOrganizationSerializer(WritableNestedModelSerializer):
    branches = BranchSerializer(many=True)
    organization_name = serializers.CharField(min_length=6, max_length=500)
    organization_id = serializers.CharField(min_length = 6, max_length= 35)
    Display_name = serializers.CharField(min_length=6, max_length=200, allow_null=True)
    organization_email = serializers.EmailField(min_length=6, max_length=200, allow_null=True)
    organization_phone_number = serializers.CharField(min_length=6, max_length=50, allow_null=True)
    organization_address = serializers.CharField(min_length=6, max_length=700, allow_null=True)
    organization_country = serializers.CharField(min_length=2, max_length=100, allow_null=True)
    organization_pincode = serializers.IntegerField()
    organization_document = serializers.CharField(min_length=6, max_length=500, allow_null=True)
    # organization_document = UploadFileSerializer(many=True)
    
    class Meta:
        model = OrganizationModel
        fields = [
            "organization_name",
            "organization_id",
            "Display_name",
            "organization_email",
            "organization_phone_number",
            "organization_address",
            "organization_country",
            "organization_pincode",
            "organization_document",
            "branches",
        ]

    def validate(self, attrs):
        organization_name = attrs.get('organization_name')
        user = OrganizationModel.objects.filter(organization_name=organization_name)
        if not user:
            raise AuthenticationFailed("Organization Name Can't be Update!!")
        return super().validate(attrs)

    def create(self, validated_data):
        album = validated_data.pop('branches')
        user =OrganizationModel.objects.create(organization_id = OrganizationModel.objects.filter(organization_id = validated_data['organization_id']))
        print(user)
        for album_data in album:
            check = BranchModel.objects.filter(branch_name = album_data['branch_name'])
            print(check)
            if not check:
                BranchModel.objects.create(**album_data, organization_id = user)
            BranchModel.objects.update(branch_email = album_data['branch_email'],
                                            branch_phone_number = album_data['branch_phone_number'], 
                                            branch_address = album_data['branch_address'],
                                            branch_country = album_data['branch_country'],
                                            branch_pincode = album_data['branch_pincode'],
                                            branch_document = album_data['branch_document']
                                        )
        return OrganizationModel.objects.update(Display_name = validated_data['Display_name'],
                                                organization_email = validated_data['organization_email'],
                                                organization_phone_number = validated_data['organization_phone_number'], 
                                                organization_address = validated_data['organization_address'],
                                                organization_country = validated_data['organization_country'],
                                                organization_pincode = validated_data['organization_pincode'],
                                                organization_document = validated_data['organization_document']
                                            )  