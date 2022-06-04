import string
import random

BRANCH_LENGTH = 8
ORGANIZATION_LENGTH = 16


def organization_id_generator():
    """
    Generates random ID.
    """
    random_string = string.digits + string.ascii_letters
    new_id = ''.join([random.SystemRandom().choice(random_string) for i in range(random.randint(16, ORGANIZATION_LENGTH))])
    return new_id

def branch_id_generator():
    """
    Generates random ID.
    """
    random_string = string.digits + string.ascii_letters
    new_id = ''.join([random.SystemRandom().choice(random_string) for i in range(random.randint(8, BRANCH_LENGTH))])
    return new_id