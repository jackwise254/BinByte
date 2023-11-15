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


# Create your views here.
def Home(request):

    return redirect('/accounts/login')

def HomePage(request):
    # Get the current date and time
    current_date = timezone.now()

    # Calculate the start and end of the current month
    start_of_month = current_date.replace(day=1, hour=0, minute=0, second=0, microsecond=0)
    end_of_month = (start_of_month + timezone.timedelta(days=32)).replace(day=1, hour=0, minute=0, second=0, microsecond=0)

    # Query the "Stockout" model to count products for the current month
    count_current_month = Stockout.objects.filter(datedelivered__lt=start_of_month, datedelivered__gte=end_of_month).count()

    stock = Masterlist.objects.all().count()
    sales = Product.objects.all().order_by("-id")[:10]
    orders = Orders.objects.all().order_by("-id")[:10]
    if orders:
        start_date = min(order.date for order in orders)
        end_date = max(order.date for order in orders)
    else:
        start_date = end_date = None
    context ={
        "start_date":start_date,
        "end_date":end_date,
        "orders":orders,
        "stockout":count_current_month,
        'selected':True,
        "stock":stock,
        "sales":sales,
    }

    return render(request, 'home/index.html', context)


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

# @login_required
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

def delete_customer(request):
    if request.method == "POST":
        username = request.POST.get('username')
        Customer.objects.filter(username__icontains=username).delete()

    return redirect('/customers')

def vendors_view(request):
    vendor = Vendor.objects.all()

    return render(request, 'accounts/vendors.html', {'form':vendor, 'selected':'vendors'})

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

def delete_vendor(reqesut, pk):
    Vendor.objects.get(id=pk).delete()
    return redirect('/vendors')


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
def masterlistview(request):
    template_name = "stock/stockin.html"
    products =  Masterlist.objects.all()[:500]
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
    }

    return render(request, template_name, context)

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

    master_count = Stockout.objects.count()
    masterlist = Stockout.objects.all()
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
        'user1':user1,
        'title1': 'In',
        'colors': ['red', 'green', 'blue', 'yellow', 'orange'],
        'selected':'stockout',
    }
    return render(request, template_name, context)


def FetchProduct(request, title):
    template_name = "stock/stockin.html"
    k_split = title.split()
    conditions = k_split[0]
    types = k_split[1:]
    types = ' '.join(types)
    print(f"conditions:{conditions}")
    masterlists = Masterlist.objects.filter(type=conditions)
    count = masterlists.count()
    masterlist = Masterlist.objects.filter(type=conditions).order_by('-daterecieved')[:500]

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
def PushTemplist(request):
    rows = Templist.objects.filter(terms=request.user)
    # Bulk create Masterlist entries
    masterlist_entries = []
    for temp_item in rows:
        masterlist_entry = Masterlist()

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
    naration.status = 1
    naration.save()

    # Create Orders entry
    Orders.objects.create(name=naration.vendor.username, order_type="Debit", amount=naration.balance, date=naration.date)

    return redirect('/uploadstock')



def ClearTemplist(request):
    Templist.objects.filter(terms=request.user).delete()
    return redirect('/uploadstock')

def DeleteTemplist(request, pk):
    Templist.objects.get(id=pk).delete()
    return redirect('/uploadstock')


def NarationSub(request):
    if request.method == "POST":
        supplier = request.POST.get('supplier')
        naration = request.POST.get('naration')
        amount = request.POST.get('amount')
        vendor = Vendor.objects.get(username=supplier)

        # Get the latest balance for the vendor
        latest_balance = Narations.objects.filter(vendor=vendor).aggregate(Max('balance'))['balance__max']

        # If there is a latest balance, add it to the amount as acc_balance
        if latest_balance is not None:
            acc_balance = float(amount) + float(latest_balance)
        else:
            acc_balance = amount

        # Create a new Narations instance with the updated acc_balance
        Narations.objects.create(vendor=vendor, naration=naration, amount=amount, balance=acc_balance, status=0)

        return redirect("/uploadstock")
    return redirect("/uploadstock")

