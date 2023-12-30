from django.shortcuts import render, redirect
from users.models import *
from django.contrib.auth.decorators import login_required

from django.contrib.sessions.models import Session
from django.db.models import Q
from .models import *
from .spreadsheets import *
import pandas as pd
from django.core.files.storage import FileSystemStorage
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db import connection, transaction
import numpy
from datetime import *
from django.utils import timezone
from django.db.models import Max
from django.db.models import F
from django.db.models.functions import ExtractMonth, ExtractYear
from django.http import JsonResponse
import json
@login_required

def get_monthly_sales_totals(request):
    sales = Stockout.objects.annotate(month=ExtractMonth('datedelivered')).values('month').annotate(sales_count=Count('id')).order_by('month')
    sales_list = [0] * 12  # initialize a list with 12 zeros
    for sale in sales:
        sales_list[sale['month'] - 1] = sale['sales_count']
    return sales_list

def get_top_four_stockouts():
    return Stockout.objects.values('type')\
                           .annotate(type_count=Count('type'))\
                           .order_by('-type_count')[:4]


from datetime import datetime, timedelta, date
def start_of_the_year():
    today = date.today()
    start_of_year = datetime(today.year, 1, 1)
    end_of_year = datetime(today.year + 1, 1, 1) - timedelta(days=1)
    return start_of_year, end_of_year

@login_required

def monthly_sales(request):
    # Fetch top four stockouts
    top_four_sales = get_top_four_stockouts()
    start_of_year, end_of_year = start_of_the_year()

    all_results = []
    for t in top_four_sales:
        monthly_result = [0]*12
        monthly_sales = Stockout.objects.filter(type=t['type'], datedelivered__range=(start_of_year, end_of_year))\
                                        .annotate(month=ExtractMonth('datedelivered'))\
                                        .values('month')\
                                        .annotate(monthly_count=Count('id'))\
                                        .order_by('month')
        
        for sale in monthly_sales:
            month_index = sale['month'] - 1
            monthly_result[month_index] = sale['monthly_count']
        all_results.append(monthly_result)
    return all_results


# Create your views here.
def Home(request):

    return redirect('/accounts/login')
@login_required

def ViewBalances(request):
    customer_balances = Orders.objects.filter(order_type="Credit").order_by("-id")
    supplier_balances = SupplierOrders.objects.all().order_by("-id")
    phone_numbers = []
    phone_numberss = []
    mode = []
    modes = []
    
    for order in customer_balances:
        name = order.name
        # Find customers with a matching username
        matching_customers = Customer.objects.filter(username__contains=name)
        matching_mode = Product.objects.filter(username__contains=name)
        # Use the first matching customer's phone number
        if matching_mode.exists():
            mode.append(matching_mode.first().mode)
        else:
            mode.append("N/A")

        if matching_customers.exists():
            phone_numbers.append(matching_customers.first().phone)
        else:
            phone_numbers.append("N/A")

    suplier_balances = Orders.objects.filter(order_type="Debit").order_by("-id")

    for order in suplier_balances:
        name = order.name
        matching_suppliers = Vendor.objects.filter(username__contains=name)
        matching_modes = Product.objects.filter(username__contains=name)

        if matching_modes.exists():
            modes.append(matching_modes.first().mode)
        else:
            modes.append("N/A")

        if matching_suppliers.exists():
            phone_numberss.append(matching_suppliers.first().phone)
        else:
            phone_numberss.append("N/A")

    context = {
        "modes":modes,
        "mode":mode,
        "phone_numberss":phone_numberss,
        "phone_numbers":phone_numbers,
        "customer_balancess":customer_balances,
        "suplier_balancess":supplier_balances,

    }
    return render(request, "home/balances.html", context)
@login_required

def SalesPerfomance(request):
    agent_records = Agents_Records.objects.all().order_by("-id")

    context ={

        "agent_records":agent_records,


    }

    return render(request, "home/sales.html", context)
@login_required

def CashBox(request):
    from itertools import chain

    modes = ["Bank", "Cash", "M-pesa", "Expense", "Credit"]

    cash_boxs = []

    # Iterate over modes
    for mode in modes:
        # Filter entries for the current mode
        mode_queryset = Product.objects.filter(mode=mode).order_by("-id")[:10]
        cash_boxs.extend(mode_queryset)

    # Calculate totals for each mode
    mode_totals = {mode: sum(entry.amount for entry in cash_boxs if entry.mode == mode) for mode in modes}

    context = {
        'cash_boxs': cash_boxs,
        'modes': modes,
        'mode_totals': mode_totals,
    }

    return render(request, "home/cash-box.html", context)




def type_add(request):
    types = Type.objects.all().order_by('type')
    if request.method =='POST':
        t = request.POST.get('name')
        en = Type(type=t)
        en.save()
    return redirect('/settings')


def gen_add(request):
    types = Gen.objects.all()
    if request.method =='POST':
        t = request.POST.get('name')
        en = Gen(gen=t)
        en.save()
    return redirect('/settings')


def speed_add(request):
    types = Speed.objects.all()
    if request.method =='POST':
        t = request.POST.get('name')
        en = Speed(speed=t)
        en.save()
    return redirect('/settings')


def hdd_add(request):
    types = Hdd.objects.all()
    if request.method =='POST':
        t = request.POST.get('name')
        en = Hdd(hdd=t)
        en.save()
    return redirect('/settings')


def cpu_add(request):
    types = Cpu.objects.all()
    if request.method =='POST':
        t = request.POST.get('name')
        en = Cpu(cpu=t)
        en.save()
    return redirect('/settings')


def ram_add(request):
    types = Ram.objects.all()
    if request.method =='POST':
        t = request.POST.get('name')
        en = Ram(ram=t)
        en.save()
    return redirect('/settings')

def description_add(request):
    if request.method =='POST':
        t = request.POST.get('name')
        Expense_description(description=t).save()
    return redirect("/settings")

def initial(request):
    from .models import Init
    if request.method == 'POST':
        init = request.POST.get('name')
        if init:
            Init.objects.all().delete()
            en = Init(initial=init)
            en.save()
    return redirect('/settings')


@login_required

def brand_add(request):
    types = Brand.objects.all()
    if request.method =='POST':
        t = request.POST.get('name')
        en = Brand(brand=t)
        en.save()
    return redirect('/settings')


def condition_add(request):
    types = NewCondition.objects.all()
    if request.method =='POST':
        t = request.POST.get('name')
        en = NewCondition(conditions=t)
        en.save()
    return redirect('/settings')


def screen_add(request):
    types = Screen.objects.all()
    if request.method =='POST':
        t = request.POST.get('name')
        en = Screen(screen=t)
        en.save()
    return redirect('/settings')


def delspeed_v(request, pk):
    Speed.objects.filter(id=pk).delete()
    return redirect('/settings')


def delcreen_v(request, pk):
    Screen.objects.filter(id=pk).delete()
    return redirect('/settings')


def delram_v(request, pk):
    Ram.objects.filter(id=pk).delete()
    return redirect('/settings')
def delinit_v(request, pk):
    from .models import Init
    Init.objects.get(id=pk).delete()
    return redirect('/settings')

def delhdd_v(request, pk):
    Hdd.objects.filter(id=pk).delete()
    return redirect('/settings')

