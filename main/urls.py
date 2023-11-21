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
    path('stockout/', stockout_view, name='stockout'),
    path('naration_sub/', NarationSub, name='naration_sub'),
    
    
    path('uploadstock/', upload_stock, name='uploadstock'),
    path('clear_templist/', ClearTemplist, name='clear_templist'),
    path('push_templist/', PushTemplist, name='push_templist'),
    path('masterlist_view/', masterlistview, name='masterlist_view'),
    path('stockout_view/', stockoutview, name='stockout_view'),
    path('returnitems/', ReturnItems, name='returnitems'),
    path('clearreturns/', ClearReturns, name='clearreturns'),
    
    
    
    path('fetchproduct/<str:title>', FetchProduct, name='fetchproduct'),
    path('fetchstockout/<str:title>', FetchStockout, name='fetchstockout'),
    
    path('delete_templist/<int:pk>', DeleteTemplist, name='delete_templist'),
    

    path('sales/', SalesView, name='sales'),
    path('deliveries/', Delivery_View, name='deliveries'),
    path('delvcustomer/', delv_customer, name='delv_customer'),
    path('delv_sub/', delvsub, name='delvsub'),
    path('delv_out/', delvout, name='delvout'),
    path('delv_csv/', delvcsv, name='delvcsv'),
    path('delete_delivery/<int:pk>', deleteDdelivery, name='delete_delivery'),
    path('delete_returns/<int:pk>', DeleteReturns, name='delete_returns'),
    path("returnsout/", ReturnsOut, name="returnsout")
    
    
    


    
    
     

    




]