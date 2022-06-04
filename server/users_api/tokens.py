import string
import random
from smtplib import SMTPException
from django.conf import settings
from django.core.mail import send_mail
from rest_framework.exceptions import APIException

def generate_random_password(password):
    """
    Generates random password.
    """
    random_string = string.digits + string.ascii_letters + "@#$"
    password = ''.join([random.SystemRandom().choice(random_string) for i in range(random.randint(10, 10))])
    return password

def validate_email(password, email):
    Subject = 'Greetings!!'
    message = password
    # print(message)
    try:
        result = send_mail(
            Subject,
            message,
            settings.EMAIL_HOST_USER,
            [email],
            fail_silently=False,
        )   
    except SMTPException:
        raise APIException("Invalid Mail!!") 
    return result  