def deltype_v(request, pk):
    Type.objects.filter(id=pk).delete()
    return redirect('/settings')

def delexpense_v(request, pk):
    Expense_description.objects.filter(id=pk).delete()
    return redirect("/settings")
@login_required

def delcond_v(request, pk):
    NewCondition.objects.filter(id=pk).delete()
    return redirect('/settings')
def delbrand_v(request, pk):
    Brand.objects.filter(id=pk).delete()
    return redirect('/settings')
@login_required

def delgen_v(request, pk):
    Gen.objects.filter(id=pk).delete()
    return redirect('/settings')
@login_required

def delcpu_v(request, pk):
    Cpu.objects.filter(id=pk).delete()
    return redirect('/settings')
@login_required

def EditExpense(request, pk):


    return render(request, "deliveries/edit-expense.html")
@login_required

def update_masterlist(request,pk):
    masterlist = Masterlist.objects.get(id=pk)
    type = Type.objects.all()
    conditions = NewCondition.objects.all().order_by('conditions')
    brands = Brand.objects.all()
    generations = Gen.objects.all()
    cpus = Cpu.objects.all()
    speeds = Speed.objects.all()
    rams = Ram.objects.all()
    hdds = Hdd.objects.all()
    screens = Screen.objects.all()
    vendors = Vendor.objects.all()

    if request.method == 'POST':

        masterlist = Masterlist.objects.filter(id=pk).update(

        type=request.POST.get('type'),
        gen=request.POST.get('gen'),
        ram=request.POST.get('ram'),
        brand=request.POST.get('brand'),
        screen=request.POST.get('screen'),
        serialno=request.POST.get('serialno'),
        model=request.POST.get('model'),
        cpu=request.POST.get('cpu'),
        speed=request.POST.get('speed'),
        price=request.POST.get('price'),
        hdd=request.POST.get('hdd'),
        comment=request.POST.get('comment'),
        supplier=Vendor.objects.get(username=request.POST.get('supplier')),
        )
        return redirect('/stockin')
    context ={
        'masterlist': masterlist,
        'brands': brands,
        'gns': generations,
        'cpus': cpus,
        'speeds': speeds,
        'rams': rams,
        'hdds': hdds,
        'screens': screens,
        'vendors':vendors,
        'types': type,
        'conditions': conditions,
        'user1':request.session.get('username')
    }
    return render(request,'uploads/update_masterlist.html',context)
@login_required

def Settings(request):
    type =Type.objects.all()
    conditions = NewCondition.objects.all().order_by('conditions')
    brands = Brand.objects.all()
    generations = Gen.objects.all()
    cpus = Cpu.objects.all()
    speeds = Speed.objects.all()
    rams = Ram.objects.all()
    hdds = Hdd.objects.all()
    screens = Screen.objects.all()
    gens = Gen.objects.all()
    expenses = Expense_description.objects.all()
    accessories = Accessory.objects.all()

    context ={
        "accessories":accessories,
        'types':type,
        'conditions':conditions,
        'brands':brands,
        'generations':generations,
        'cpus':cpus,
        'gens':gens,
        'speeds':speeds,
        'rams':rams,
        'hdds':hdds,
        'screens':screens,
        'selected':'settings',
        'user':request.user,
        "expenses":expenses,
    }
    return render(request, "dropdowns/settings.html", context)

@login_required
def AccessoriesV(request):
    accessories = Accessory.objects.all().order_by("name")
    suppliers = Vendor.objects.all()
    if request.method =="POST":
        bprice = request.POST.get("bprice")
        sprice = request.POST.get("sprice")
        vendor = request.POST.get("vendor")
        qty = request.POST.get("qty")
        pk = request.POST.get("id")
        print(f"bprice:{bprice},sprice:{sprice},vendor:{vendor} qty:{qty}, pk:{pk}")
        Accessory.objects.filter(id=pk).update(
            bprice=bprice,
            sprice=sprice,
            supplier=Vendor.objects.get(username=vendor),
            qty=qty,
        )
        messages.add_message(request, messages.INFO, "Accessory updated successfully")
        return redirect("/accessories")
    context = {
        "suppliers":suppliers,
        "accessories":accessories
    }
    return render(request, "uploads/accessories.html",context)



@login_required
def delaccessory_v(request, pk):
    Accessory.objects.filter(id=pk).delete()

    return redirect("/settings")


@login_required

def DeleteExpense(request, pk):
    Expense.objects.get(id=pk).delete()
    return redirect("/expenses")

@login_required

def SalesBox(request):
    sales = Product.objects.all().order_by("-id")

    context ={
        'sales':sales
    }

    return render(request, "home/slaes-box.html" , context)

