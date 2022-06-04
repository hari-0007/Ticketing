from __future__ import unicode_literals
import uuid
from weakref import ReferenceType 
from django.db import models
from organization_datas.models import OrganizationModel
from six import python_2_unicode_compatible

# Create your models here.

@python_2_unicode_compatible

class UserModel(models.Model):
    PRIVILEGE_CHOICES = (
        ('ViewUser', 'ViewUser'),
        ('Admin', 'Admin'),
    )

    user_name = models.CharField(max_length=500, unique=True)
    user_email = models.EmailField(max_length=200, unique=True)
    user_privilege = models.CharField(max_length = 10, choices=PRIVILEGE_CHOICES, default = 'ViewUser')
    user_belongs_to = models.CharField(max_length=500)
    user_id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
        
class UserMainModel(models.Model):
    method = models.CharField(max_length=200)
    organization_id = models.ForeignKey(OrganizationModel, on_delete=models.CASCADE)
    access_key = models.CharField(max_length=100)