from django.urls import path
from .views import *

urlpatterns = [
    path('register/', RegisterAdminView.as_view(), name="register"),
    path('login/', LoginAdminView.as_view(), name="login"),
]