@login_required
def HomePage(request):
    # Get the current date and time
    current_date = timezone.now()

    # Calculate the start and end of the current month
    start_of_month = current_date.replace(day=1, hour=0, minute=0, second=0, microsecond=0)
    end_of_month = (start_of_month + timezone.timedelta(days=32)).replace(day=1, hour=0, minute=0, second=0, microsecond=0)

    # Get the current month and year
    now = timezone.now()
    current_month = now.month
    current_year = now.year

    # Filter Stockout objects for the current month
    count_current_month = Stockout.objects.filter(datedelivered__month=current_month, datedelivered__year=current_year)

    # Print the count of items delivered in the current month
    print(f"Total count for {now.strftime('%B %Y')}: {count_current_month.count()}")

    # If you want to print the individual counts for each date, you can use annotate and values
    counts_per_date = count_current_month.values('datedelivered').annotate(count=Count('id'))

    for entry in counts_per_date:
        print(f"{entry['datedelivered']}: {entry['count']} items")

    monthly_returns = Agents_Records.objects.filter(date__month=current_month, date__year=current_year)


    monthly_saless = get_monthly_sales_totals(request)
    sales_mon = monthly_sales(request)
    top_labels = get_top_four_stockouts()
    product_labels = [item['type'] for item in top_labels]
    stock = Masterlist.objects.all().count()
    sales = Product.objects.all().order_by("-id")[:10]
    # stockouts = Product.objects.select_related('stockout').order_by("-id")[:10]

    orders = Orders.objects.all().order_by("-id")[:5]
    customer_balances = Orders.objects.filter(order_type="Credit").order_by("-id")[:7]
    phone_numbers = []
    phone_numberss = []
    mode = []
    modes = []
    
    for order in customer_balances:
        name = order.name
        # Find customers with a matching username
        matching_customers = Customer.objects.filter(username__contains=name)
        matching_mode = Product.objects.filter(username__contains=name)
        # Use the first matching customer's phone number
        if matching_mode.exists():
            mode.append(matching_mode.first().mode)
        else:
            mode.append("N/A")

        if matching_customers.exists():
            phone_numbers.append(matching_customers.first().phone)
        else:
            phone_numbers.append("N/A")

    suplier_balances = SupplierOrders.objects.all().order_by("-id")[:7]
    for order in suplier_balances:
        name = order.name
        matching_suppliers = Vendor.objects.filter(username__contains=name)
        matching_modes = Product.objects.filter(username__contains=name)

        if matching_modes.exists():
            modes.append(matching_modes.first().mode)
        else:
            modes.append("N/A")

        if matching_suppliers.exists():
            phone_numberss.append(matching_suppliers.first().phone)
        else:
            phone_numberss.append("N/A")


    agent_records = Agents_Records.objects.all()[:10]

    if orders:
        # Filter out orders with None values in the 'date' field
        filtered_orders = [order for order in orders if order.date is not None]

        if filtered_orders:
            start_date = min(order.date for order in filtered_orders)
            end_date = max(order.date for order in filtered_orders)
        else:
            start_date = end_date = None
    else:
        start_date = end_date = None


    # cash_box= Product.objects.all()
    from django.db.models import F

    # Retrieve the latest 10 records for each mode
    from datetime import date

    today = date.today()
    bank_total = Product.objects.filter(date=today, mode="Bank").aggregate(total_amount=Sum('amount'))['total_amount']
    cash_total = Product.objects.filter(date=today, mode="Cash").aggregate(total_amount=Sum('amount'))['total_amount']
    mpesa_total = Product.objects.filter(date=today, mode="M-pesa").aggregate(total_amount=Sum('amount'))['total_amount']
    credit_total = Product.objects.filter(date=today, mode="Credit").aggregate(total_amount=Sum('amount'))['total_amount']
    # Filter expenses based on the date portion
    expense = Expense.objects.filter(date__date=today).order_by("-id")[:10]
    # Calculate total amount for today's expenses
    expense_total = Expense.objects.filter(date__date=today).aggregate(total_amount=Sum('amount'))['total_amount']


    cash_box = (
        Product.objects.filter(date=today, mode="Bank")
        .order_by("-id")[:10]
        .union(
            Product.objects.filter(date=today, mode="Cash")
            .order_by("-id")[:10]
        )
        .union(
            Product.objects.filter(date=today, mode="M-pesa")
            .order_by("-id")[:10]
        )
        .union(
            Product.objects.filter(date=today, mode="Expense")
            .order_by("-id")[:10]
        )
        .union(
            Product.objects.filter(date=today, mode="Credit")
            .order_by("-id")[:10]
        )
    )

    context ={
        "cash_boxs":cash_box,
        'bank_total': bank_total,
        'cash_total': cash_total,
        'mpesa_total': mpesa_total,
        'expense_total': expense_total,
        'credit_total': credit_total,
        "expense":expense,
        "mode":mode,
        "modes":modes,
        "suplier_balances":suplier_balances,
        "phone_numberss":phone_numberss,
        'product_labels': json.dumps(product_labels),
        "monthly_sales":monthly_saless,
        "start_date":start_date,
        "agent_records":agent_records,
        "end_date":end_date,
        "orders":orders,
        "stockout":count_current_month.count(),
        'selected':True,
        "stock":stock,
        "monthly_returns":monthly_returns.count(),
        "sales":sales,
        'sales_mon': json.dumps(sales_mon),
        'phone_numbers': phone_numbers,
        'customer_balances': customer_balances,
    }

    return render(request, 'home/index.html', context)

@login_required

def Expenses_view(request):

    description = Expense_description.objects.all()
    today = date.today()
    print(f"today:{today}")

    context = {
        "today":today,
        "expenses":Expense.objects.all().order_by("-id"),
        "description":description,
    }
    if request.method == "POST":
        name = request.session.get("username")
        description = request.POST.get("comment")
        amount = request.POST.get("amount")
        try:
            Expense.objects.create(
            name=User.objects.get(username=name),
            amount = amount,
            description = Expense_description.objects.get(description=description)
            )


            
        except:
            messages.add_message(request, messages.INFO, "Something went worng, please try again later")
        return redirect("/expenses")


    return render(request, "deliveries/expense.html", context)


@login_required

def ReturnItems(request):
    template_name = "deliveries/returns.html"
    sess = request.session.get("username")
    products = Temp.objects.filter(terms=sess, d_type="returns", is_active=True)
    count = products.count()
    context = {
        "products":products,
        "count":count
    }

    if request.method == "POST":
        assetid = request.POST.get("assetid")
        rows = Stockout.objects.filter(serialno=assetid)
        print(f"rows:{rows}, assetid:{assetid}")
        for temp_item in rows:
            fields = [field.name for field in Stockout._meta.fields if field.name != 'id']
            stockout_entry = Temp()
            for field in fields:
                setattr(stockout_entry, field, getattr(temp_item, field))
            stockout_entry.qty = 1
            stockout_entry.mode ='Returned'
            stockout_entry.d_type ='returns'
            stockout_entry.terms =sess
            stockout_entry.is_active =True
            stockout_entry.save()
        return redirect("/returnitems")

    return render(request, template_name, context)

@login_required

def ClearReturns(request):
    sess = request.session.get("username")
    Temp.objects.filter(d_type="returns", terms=sess).delete()

    return redirect("/returnitems")

@login_required

def customersView(request):
    customers = Customer.objects.values()
    user = request.session.get('username')
    counts = customers.count()
    if request.method == "POST":
        name = request.POST.get('q')
        customers = Customer.objects.filter(
            Q(fname__icontains=name) |Q(lname__icontains=name) | Q(phone__icontains=name) | Q(location__icontains=name) | Q(email__icontains=name) | Q(username__icontains=name) | Q(id_no__icontains=name)
        )
        counts = customers.count()
    context = {
        'selected':'customers',
        'customers':customers,
        'counts':counts,
    }

    return render(request, 'accounts/customers.html', context)


def logged_in_users_check():
    sessions = Session.objects.filter(expire_date__gte=timezone.now())
    user_ids = []
    for session in sessions:
        data = session.get_decoded()
        user_ids.append(data.get('_auth_user_id', None))
    users = User.objects.filter(id__in=user_ids).distinct()

    return users

@login_required
# 
def StaffMember(request):
    all_users = User.objects.all()
    active_users = logged_in_users_check()
    # Build a list of users with their checked status
    final_users = [
        {
            'user': user,
            'checked': user in active_users
        } 
        for user in all_users
    ]

    return render(
        request, 
        'accounts/staff.html', 
        {
            'users': final_users, 
            'selected': 'staff_member', 
            'user1': request.session.get('username'), 
            'user': request.user, 
            'active_users': len(active_users)
        }
    )

def setpassword(request):
    print("A'int nothing here")

    return redirect('/home_page')
@login_required

def add_customer(request):
    customer = Customer.objects.all()
    if request.method=='POST':
        data = Customer(
            fname = request.POST.get('fname'),
            lname = request.POST.get('lname'),
            phone = request.POST.get('phone'),
            location = request.POST.get('location'),
            email = request.POST.get('email'),
            username = request.POST.get('username'),
            id_no = request.POST.get('id_no'),
        )
        data.save()
        return redirect('/customers')

    return render(request, 'accounts/addcustomer.html')
@login_required

def loadcustomers(request):
    rands = randint(1000000, 9999999)
    try:
        if request.method == 'POST':
            myfile = request.FILES.get('file') 
            vendor = request.POST.get('customer')      
            fs = FileSystemStorage()
            filename = fs.save(myfile.name, myfile)
            uploaded_file_url = fs.url(filename)
            excel_file = uploaded_file_url
            
            empexceldata = pd.read_csv("."+excel_file,encoding='utf-8')
            dbframe = empexceldata
            total = len(dbframe.index)
            for dbframe in dbframe.itertuples():
                obj = Customer.objects.create(fname=dbframe.FIRSTNAME, lname=dbframe.LASTNAME, phone=dbframe.PHONE, location=dbframe.LOCATION, email=dbframe.EMAIL, username=dbframe.USERNAME, id_no=dbframe.IDNO)
                obj.save()
            messages.success(request, f"Success")
    except:
        messages.error(request, f"something went wrong")
    return redirect('/customers')
