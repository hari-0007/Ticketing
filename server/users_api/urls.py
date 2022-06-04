from django.urls import path
from .views import *

urlpatterns = [
    path('register/', SelfUserView.as_view(), name="self_user_register"),
    path('login/', LoginUserView.as_view(), name='login'),
    path('reset-password/', SetNewPasswordAPIView.as_view(), name='password_reset_complete'),
    path('update/', UpdateUserAPIView.as_view(), name='update_profile'),
    path('logout/', LogoutUser.as_view(), name='logout'),
]