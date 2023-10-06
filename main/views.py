from django.shortcuts import render, redirect
from users.models import *
from django.contrib.auth.decorators import login_required
from django.contrib.sessions.models import Session
from django.db.models import Q
from .models import *
from .spreadsheets import *
import pandas as pd
from django.core.files.storage import FileSystemStorage


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


def upload_stock(request):
    types = Type.objects.all()
    cpus = Cpu.objects.all()
    hdds = Hdd.objects.all()
    rams = Ram.objects.all()
    if request.method == 'POST':
        types = request.POST.get('type')
        model = request.POST.get('model')
        cpu = request.POST.get('cpu')
        ram = request.POST.get('ram')
        hdd = request.POST.get('hdd')
        price = request.POST.get('price')
        supplier = request.POST.get('supplier')
        naration = request.POST.get('naration')
        serialno = request.POST.get('serialno')
        print(f"types:{types}, model:{model}, cpu:{cpu}, ram:{ram}, hdd:{hdd}, price:{price}, supplier:{supplier}, naration:{naration}, serialno:{serialno}")


    context = {
        'types':types,
        'cpus':cpus,
        'hdds':hdds,
        'rams':rams,
    }


    return render(request, 'uploads/stockin.html', context)