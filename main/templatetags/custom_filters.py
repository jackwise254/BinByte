# custom_tags.py
from django import template

register = template.Library()

@register.simple_tag
def get_phone_number(phone_numbers, name, default_value='N/A'):
    return phone_numbers.get(name, default_value)

@register.filter(name='filter_mode')
def filter_mode(queryset, mode):
    return queryset.filter(mode=mode)

@register.filter(name='sum_amount')
def sum_amount(queryset):
    return sum(entry.amount for entry in queryset)