# custom_tags.py
from django import template

register = template.Library()

@register.simple_tag
def get_phone_number(phone_numbers, name, default_value='N/A'):
    return phone_numbers.get(name, default_value)
