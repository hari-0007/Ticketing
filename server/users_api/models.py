from __future__ import unicode_literals
import datetime
import uuid
from django.db import models
from users_data.models import UserModel
from list.settings import *
from six import python_2_unicode_compatible
# from .utils import generate_random_string as user_id_generator
from .tokens import generate_random_password as password, validate_email

# Create your models here.

@python_2_unicode_compatible

class SelfUserModel(models.Model):
    
    PRIVILEGE_CHOICES = (
        ('', ''),
        ('TechnicalUser', 'TechnicalUser'),
        ('AdminUser', 'Admin'),
    )

    DESIGNATION_CHOICES = (
        ('', ''),
        ('Network Admin', 'Network Admin'),
        ('Network Technician', 'Network Technician'),
        ('Server Admin', 'Server Admin'),
        ('System Admin', 'System Admin'),
        ('System Engineer', 'System Engineer'),
    )

    LEVEL_CHOICES = (
        ('', ''),
        ('level_1', 'level_1'),
        ('level_2', 'level_2'),
        ('level_3', 'level_3'),
        ('level_4', 'level_4'),
        ('level_5', 'level_5'),
        ('level_6', 'level_6'),
        ('level_7', 'level_7'),
        ('level_8', 'level_8'),
        ('level_9', 'level_9'),
        ('level_10', 'level_10'),
    )
    
    user_id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    username = models.CharField(max_length=500, unique=True)
    email = models.EmailField(max_length=200, unique=True)
    belongs_to = models.CharField(max_length=500)
    privilege = models.CharField(max_length = 20, choices=PRIVILEGE_CHOICES)
    designation = models.CharField(max_length=200, choices=DESIGNATION_CHOICES, default = '')
    level = models.CharField(max_length=20, choices=LEVEL_CHOICES, default = '')
    password = models.CharField(max_length = 500)
    timestamp = models.DateTimeField(auto_now=True)
    # user_id = models.CharField(max_length=35, auto_created=True, editable=False, unique=True, primary_key=True)

    # def save(self, force_insert=False, force_update=False, using=None, update_fields=None):
    #     if not self.user_id:
    #         # Generate ID once, then check the database. If exists, keep trying.
    #         self.user_id = user_id_generator()
    #         while SelfUserModel.objects.filter(user_id=self.user_id).exists():
    #             self.user_id = user_id_generator()
    #     super(SelfUserModel, self).save(force_insert, force_update, using, update_fields)       
        
    def save(self, force_insert=False, force_update=False, using=None, update_fields=None):
        if not self.password:
            # Generate ID once, then check the database. If exists, keep trying.
            self.password = password(self.password)
            while SelfUserModel.objects.filter(password=self.password).exists():
                self.password = password(self.password)
        
        validate_email(self.password, self.email)
        super(SelfUserModel, self).save(force_insert, force_update, using, update_fields)       

class SelfModel(models.Model):

    method = models.CharField(max_length=200)
    # user_id = models.ForeignKey(UserModel, on_delete=models.CASCADE)
    access_key = models.CharField(max_length=100)

class TokenModel(models.Model):
    username = models.CharField(max_length=150)
    token = models.CharField(max_length=500, unique=True)
    token_generated_time = models.DateTimeField(auto_now=True)
    expired_time = models.DateTimeField()
    is_expired = models.BooleanField(default=False)

    def delete(self):
        if self.expired_time == datetime.datetime.now():
            BlacklistModel.objects.create()
        return super(TokenModel, self).delete()
         
class BlacklistModel(models.Model):
    username = models.CharField(max_length=150)
    token = models.CharField(max_length=500)
    token_generated_time = models.DateTimeField()
    token_expired_time = models.DateTimeField(auto_now=True)