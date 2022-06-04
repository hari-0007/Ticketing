from django.urls import path
from .views import *

urlpatterns = [
    path('register/', organizationView, name="organization_register"),
    path('update/', UpdateOrganizationAPIView.as_view(), name="organization_update"),
]