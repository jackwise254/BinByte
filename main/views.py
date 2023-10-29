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


# Create your views here.
def Home(request):

    return redirect('/accounts/login')

def HomePage(request):
    context ={
        'selected':True
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
    masterlists = Masterlist.objects.filter(type__icontains=types)
    count = masterlists.count()
    masterlist = Masterlist.objects.filter(type__icontains=types).order_by('-daterecieved')[:500]

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
    
def PushTemplist(request):
    rows = Templist.objects.filter(terms=request.user)
    for temp_item in rows:
        fields = [field.name for field in Templist._meta.fields if field.name != 'id']
        masterlist_entry = Masterlist()
        for field in fields:
            setattr(masterlist_entry, field, getattr(temp_item, field))
        masterlist_entry.save()
        temp_item.delete()

    return redirect('/uploadstock')

def ClearTemplist(request):
    Templist.objects.filter(terms=request.user).delete()
    return redirect('/uploadstock')

def DeleteTemplist(request, pk):
    Templist.objects.get(id=pk).delete()
    return redirect('/uploadstock')

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
    # Templist.objects.all().delete()
    if request.method == 'POST':
        types = request.POST.get('types')
        model = request.POST.get('model')
        cpu = request.POST.get('cpu')
        ram = request.POST.get('ram')
        hdd = request.POST.get('hdd')
        price = request.POST.get('price')
        supplier = request.POST.get('supplier')
        supplier = Vendor.objects.get(username=supplier)
        naration = request.POST.get('naration')
        serialno = request.POST.get('serialno')

        Templist.objects.create(
            terms=request.user, type=types,model=model,cpu=cpu, ram=ram,hdd=hdd,price=price, supplier=supplier, serialno=serialno
        )

        return redirect('/uploadstock')
    
    context = {
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


