from django.core.mail import EmailMessage

import threading
import string
import random

LENGTH = 32

def generate_random_string():
    """
    Generates random ID.
    """
    random_string = string.digits + string.ascii_letters
    new_id = ''.join([random.SystemRandom().choice(random_string) for i in range(random.randint(32, LENGTH))])
    return new_id

# class EmailThread(threading.Thread):

#     def __init__(self, email):
#         self.email = email
#         threading.Thread.__init__(self)

#     def run(self):
#         self.email.send()


# class Util:
#     @staticmethod
#     def send_email(data):
#         email = EmailMessage(
#             subject=data['email_subject'], body=data['email_body'], to=[data['to_email']])
#         EmailThread(email).start()
