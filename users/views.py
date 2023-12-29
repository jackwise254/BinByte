from django.contrib import messages
from django.contrib.auth.hashers import check_password
from django.shortcuts import render, redirect
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.sessions.models import Session
from django.contrib.auth import login as user_login
from django.contrib.auth import logout
from .models import User
from django.utils import timezone
from datetime import date
from .models import Subscription

def LoginPage(request):
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')

        try:
            user = User.objects.get(email=email)
        except ObjectDoesNotExist:
            messages.info(request, 'Invalid login credentials')
            return render(request, "accounts/login.html")

        if check_password(password, user.password):
            today = date.today()
            user_details = User.objects.filter(email=email).values('type', 'username', 'id').first()
            user_type = user_details['type']
            username = user_details['username']
            user_id = user_details['id']
            check = Subscription.objects.filter(user_id=user_id).first()
            if check:
                Subscription.objects.filter(user_id=user_id).update(plan='basic', expiration_date='2024-01-5')
            else:
                Subscription.objects.create(plan='basic', expiration_date='2024-01-5', user_id=user_id)

            sub_date = Subscription.objects.filter(user_id=user_id).values('expiration_date').first()['expiration_date']
            messages.add_message(request, messages.INFO, "The trial period has ended. Please reach out to the administrator for further assistance.")

            if sub_date <= today:
                return redirect('/accounts/login/')

            # Delete active sessions for the user
            active_sessions = Session.objects.filter(expire_date__gte=timezone.now(), session_key__contains=str(user.id))
            for session in active_sessions:
                session.delete()

            # Log in the user
            user_login(request, user)

            # Get user details for session storage
            user_details = User.objects.filter(email=email).values('type', 'username', 'id').first()
            user_type = user_details['type']
            username = user_details['username']
            user_id = user_details['id']

            # Set session variables
            request.session['user'] = user_type
            request.session['username'] = username

            # Define redirection URLs based on user type
            user_redirection = {
                'ADMIN': '/home_page',
                'TECHNICIAN': '/warrantyin',
                'SALES': '/stockout',
            }

            return redirect(user_redirection.get(user_type, '/'))

        else:
            messages.info(request, 'Invalid login credentials')

    return render(request, "accounts/login.html")


def LogoutView(request):
    logout(request)

    return redirect('/accounts/login')

def AddStaff(request):
    '''
    View for principal to add teachers
    '''
    all_type_codes = [type_code for type_code, _ in User.Types.choices]

    context = {
        'types':all_type_codes,
    }
    try:
        if request.method == 'POST':
                email = request.POST.get('email')
                firstname = request.POST.get('firstname')
                username = request.POST.get('username')
                lastname = request.POST.get('lastname')
                password = request.POST.get('password')
                user_type = request.POST.get('user_type')

                User.objects.create_user(username=username, firstname=firstname, lastname=lastname, email=email, password=password, type=user_type, )
                return redirect('/staff_member')            
    except:
            messages.add_message(request, messages.INFO, 'Something went wrong, try again')
            return redirect('/staff_member')
    return render(request, 'accounts/addstaff.html', context)