def upload_stock(request):
    types = Type.objects.all()
    cpus = Cpu.objects.all()
    hdds = Hdd.objects.all()
    rams = Ram.objects.all()
    suppliers = Vendor.objects.all()
    products = Templist.objects.all()
    total_vat = sum(product.vat for product in products)
    total_price = sum(product.price for product in products)
    total_sub_total = sum(product.sub_total for product in products)
    balance = 0
    balances = Narations.objects.filter(status=0)
    for balance in balances:
        balance = balance.balance
    # Templist.objects.all().delete()
    if request.method == 'POST':
        try:
            types = request.POST.get('types')
            model = request.POST.get('model')
            cpu = request.POST.get('cpu')
            ram = request.POST.get('ram')
            hdd = request.POST.get('hdd')
            price = request.POST.get('price')
            supplier = Narations.objects.get(status=0)
            vendor = Vendor.objects.get(id=supplier.vendor.id)
            naration = Narations.objects.get(status=0).naration
            serialno = request.POST.get('serialno')
            if Templist.objects.filter(serialno=serialno).exists():
                return redirect('/uploadstock')

            Templist.objects.create(
                terms=request.user, type=types,model=model,cpu=cpu, ram=ram,hdd=hdd,price=price, supplier=vendor, serialno=serialno
            )
        except:
            messages.add_message(request, messages.INFO, "Please add naration add try again")


        # supplier.update(status=1)

        return redirect('/uploadstock')
    
    context = {
        "balance":balance,
        'total_vat':total_vat,
        'total_price':total_price,
        'total_sub_total':total_sub_total,
        'items':types,
        'products':products,
        'cpus':cpus,
        'hdds':hdds,
        'rams':rams,
        'suppliers':suppliers
    }


    return render(request, 'uploads/stockin.html', context)

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

def delv_customer(request):
    if request.method=='POST':
        customer = request.POST.get('customer')
        mode = request.POST.get('mode')
        sess = request.session.get('username')
        rows = Customer.objects.filter(username=customer).values()
        check = Dcustomer.objects.filter(user_created_at=sess, status=0)
        if not check:
            batch = [Dcustomer(lname=row['lname'], phone=row['phone'], fname=row['fname'], location=row['location'], email=row['email'], username=row['username'], id_no=row['id_no'], mode=mode,user_created_at=sess, status=0, d_type='delivery') for row in rows]
            Dcustomer.objects.bulk_create(batch)
        else:
            check.delete()
            batch = [Dcustomer(lname=row['lname'], phone=row['phone'], fname=row['fname'], location=row['location'], email=row['email'], username=row['username'], id_no=row['id_no'], mode=mode,user_created_at=sess, status=0, d_type='delivery') for row in rows]
            Dcustomer.objects.bulk_create(batch)
        return redirect('/deliveries')
    return redirect('/deliveries')

def deleteDdelivery(request, pk):
    Temp.objects.filter(id=pk).update(is_active=False)

    return redirect('/deliveries')


def delvsub(request):
    customer = Customer.objects.all()
    if request.method =='POST':
        sess = request.session.get('username')
        assetid=request.POST.get('assetid')
        
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
                    temp_entry.save()

            else:
                messages.add_message(request, messages.INFO, "Item does not exist")
                return redirect('/deliveries')
        
        return redirect('/deliveries')
    return redirect('/deliveries')

def generate_new_random_number(rands):
    if Product.objects.filter(random=rands).exists():
        rands = randint(1000000, 9999999)
        rands = generate_new_random_number
    return rands


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

