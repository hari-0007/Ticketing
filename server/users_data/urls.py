from django.urls import path
from .views import *

urlpatterns = [
    path('register/', UserView.as_view(), name="user_register"),
]