@login_required

def editCustomer(request , pk):
    customer = Customer.objects.get(id=pk)
    if request.method=='POST':
        Customer.objects.filter(id=pk).update(
            fname = request.POST.get('fname'),
            lname = request.POST.get('lname'),
            phone = request.POST.get('phone'),
            location = request.POST.get('location'),
            email = request.POST.get('email'),
            username = request.POST.get('username'),
            id_no = request.POST.get('id_no'),
        )
        return redirect('/customers')
    return render(request, 'accounts/editcustomer.html', {'form':customer})
@login_required

def delete_customer(request, pk):
    Customer.objects.get(id=pk).delete()
    return redirect('/customers')

def DeleteStaff(request, pk):
    User.objects.get(id=pk).delete()
    return redirect("/staff_member")
def vendors_view(request):
    vendor = Vendor.objects.all()

    return render(request, 'accounts/vendors.html', {'form':vendor, 'selected':'vendors'})
@login_required

def add_vendor(request):
    customer = Vendor.objects.all()
    if request.method=='POST':
        data = Vendor(
            fname = request.POST.get('fname'),
            lname = request.POST.get('lname'),
            phone = request.POST.get('phone'),
            location = request.POST.get('location'),
            email = request.POST.get('email'),
            username = request.POST.get('username'),
            id_no = request.POST.get('id_no'),
        )
        data.save()
        return redirect('/vendors')


    return render(request, 'accounts/addvendor.html', {'form':customer})
@login_required

def editvendor(request, pk):
    customer = Vendor.objects.get(id=pk)
    if request.method=='POST':

        fname = request.POST.get('fname')
        lname = request.POST.get('lname')
        phone = request.POST.get('phone')
        location = request.POST.get('location')
        email = request.POST.get('email')
        username = request.POST.get('username')
        id_no = request.POST.get('id_no')

        Vendor.objects.filter(id=pk).update(
            fname=fname, lname=lname, phone=phone, location=location, email=email, username=username, id_no=id_no
        )
        return redirect('/vendors')
    

    return render(request, 'accounts/editvendor.html', {'form':customer})
@login_required

def delete_vendor(reqesut, pk):
    Vendor.objects.get(id=pk).delete()
    return redirect('/vendors')

@login_required

def stockin_view(request):
    user1 = request.session.get('username')

    def get_names_and_counts(model, types):
        lists, names = [], []
        for type in types:
            name = f"{type.type}"
            item_count = model.objects.filter(type=type.type).count()
            if item_count > 0:
                lists.append(item_count)
                names.append(name)
        return lists, names

    types = Type.objects.all()
    conditions = NewCondition.objects.all()

    master_count = Masterlist.objects.count()
    masterlist = Masterlist.objects.all()
    lists, names = get_names_and_counts(Masterlist, types)



    context = {
        'count': lists,
        'master_count': master_count,
        'masterlist': masterlist,
        'items': types,
        'conditions': conditions,
        'names': zip(names, lists),
        'names_stockin': zip(names, lists),
        'title': 'Stock',
        'user1':user1,
        'title1': 'In',
        'colors': ['red', 'green', 'blue', 'yellow', 'orange'],
        'selected':'stockin',
    }

    return render(request, 'stock/index.html', context)
@login_required

def masterlistview(request):
    template_name = "stock/stockin.html"
    masterlist =  Masterlist.objects.all()[:500]
    count = masterlist.count()
    if request.method == 'POST':
        model_val = request.POST.get('model')
        q = request.POST.get('q')
        model = request.POST.get('model')
        excluded_fields = ['model', 'type']
        masterlist = Masterlist.objects.none()  # Initialize products as an empty queryset
        if q:
            model_fields = [field.name for field in Masterlist._meta.get_fields() if field.name not in excluded_fields]
            q_conditions = Q()
            for field in model_fields:
                field_type = Masterlist._meta.get_field(field).get_internal_type()

                if field_type == 'CharField':
                    q_conditions |= Q(**{field + '__icontains': q})

                elif field_type == 'DateTimeField':
                    q_conditions |= Q(**{field: q})
                elif field_type in ['IntegerField', 'FloatField']:
                    try:
                        value = int(q)
                        q_conditions = Q(**{field: value})
                    except ValueError:
                        pass
            masterlist = Masterlist.objects.filter(q_conditions).order_by('-daterecieved')
            count = masterlist.count()

    p = Paginator(masterlist, 500)
    page_number = request.GET.get('page')
    try: 
        page_obj = p.get_page(page_number)
    except PageNotAnInteger:
        page_obj = p.page(1)
    except EmptyPage:
        page_obj = p.page(p.num_pages)
    title = "Total stock"
    context = {
        "count":count,
        'title':title,
        'page_obj':page_obj,
    }

    return render(request, template_name, context)
@login_required

def stockoutview(request):
    template_name = "stockout/stockout.html"
    products =  Stockout.objects.all()[:500]
    count = Stockout.objects.all().count()
    p = Paginator(products, 500)
    page_number = request.GET.get('page')
    try: 
        page_obj = p.get_page(page_number)
    except PageNotAnInteger:
        page_obj = p.page(1)
    except EmptyPage:
        page_obj = p.page(p.num_pages)
    title = "Total stock"
    context = {
        'title':title,
        'page_obj':page_obj,
        "count":count,
    }

    return render(request, template_name, context)    


from django.utils import timezone
from datetime import timedelta
@login_required

def stockout_view(request):
    template_name = "stockout/index.html"
    user1 = request.session.get('username')

    def get_names_and_counts(model, types):
        lists, names = [], []
        for type in types:
            name = f"{type.type}"
            item_count = model.objects.filter(type=type.type).count()
            if item_count > 0:
                lists.append(item_count)
                names.append(name)
        return lists, names

    types = Type.objects.all()
    conditions = NewCondition.objects.all()

    # Calculate the date one month ago
    one_month_ago = timezone.now() - timedelta(days=30)

    master_count = Stockout.objects.count()

    # Filter Stockout items where datedelivered is less than a month ago
    masterlist = Stockout.objects.filter(datedelivered__lt=one_month_ago)

    lists, names = get_names_and_counts(Stockout, types)

    context = {
        'count': lists,
        'master_count': master_count,
        'masterlist': masterlist,
        'items': types,
        'conditions': conditions,
        'names': zip(names, lists),
        'names_stockin': zip(names, lists),
        'title': 'Stock',
        'user1': user1,
        'title1': 'In',
        'colors': ['red', 'green', 'blue', 'yellow', 'orange'],
        'selected': 'stockout',
    }
    return render(request, template_name, context)


@login_required

