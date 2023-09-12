from django.contrib import admin
from django.urls import path
from .views import *

urlpatterns = [
    path('', Home, name="home"),
    path('home_page/', HomePage, name="home-page" )
]