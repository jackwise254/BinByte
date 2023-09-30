from django.contrib import admin
from django.urls import path
from .views import *

urlpatterns = [
    path('', Home, name="home"),
    path('home_page/', HomePage, name="home-page" ),
    path("staff_member/", StaffMember, name="staff_member"),
    path("set_password", setpassword, name="setpassword"),
    path("customers/", customersView, name="customers"),
    path("customercsvs", customercsvss, name="customercsvss"),
    path("addcustomer", add_customer, name="add_customer"),
    path("loadcustomer", loadcustomers, name="loadcustomers"),
    path('edit_customer/<int:pk>', editCustomer, name='editCustomer'),
    path('deletecustomer/', delete_customer, name='delete_customer'),
    path('vendors/',vendors_view, name='vendors_view'),
    path('addvendor/', add_vendor, name='add_vendor'),
    path('edit_vendor/<int:pk>', editvendor, name='editvendor'),
    path('deletevendor/<int:pk>', delete_vendor, name='delete_vendor'),
    path('stockin/', stockin_view, name='stockin_view'),
    path('uploadstock/', upload_stock, name='uploadstock'),
     

    




]