def FetchProduct(request, title):
    template_name = "stock/stockin.html"
    k_split = title.split()
    conditions = k_split[0]
    types = k_split[1:]
    types = ' '.join(types)
    masterlists = Masterlist.objects.filter(type=conditions)
    count = masterlists.count()
    masterlist = Masterlist.objects.filter(type=conditions).order_by('-daterecieved')[:500]
    if request.method == 'POST':
        model_val = request.POST.get('model')
        q = request.POST.get('q')
        model = request.POST.get('model')
        excluded_fields = ['model', 'type']
        masterlist = Masterlist.objects.none()  # Initialize products as an empty queryset
        if q:
            model_fields = [field.name for field in Masterlist._meta.get_fields() if field.name not in excluded_fields]
            q_conditions = Q()
            for field in model_fields:
                field_type = Masterlist._meta.get_field(field).get_internal_type()

                if field_type == 'CharField':
                    q_conditions |= Q(**{field + '__icontains': q, 'type__icontains':types})

                elif field_type == 'DateTimeField':
                    q_conditions |= Q(**{field: q, 'type__icontains':types})
                elif field_type in ['IntegerField', 'FloatField']:
                    try:
                        value = int(q)
                        q_conditions = Q(**{field: value, 'type__icontains':types})
                    except ValueError:
                        pass
            masterlist = Masterlist.objects.filter(q_conditions).order_by('-daterecieved')
            count = masterlist.count()


    p = Paginator(masterlist, 500)
    page_number = request.GET.get('page')
    try: 
        page_obj = p.get_page(page_number)
    except PageNotAnInteger:
        page_obj = p.page(1)
    except EmptyPage:
        page_obj = p.page(p.num_pages)
    context = {
        'count':count,
        'title':title,
        'page_obj':page_obj,
    }

    return render(request, template_name, context)

@login_required

def FetchStockout(request, title):
    template_name = "stockout/stockout.html"
    k_split = title.split()
    conditions = k_split[0]
    types = k_split[1:]
    types = ' '.join(types)
    masterlists = Stockout.objects.filter(type=conditions)
    count = masterlists.count()
    masterlist = Stockout.objects.filter(type=conditions).order_by('-daterecieved')[:500]

    p = Paginator(masterlist, 500)
    page_number = request.GET.get('page')
    try: 
        page_obj = p.get_page(page_number)
    except PageNotAnInteger:
        page_obj = p.page(1)
    except EmptyPage:
        page_obj = p.page(p.num_pages)
    context = {
        'count':count,
        'title':title,
        'page_obj':page_obj,
    }

    return render(request, template_name, context)


@transaction.atomic
@login_required

def PushTemplist(request):
    rows = Templist.objects.filter(terms=request.user)
    total_amount = 0
    # Bulk create Masterlist entries
    masterlist_entries = []
    for temp_item in rows:
        masterlist_entry = Masterlist()
        total_amount += int(temp_item.bprice)

        for field in Masterlist._meta.fields:
            if field.name != 'id':
                value = getattr(temp_item, field.name, None)

                # Convert non-string values to string for CharField fields
                if isinstance(field, models.CharField) and not isinstance(value, str):
                    value = str(value)

                setattr(masterlist_entry, field.name, value)

        masterlist_entries.append(masterlist_entry)

    Masterlist.objects.bulk_create(masterlist_entries)

    # Delete Templist entries
    rows.delete()

    # Update Narations status
    naration = Narations.objects.get(status=0)
    order_type = naration.order_type
    naration.status = 1
    naration.save()
    total_amount_1 = 0
    # Create Orders entry
    # Create a new Orders object
    total_amount_1 = total_amount
    Orders.objects.create(name=naration.vendor.username, order_type="Debit", amount=naration.balance, date=naration.date)

    # total_amount_1 = SupplierOrders.objects.filter(name=naration.vendor.username).order_by("-id").first()
    # print(f"total_amount_1:{total_amount_1}")
    # total_amount_1 = int(total_amount_1.total_amount)
    if order_type == "Credit":
        try:
            total_amount_1 += int(naration.balance)
        except:
            total_amount_1 += 0

        SupplierOrders.objects.create(name=naration.vendor.username, order_type="Credit", amount=total_amount, date=naration.date, total_amount=total_amount_1)
    else:
        SupplierOrders.objects.create(name=naration.vendor.username, order_type=order_type, amount=total_amount, date=naration.date, total_amount=int(naration.balance))
    # balance = SupplierOrders.objects.filter(name=supplier).values("total_amount").order_by("-id").first()
    # Update the total_amount field of the existing or newly created object
    Orders.objects.filter(name=naration.vendor.username).update(total_amount=F('total_amount') + naration.balance)


    return redirect('/uploadstock')



def ClearTemplist(request):
    Templist.objects.filter(terms=request.user).delete()
    return redirect('/uploadstock')

def DeleteTemplist(request, pk):
    Templist.objects.get(id=pk).delete()
    return redirect('/uploadstock')


@login_required
def EditStaff(request, pk):
    user  = User.objects.get(id=pk)
    all_type_codes = [type_code for type_code, _ in User.Types.choices]
    if request.method == "POST":
        email = request.POST.get('email')
        firstname = request.POST.get('firstname')
        username = request.POST.get('username')
        lastname = request.POST.get('lastname')
        password = request.POST.get('password')
        user_type = request.POST.get('user_type')
        User.objects.filter(id=pk).update(
            email=email,
            firstname=firstname,
            username=username,
            lastname=lastname,
            # password=password,
            type=user_type,
        )

        messages.add_message(request, messages.SUCCESS, f"{username}'s details updated successfully")
        return redirect("/staff_member")
    context = {
        "types":all_type_codes,
        "user":user,
    }

    return render(request, "accounts/edit_staff.html",context)

@transaction.atomic
@login_required

def NarationSub(request):
    if request.method == "POST":
        supplier = request.POST.get('supplier')
        naration = request.POST.get('naration')
        mode = request.POST.get('mode')
        amount = 0
        # amount = request.POST.get('amount')
        vendor = Vendor.objects.get(username=supplier)

        balance = SupplierOrders.objects.filter(name=supplier).values("total_amount").order_by("-id").first()
        remaining_amount = 0
        if balance:
            remaining_amount = balance['total_amount']
        else:
            remaining_amount = 0


        # Check if there is an existing record for the vendor with status=0
        if Narations.objects.filter(vendor=vendor, status=0).exists():
            # Delete the existing record
            Narations.objects.filter(vendor=vendor, status=0).delete()

        # Get the latest balance for the vendor
        latest_balance = Narations.objects.filter(vendor=vendor).aggregate(Max('balance'))['balance__max']

        # If there is a latest balance, add it to the amount as acc_balance
        if latest_balance is not None:
            acc_balance = float(amount) + float(latest_balance)
        else:
            acc_balance = amount
        # Create a new Narations instance with the updated acc_balance
        Narations.objects.create(vendor=vendor, naration=naration, amount=amount, balance=remaining_amount, status=0, order_type=mode)
        return redirect("/uploadstock")
    return redirect("/uploadstock")

@login_required

