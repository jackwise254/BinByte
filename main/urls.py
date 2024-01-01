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
    path('deletecustomer/<str:pk>', delete_customer, name='delete_customer'),
    path('deletestaff/<str:pk>', DeleteStaff, name='deletestaff'),
    
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
    path('cleardelv/', clear_delv, name='clear_delv'),
    path('print_document/<str:document>', PrintDocument, name='print_document'),
    path("edit_staff/<str:pk>", EditStaff, name="edit-staff"),
    path('accessoryadd/' , accessory_add, name='accessory_add'),
    path('accessories/', AccessoriesV, name='accessories'),
    path('saleaccessories/', SaleAccessoriesV, name='saleaccessories'),
    
    path('delaccessory/<int:pk>', delaccessory_v, name='delaccessory_v'),
    path('delete_templist/<int:pk>', DeleteTemplist, name='delete_templist'),
    path('sales/', SalesView, name='sales'),
    path('deliveries/', Delivery_View, name='deliveries'),
    path('expenses/', Expenses_view, name='expenses'),
    path('delvcustomer/', delv_customer, name='delv_customer'),
    path('delv_sub/', delvsub, name='delvsub'),
    path('delv_out/', delvout, name='delvout'),
    path('delv_csv/', delvcsv, name='delvcsv'),
    path('delete_delivery/<int:pk>', deleteDdelivery, name='delete_delivery'),
    path('delete_returns/<int:pk>', DeleteReturns, name='delete_returns'),
    path("returnsout/", ReturnsOut, name="returnsout"),
    path("view-balances/", ViewBalances, name="view-balances"),
    path("sales-perfomance/", SalesPerfomance, name="sales-perfomance"),
    path("cash-box/", CashBox, name="cash-box"),
    path("sales-box/", SalesBox, name="sales-box"),
    path("settings/", Settings, name="settings"),
    path("delete-expense/<int:pk>", DeleteExpense, name="delete-expense"),
    path('typeadd/' , type_add, name='type_add'),
    path('conditionadd/' , condition_add, name='condition_add'),
    path('brandadd/' , brand_add, name='brand_add'),
    path('genadd/' , gen_add, name='gen_add'),
    path('speedadd/' , speed_add, name='speed_add'),
    path('hddadd/' , hdd_add, name='hdd_add'),
    path('cpuadd/' , cpu_add, name='cpu_add'),
    path('ramadd/' , ram_add, name='ram_add'),
    path('screenadd/' , screen_add, name='screen_add'),
    path('initialdd/' , initial, name='initial'),
    path('descriptionadd/' , description_add, name='description_add'),
    path('makepayments/' , MakePayments, name='makepayments'),
    path('makepaymentssupplier/' , MakePaymentsSup, name='makepaymentssupplier'),
    path('print-receipt/<str:name>' , PrintReceipt, name='print-receipt'),
    path('print-receiptsup/<str:name>' , PrintReceiptSup, name='print-receiptsup'),
    
    path('delcreen/<int:pk>', delcreen_v, name='delcreen_v'),
    path('delram/<int:pk>', delram_v, name='delram_v'),
    path('delinit/<int:pk>', delinit_v, name='delinit_v'),
    path('delcpu/<int:pk>', delcpu_v, name='delcpu_v'),
    path('delhdd/<int:pk>', delhdd_v, name='delhdd_v'),
    path('deltype/<int:pk>', deltype_v, name='deltype_v'),
    path('delexpense/<int:pk>', delexpense_v, name='delexpense_v'),
    path('delcond/<int:pk>', delcond_v, name='delcond_v'),
    path('delbrand/<int:pk>', delbrand_v, name='delbrand_v'),
    path('delgen/<int:pk>', delgen_v, name='delgen_v'),
    path('delspeed/<int:pk>', delspeed_v, name='delspeed_v'),
    path('update_m/<int:pk>', update_masterlist, name='update_masterlist'),

    path('edit-expense/' , EditExpense, name='EditExpense'),
    path('customer-balances/<str:pk>' , CustomerBalances, name='customer-balances'),
    path('supplier-balances/<str:pk>' , SupplierBalances, name='supplier-balances'),
    

    

    
    
    


    
    
     

    




]