from __future__ import unicode_literals 
from django.db import models
from six import python_2_unicode_compatible
from .utils import organization_id_generator, branch_id_generator

# Create your models here.

@python_2_unicode_compatible

class OrganizationModel(models.Model):
    organization_id = models.CharField(max_length= 35, primary_key=True, unique=True)
    method = models.CharField(max_length=200)
    organization_name = models.CharField(max_length=500, unique=True)
    Display_name = models.CharField(max_length=200)
    organization_email = models.EmailField(max_length=200)
    organization_phone_number = models.CharField(max_length=50)
    organization_address = models.CharField(max_length=700)
    organization_country = models.CharField(max_length=100)
    organization_pincode = models.IntegerField(null = False)
    organization_document = models.CharField(max_length=500)
    # organization_document = models.ForeignKey(UploadFileModel, related_name='organization_document', on_delete=models.CASCADE)
    token = models.ForeignKey('authtoken.token', on_delete=models.CASCADE)
    access_key = models.CharField(max_length=100)

    class Meta:
        db_table = "organization_data"
    
    def save(self, force_insert=False, force_update=False, using=None, update_fields=None):
        if not self.organization_id:
            # Generate ID once, then check the database. If exists, keep trying.
            self.organization_id = organization_id_generator()
            while OrganizationModel.objects.filter(organization_id=self.organization_id).exists():
                self.organization_id = organization_id_generator()
        super(OrganizationModel, self).save(force_insert, force_update, using, update_fields)

class BranchModel(models.Model):
    organization_id = models.ForeignKey(OrganizationModel, on_delete=models.CASCADE)
    branch_id = models.CharField(max_length= 35, unique=True)
    branch_name = models.CharField(max_length=300)
    branch_email = models.EmailField(max_length=200)
    branch_phone_number = models.CharField(max_length=50)
    branch_address = models.CharField(max_length=700)
    branch_country = models.CharField(max_length=100)
    branch_pincode = models.IntegerField()
    branch_document = models.CharField(max_length=500)
    # branch_document = models.ForeignKey(UploadFileModel, related_name='branch_document', on_delete=models.CASCADE)

    class Meta:
        db_table = "branch_data"
       
    def save(self, force_insert=False, force_update=False, using=None, update_fields=None):
        if not self.branch_id:
            # Generate ID once, then check the database. If exists, keep trying.
            self.branch_id = branch_id_generator()
            while BranchModel.objects.filter(branch_id=self.branch_id).exists():
                self.branch_id = branch_id_generator()
        super(BranchModel, self).save(force_insert, force_update, using, update_fields)