def upload_stock(request):
    types = Type.objects.all()
    cpus = Cpu.objects.all()
    hdds = Hdd.objects.all()
    rams = Ram.objects.all()
    brands = Brand.objects.all()
    screens = Screen.objects.all()
    gens = Gen.objects.all()
    suppliers = Vendor.objects.all()
    products = Templist.objects.filter(terms=request.user)
    count = products.count()
    total_vat = sum(product.vat for product in products)
    total_price = sum(product.bprice for product in products)
    total_sub_total = sum(product.sprice for product in products)
    balance = 0
    balances = Narations.objects.filter(status=0)
    for balance in balances:
        balance = balance.balance
    # Templist.objects.all().delete()
    if request.method == 'POST':
        # try:
        types = request.POST.get('types')
        model = request.POST.get('model')
        cpu = request.POST.get('cpu')
        ram = request.POST.get('ram')
        hdd = request.POST.get('hdd')
        bprice = request.POST.get('bprice')
        sprice = request.POST.get('sprice')
        brand = request.POST.get('brand')
        gen = request.POST.get('gen')
        screen = request.POST.get('screen')
        supplier = Narations.objects.get(status=0)
        vendor = Vendor.objects.get(id=supplier.vendor.id)
        naration = Narations.objects.get(status=0).naration
        serialno = request.POST.get('serialno')
        if Templist.objects.filter(serialno=serialno).exists():
            return redirect('/uploadstock')

        Templist.objects.create(
            screen=screen,gen=gen, terms=request.user, brand=brand,type=types,model=model,cpu=cpu, ram=ram,hdd=hdd,bprice=bprice, supplier=vendor, serialno=serialno,sprice=sprice
        )
        # except:
        #     messages.add_message(request, messages.INFO, "Please add naration add try again")


        # supplier.update(status=1)

        return redirect('/uploadstock')
    
    context = {
        "gens":gens,
        "screens":screens,
        "count":count,
        "balance":balance,
        'total_vat':total_vat,
        'total_price':total_price,
        'total_sub_total':total_sub_total,
        'items':types,
        'products':products,
        'cpus':cpus,
        'hdds':hdds,
        'rams':rams,
        'suppliers':suppliers,
        "brands":brands,
    }
    return render(request, 'uploads/stockin.html', context)


def accessory_add(request):
    Accessory.objects.all()
    if request.method =='POST':
        t = request.POST.get('name')
        en = Accessory(name=t)
        en.save()
    return redirect('/settings') 

@login_required

def SalesView(request):
    delivery = Product.objects.all().order_by('-id')
    if request.method == "POST":
        name = request.POST.get('q')
        delivery = Product.objects.filter(
            Q(fname__icontains=name) | Q(lname__icontains=name) |  Q(invono__icontains=name) | Q(location__icontains=name) | Q(document__icontains=name) | Q(delvnote__icontains=name) | Q(ref__icontains=name)| Q(id_no__icontains=name) | Q(random__icontains=name) | Q(date__icontains=name) | Q(username__icontains=name) | Q(email__icontains=name)|Q(user_name__icontains=name)
        )
    paginator = Paginator(delivery, 100)
    resume = False
    sess = request.session.get('username')
    check_existing_delivery = Dcustomer.objects.filter(user_created_at=sess, d_type='delivery', status=0)
    # Get the page number from the GET request parameters
    page_number = request.GET.get('page')

    try:
        # Retrieve the requested page of results
        page_obj = paginator.get_page(page_number)
    except PageNotAnInteger:
        # If the page number is not an integer, show the first page
        page_obj = paginator.page(1)
    except EmptyPage:
        # If the page number is out of range, show the last page
        page_obj = paginator.page(paginator.num_pages)

    context = {
        'resume':resume,
        'page_obj': page_obj,
        'deliveries': delivery,
        'user1':request.session.get('username'),
    }
    return render(request, 'deliveries/delivery.html', context)

@login_required

def Delivery_View(request):
    customers = Customer.objects.all().order_by("-id")
    sess = request.session.get('username')
    products = Temp.objects.filter(terms=sess, d_type="delivery", is_active=True)
    total = products.count()
    modes = Mode.objects.all()

    sess = request.session.get('username')
    d_customer = Dcustomer.objects.filter(user_created_at=sess, d_type="delivery", status=0)
    context ={
        "customers":customers,
        "products":products,
        "total":total,
        "modes":modes,
        "d_customer":d_customer,

    }

    return render(request, "deliveries/deliver.html", context)
@login_required

def delv_customer(request):
    if request.method=='POST':
        customer = request.POST.get('customer', None)
        mode = request.POST.get('mode', None)

        sess = request.session.get('username')
        customer_rows = Customer.objects.filter(username=customer).values()
        check = Dcustomer.objects.filter(user_created_at=sess, status=0)

        if customer_rows.exists():
            batch = [Dcustomer(lname=row['lname'], phone=row['phone'], fname=row['fname'], location=row['location'], email=row['email'], username=row['username'], id_no=row['id_no'], mode=mode, user_created_at=sess, status=0, d_type='delivery') for row in customer_rows]
            if check.exists():
                check.delete()
            Dcustomer.objects.bulk_create(batch)
        else:
            if check.exists():
                check.delete()
            Dcustomer.objects.create(username=customer, mode=mode,d_type='delivery', user_created_at=sess, status=0,)
        return redirect('/deliveries')
    return redirect('/deliveries')
@login_required

def deleteDdelivery(request, pk):
    Temp.objects.filter(id=pk).update(is_active=False)

    return redirect('/deliveries')

def DeleteReturns(request, pk):
    Temp.objects.filter(id=pk).delete()

    return redirect("/returnitems")



@transaction.atomic
@login_required

def ReturnsOut(request):
    sess = request.session.get("username")
    rows = Temp.objects.filter(terms=sess,d_type="returns")
    assets = []
    for r in rows:
        if r.serialno not in assets:
            assets.append(r.serialno)


    check = Temp.objects.filter(serialno__in=assets, is_active=True)
    if check:
        for row in rows:
            fields = [field.name for field in row._meta.fields if field.name != 'id']
            temp_entry = Masterlist()
            for field in fields:
                setattr(temp_entry, field, getattr(row, field))
            temp_entry.terms=sess
            temp_entry.is_active = True
            temp_entry.save()
            Stockout.objects.filter(random=row.random).delete()
            Orders.objects.filter(random=row.random).delete()
            Product.objects.filter(random=row.random).delete()

            Agents_Records.objects.update_or_create(
                name=User.objects.get(username=sess),
                defaults={
                    'units': F('units') - 1, 
                    'commission': F('commission') - int(row.sub_total) * 0.007,
                    'returned_units': F('returned_units') + 1,
                }
            )
            row.delete()

    else:
        messages.add_message(request, messages.INFO, "There's nothing to return")
        return redirect('/returnitems')
    
    return redirect("/sales")

@login_required

def delvsub(request):
    customer = Customer.objects.all()
    if request.method =='POST':
        sess = request.session.get('username')
        assetid=request.POST.get('assetid')
        bprice=request.POST.get('bprice')
        
        rows = Masterlist.objects.filter(Q(serialno=assetid))
        assets = []
        for r in rows:
            if r.serialno not in assets:
                assets.append(r.serialno)

        check = Temp.objects.filter(serialno__in=assets, is_active=True)
        if not check:
            if rows:
                for row in rows:
                    fields = [field.name for field in row._meta.fields if field.name != 'id']
                    temp_entry = Temp()
                    for field in fields:
                        setattr(temp_entry, field, getattr(row, field))
                    temp_entry.terms=sess
                    temp_entry.d_type='delivery'
                    temp_entry.is_active = True
                    temp_entry.sub_total = bprice
                    temp_entry.save()

            else:
                messages.add_message(request, messages.INFO, "Item does not exist")
                return redirect('/deliveries')
        
        return redirect('/deliveries')
    return redirect('/deliveries')