@transaction.atomic
def delvout(request):
    rands = randint(1000000, 9999999)
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
        customer_count = Dcustomer.objects.filter(username=customerss, user_created_at=sess, status=0, d_type='delivery').exists()
        if not customer_count:
            messages.add_message(request, messages.WARNING, 'Kindly update customer and try again...')
            return redirect('/deliveries')
        masterlist_count = Temp.objects.filter(d_type='delivery', terms=sess, is_active=True).count()
        if masterlist_count < 1:
            messages.add_message(request, messages.WARNING, 'Kindly scan Items and try again?')
            return redirect('/deliveries')
        sold_to = Customer.objects.get(username=customerss)
        check_random_temp = Temp.objects.filter(terms=sess ).values()
        check_random_product = Product.objects.filter(random=check_random_temp[0]['random']).values()
        Dcustomer.objects.filter(username=customerss, d_type='delivery', status=0, user_created_at=sess).update(random=rands, status=1)
        delvivery_ref = None
        table = 'Product'
        delv = delvgenerate(table)
        rands = generate_new_random_number(rands)
        pdfs = '.pdf'
        document = f"{customerss}{delv}{pdfs}"
        excell = f"{rands}_{customerss}.xls"
        

        amount = 0
        rows = Temp.objects.filter(d_type='delivery', terms=sess,is_active=True)
        for temp_item in rows:
            fields = [field.name for field in Temp._meta.fields if field.name != 'id']
            stockout_entry = Stockout()
            for field in fields:
                setattr(stockout_entry, field, getattr(temp_item, field))
            stockout_entry.qty = 1
            amount += temp_item.sub_total

            stockout_entry.datedelivered = datedelivered
            stockout_entry.random = rands
            stockout_entry.created_by = sess
            stockout_entry.customer = customerss
            stockout_entry.mode ='Sold'
            stockout_entry.invoice = invono
            stockout_entry.delvno = delv
            stockout_entry.save()
            Masterlist.objects.filter(serialno=temp_item.serialno).delete()
            # temp_item.delete()
        items = (Stockout.objects.filter(random=rands)
        .values_list('type', 'brand', 'gen', 'model', 'cpu', 'speed', 'ram', 'hdd', 'screen', 'comment')
        .annotate(count=Count('qty')))
    

        if check_random_product.count() < 1:
            delvivery_ref = delv

            data = [Product(
                fname=fname, lname=lname, amount=amount,mode=invono, invono=invono, total=Temp.objects.filter(d_type='delivery', terms=sess, is_active=True).count(),
                location=location, document=document, delvnote=delv, ref=rands, id_no=excell, random=rands,
                date=datedelivered, username=customerss, email=email, user_name=sess, sold_to=sold_to,
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
                date=datedelivered, username=customerss, email=email, user_name=sess,sold_to=sold_to
            )
        Temp.objects.filter(terms=sess).delete()

        
    receipt_output = print_receipt(delvivery_ref, items, customerss, rands, datedelivered, location, invono, title)


    # Create an HTTP response with the receipt content
    response = HttpResponse(receipt_output, content_type='text/plain')

    return response
    
    
    # pdf(
    #         request, delvivery_ref, items, page, document, Stockout, customerss, rands, datedelivered, location,
    #         invono, title
    #     )


# from escpos.printer import Network

# def print_receipt(delivery_ref, items, customerss, rands, datedelivered, location, invono, title):
# from escpos import printer
from escpos import printer

def print_receipt(delivery_ref, items, customerss, rands, datedelivered, location, invono, title):
    # Create a connection to the thermal printer
    # p = printer.Serial("COM1", baudrate=9600, timeout=10)

    # Generate the receipt content
    receipt = []
    receipt.append(title)
    receipt.append("Customer: {}".format(customerss))
    receipt.append("Date: {}".format(datedelivered))
    receipt.append("Address: {}".format(location))
    receipt.append("Phone: {}".format(rands))
    receipt.append("Delivery No.: {}".format(delivery_ref))
    receipt.append("Email: {}".format(customerss.lower()))
    receipt.append("Reference No.: {}".format(invono))

    # Calculate the maximum length for each field
    max_type_length = max(len(str(item[0])) for item in items)
    max_description_length = max(len(item[0] + ' ' + item[0] + ' ' + item[0]) for item in items)
    max_qty_length = max(len(str(item[10])) for item in items)

    # Header for the "Type  Description  Qty" section
    header = "Type  Description  Qty"
    receipt.append(header)

    # Generate item lines based on the maximum lengths
    for item in items:
        item_line = "{:<{}} {:<{}} {:<{}}".format(item[0], max_type_length, item[0] + ' ' + item[0] + ' ' + item[0], max_description_length, item[10], max_qty_length)
        receipt.append(item_line)

    # Calculate the total quantity
    total_qty = sum(item[10] for item in items)
    receipt.append("Total Qty: {}".format(total_qty))
    output_filename = f"{customerss}.txt"

    # Save the receipt as a text file
    with open(output_filename, "w") as f:
        f.write("\n".join(receipt))


    # Print the receipt
    # for line in receipt:
    #     p.text(line + '\n')

    # # Cut the paper
    # p.cut()

    # # Close the printer connection
    # p.close()

# Usage example
# items = [('Product1', 'Category1', 'Brand1', 'Description1', 1)]
# print_receipt("AA001", items, "Customer Name", "1234567890", "2023-11-04", "Delivery Address", "iTEST1", "Receipt Title", "receipt.txt")




def generate_receipt(delivery_ref, items, customerss, rands, datedelivered, location, invono, title):
    p = printer.Serial("COM1", baudrate=9600)
    p = printer.Serial("/dev/ttyUSB0", baudrate=9600)


    receipt_content = print_receipt(delivery_ref, items, customerss, rands, datedelivered, location, invono, title)

    # Send the receipt content to the printer
    p.text(receipt_content)

    # Cut the paper and close the printer
    p.cut()
    p.close()


# Example usage
# receipt_output = print_receipt(delivery_ref, items, customerss, rands, datedelivered, location, invono, title)
# print(receipt_output)  # This will print the receipt to the screen

# if __name__ == "__main__":
#     print_receipt(delivery_ref, items, session_username, Model, customers, rands, datedelivered, location, invono, title)


def delvcsv(request):
    pass