@login_required

def generate_new_random_number(rands):
    if Product.objects.filter(random=rands).exists():
        rands = randint(1000000, 9999999)
        rands = generate_new_random_number
    return rands

@login_required

def delvgenerate(table):
    if table == 'Product':
        # Assuming you are using Django's ORM (Object-Relational Mapping)
        from .models import Product

        # Check if the table is empty
        if Product.objects.exists():
            # Get the maximum 'delvnote' from the table
            max_delvnote = Product.objects.aggregate(models.Max('delvnote'))['delvnote__max']

            if max_delvnote:
                # Increment the maximum 'delvnote' and return the incremented value
                return increment_delvnote(max_delvnote)
            else:
                return 'AA000'
        else:
            return 'AA000' 

def increment_delvnote(delvnote):
    x = delvnote
    x = int(delvnote, 36) + 1
    delv = numpy.base_repr(x, 36)
    return delv

def clear_delv(request):
    sess = request.session.get('username')
    Dcustomer.objects.filter(d_type='delivery', user_created_at=sess, status=0).delete()
    Temp.objects.filter(d_type='delivery', terms=sess).delete()
    return redirect('/deliveries')

@login_required

def CustomerBalances(request, pk):
    try:

        customer_balances = Orders.objects.filter(name=pk).values().order_by("-id")
    except:
        messages.add_message(request, messages.INFO, "Something went wrong!, please try again")
        return redirect("/view-balances")
    
    context ={
        "username":pk,
        "customer_balances":customer_balances,

    }

    return render(request, "home/customer-balances.html", context)

def SupplierBalances(request, pk):
    try:

        customer_balances = SupplierOrders.objects.filter(name=pk).values().order_by("-id")
    except:
        messages.add_message(request, messages.INFO, "Something went wrong!, please try again")
        return redirect("/view-balances")
    
    context ={
        "username":pk,
        "customer_balances":customer_balances,

    }
    return render(request, "home/supplier-balances.html", context)



from jinja2 import Environment, FileSystemLoader

from random import randint
import os
import platform
def generate_html_receiptsup(customer_name, orders):
    companyName = customer_name
    filename = f"{customer_name}.txt"
    companyName = companyName + "\n\nSale Receipt\n\nOpp Golden Line Mall\nP.O BOX 3404-20100\n TEL: 0727441192\nEMAIL: Hiltonltd@yandex.com"
    receiptNo = randint(1, 100000)
    finalString = companyName + "\n\nReceipt No:" + str(receiptNo) + "\n"

    if orders:
        for order in orders:
            finalString += "\n______________________________________\n" + f"Amount:        {order['amount']}" + "\n______________________________________\n\n" + f"Paid In:     {order['order_type']}" + "\n\n" +"\n" + "\nBalance:            {order['total_amount']}"  + "\n\n\nWelcome Back"
    else:
        finalString += "\n\nNo orders for this customer."

    # try:
    with open(filename, "w") as f:
        f.write(finalString)
    
    if platform.system() == "Windows":
        os.startfile(filename, "print")
    else:
        # Add code here for opening/processing files on non-Windows platforms
        print(f"Printing not supported on {platform.system()}")
    
    return redirect(f"/supplier-balances/{customer_name}")


def generate_html_receipt(customer_name, orders):
    companyName = customer_name
    filename = f"{customer_name}.txt"
    companyName = companyName + "\n\nSale Receipt\n\nOpp Golden Line Mall\nP.O BOX 3404-20100\n TEL: 0727441192\nEMAIL: Hiltonltd@yandex.com"
    receiptNo = randint(1, 100000)
    finalString = companyName + "\n\nReceipt No:" + str(receiptNo) + "\n"

    if orders:
        for order in orders:
            finalString += "\n______________________________________\n" + f"Amount:        {order['amount']}" + "\n______________________________________\n\n" + f"Paid In:     {order['order_type']}" + "\n\n" +"\n" + "\nBalance:            {order['total_amount']}"  + "\n\n\nWelcome Back"
    else:
        finalString += "\n\nNo orders for this customer."

    # try:
    with open(filename, "w") as f:
        f.write(finalString)
    
    if platform.system() == "Windows":
        os.startfile(filename, "print")
    else:
        # Add code here for opening/processing files on non-Windows platforms
        print(f"Printing not supported on {platform.system()}")
    
    return redirect(f"/customer-balances/{customer_name}")
    # except Exception as e:
    #     print(f"Error generating receipt: {e}")
    #     return None

def PrintReceiptSup(request, name):
    orders = SupplierOrders.objects.filter(name=name).values()
    return generate_html_receiptsup(name, orders)

def PrintReceipt(request, name):
    orders = Orders.objects.filter(name=name).values()
    return generate_html_receipt(name, orders)

    return redirect(f"/customer-balances/{name}")

@login_required

def MakePayments(request):
    if request.method == "POST":
        print(f"Got the request")

        customer = request.POST.get("customer")
        amount = request.POST.get("amount")
        orders = Orders.objects.filter(name=customer).values().order_by("-id").first()
        if orders:
            running_balance = int(orders['total_amount'])
            running_balance -= int(amount)
            rands = orders['random']
            Orders.objects.create(name=customer, order_type="Debit", random=rands, amount=amount, total_amount=running_balance)

        print(f"customer:{customer}, amount:{amount}")

    return redirect(f"/customer-balances/{customer}")

@login_required

def MakePaymentsSup(request):
    if request.method == "POST":
        customer = request.POST.get("customer")
        amount = request.POST.get("amount")
        orders = SupplierOrders.objects.filter(name=customer).values().order_by("-id").first()
        if orders:
            running_balance = int(orders['total_amount'])
            running_balance -= int(amount)
            rands = orders['random']
            SupplierOrders.objects.create(name=customer, order_type="Debit", random=rands, amount=amount, total_amount=running_balance)

    return redirect(f"/supplier-balances/{customer}")


@transaction.atomic
@login_required

def delvout(request):
    rands = randint(10000000, 99999999)
    page = '/delivery'
    title = 'DELIVERY NOTE'
    sess = request.session.get('username')
    delv = None
    delvivery_ref = None
    import datetime
    if request.method == 'POST':
        datedelis = request.POST.get('datedelivered')
        datedelivered = datetime.datetime.strptime(datedelis, '%Y-%m-%d').date() if datedelis else date.today()
        customerss = request.POST.get('username')
        fname = request.POST.get('fname')
        lname = request.POST.get('lname')
        location = request.POST.get('location')
        invono = request.POST.get('invoice')
        location = request.POST.get('location')
        email = request.POST.get('email')
        mode = request.POST.get('mode')
        customer_count = Dcustomer.objects.filter(username=customerss, user_created_at=sess, status=0, d_type='delivery').exists()
        if not customer_count:
            messages.add_message(request, messages.WARNING, 'Kindly update customer and try again...')
            return redirect('/deliveries')
        masterlist_count = Temp.objects.filter(d_type='delivery', terms=sess, is_active=True).count()
        if masterlist_count < 1:
            messages.add_message(request, messages.WARNING, 'Kindly scan Items and try again?')
            return redirect('/deliveries')


        sold_to = None
        try:
            sold_to = Customer.objects.get(username=customerss)
        except:
            sold_to = customerss

        check_random_temp = Temp.objects.filter(terms=sess ).values()
        check_random_product = Product.objects.filter(random=check_random_temp[0]['random']).values()
        Dcustomer.objects.filter(username=customerss, d_type='delivery', status=0, user_created_at=sess).update(random=rands, status=1)
        delvivery_ref = None
        table = 'Product'
        delv = delvgenerate(table)
        rands = generate_new_random_number(rands)
        pdfs = '.pdf'
        document = f"{customerss}{delv}"
        excell = f"{rands}_{customerss}.xls"
        amount = 0
        bprice = 0
        rows = Temp.objects.filter(d_type='delivery', terms=sess,is_active=True)
        units = rows.count()
        for temp_item in rows:
            fields = [field.name for field in Temp._meta.fields if field.name != 'id']
            stockout_entry = Stockout()
            for field in fields:
                setattr(stockout_entry, field, getattr(temp_item, field))
            stockout_entry.qty = 1
            amount += temp_item.sub_total
            try:
                bprice += temp_item.bprice
            except:
                bprice += 0

            stockout_entry.datedelivered = datedelivered
            stockout_entry.random = rands
            stockout_entry.created_by = sess
            stockout_entry.customer = customerss
            stockout_entry.mode ='Sold'
            stockout_entry.invoice = invono
            stockout_entry.delvno = delv
            stockout_entry.save()
            Masterlist.objects.filter(serialno=temp_item.serialno).delete()
        items = (Stockout.objects.filter(random=rands)
        .values_list('type', 'brand', 'gen', 'model', 'cpu', 'speed', 'ram', 'hdd', 'screen', 'comment')
        .annotate(count=Count('qty')))
        if check_random_product.count() < 1:
            delvivery_ref = delv

            data = [Product(
                fname=fname, lname=lname, amount=amount,mode=invono, invono=invono, total=Temp.objects.filter(d_type='delivery', terms=sess, is_active=True).count(),
                location=location, document=document, delvnote=delv, ref=rands, id_no=excell, random=rands,
                date=datedelivered, username=customerss, email=email, user_name=sess, sold_to=sold_to,bprice=bprice
            )]
            Product.objects.bulk_create(data)
        else:
            for delvs in check_random_product:
                if delvs:
                    delvivery_ref = delvs['delvnote']
                else:
                    delvivery_ref = delv
            Product.objects.filter(random=check_random_temp[0]['random']).update(
                fname=fname, lname=lname, amount=amount,mode=invono,invono=invono, total=Temp.objects.filter(d_type='delivery', terms=sess, is_active=True).count(),
                location=location, document=document, ref=rands, id_no=excell, random=rands,
                date=datedelivered, username=customerss, email=email, user_name=sess,sold_to=sold_to,bprice=bprice
            )
        Temp.objects.filter(terms=sess).delete()
        existing_customer = Orders.objects.filter(name=customerss).order_by("-id").first()
        if existing_customer:

            if existing_customer.total_amount is not None:
                total_amount = int(existing_customer.total_amount)
            else:
                total_amount = 0
        else:
            total_amount = 0

        if mode == "Credit":
            existing_customer = Orders.objects.filter(name=customerss).order_by("-id").first()
            if existing_customer:

                total_amount += int(amount)

                Orders.objects.create(
                    name=customerss,
                    order_type="Credit",
                    random=rands,
                    amount=amount,
                    date=datedelivered,
                    total_amount=total_amount
                )
            else:
                Orders.objects.create(
                    name=customerss,
                    order_type="Credit",
                    random=rands,
                    amount=amount,
                    date=datedelivered,
                    total_amount=amount
                )
        else:
            Orders.objects.create(name=customerss, order_type=mode, random=rands, amount=amount, date=datedelivered, total_amount=total_amount)
        
        agent = User.objects.get(username=sess)
        # UnicodeTranslateError

        current_month = datetime.datetime.now().month
        current_year = datetime.datetime.now().year



        # Fetch or create the record for the current month and user
        Agents_Records.objects.update_or_create(
            name=User.objects.get(username=sess),
            date__month=current_month,
            date__year=current_year,
            defaults={
                'sales_revenue': F('sales_revenue') + int(amount),
                'units': F('units') + units,
                'commission': F('commission') + int(amount) * 0.007,
                'random': rands,
            }
        )


    receipt_output = generate_receipt_txt(delvivery_ref, items, customerss, rands, datedelivered, location, invono, title, document)
    return redirect("/sales")
    # Create an HTTP response with the receipt content
    response = HttpResponse(receipt_output, content_type='text/plain')
    return response
    
# from escpos import printer
import platform
import os
@login_required

def generate_receipt_txt(delivery_ref, items, customerss, rands, datedelivered, location, invono, title, document):
    # Generate the receipt content
    receipt = []
    receipt.append(title.center(40))  # Center the title in a 40-character width

    receipt.append(f"Customer: {customerss}")
    receipt.append(f"Date: {datedelivered}")
    receipt.append(f"Address: {location}")
    receipt.append(f"Phone: {rands}")
    receipt.append(f"Delivery No.: {delivery_ref}")
    receipt.append(f"Email: {customerss.lower()}")
    receipt.append(f"Reference No.: {invono}")

    # Header for the "Type  Description  Qty" section
    header = "Type  Description  Qty"
    receipt.append("\n" + header)
    for item in items:

        print(f"item:{item}")
        item_line = f"{item[0]}   {item[0]}   {item[0]}   {item[10]}"
        receipt.append(item_line)

    # Calculate the total quantity
    total_qty = sum(item[10] for item in items)
    receipt.append("\n" + f"Total Qty: {total_qty}")

    # Save the receipt as a text file
    txt_filename = f"{document}.txt"
    folder_path = '/main/'
    if not os.path.exists(folder_path):
        os.makedirs(folder_path)
    file_path = os.path.join(folder_path, f"{txt_filename}")

    with open(file_path, "w") as txt_file:
        txt_file.write("\n".join(receipt))
    # For printing on Windows
    if platform.system() == "Windows":
        os.startfile(file_path, "print")
    else:
        # Add code here for opening/processing files on non-Windows platforms
        print(f"Printing not supported on {platform.system()}")


from django.http import HttpResponse
from escpos.printer import Usb
import os

def PrintDocument(request, document):
    # Specify the folder path
    folder_path = "/main/"

    # Construct the file path
    txt_filename = f"{document}.txt"
    file_path = os.path.join(folder_path, txt_filename)

    # Check if the file exists
    if os.path.exists(file_path):
        # Read the content of the file
        with open(file_path, "r") as txt_file:
            receipt_content = txt_file.read()
        printer = None
        try:
            printer = Usb(0x0416, 0x5011)  # Adjust the USB vendor and product ID
            printer.text(receipt_content)
            printer.cut()
        except:
            messages.add_message(request, messages.INFO, "Device not found or cable not connected")

        # Return a response
        messages.add_message(request, messages.INFO, f"Receipt {document} printed successfully.")
        return redirect("/sales")
    else:
        messages.add_message(request, messages.INFO, f"Receipt {document} not found.")
        return redirect("/sales")

def delvcsv(request):
    pass