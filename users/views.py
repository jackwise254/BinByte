from django.shortcuts import render, redirect
from django.contrib.auth import authenticate,login as user_login, logout as user_logout
from .models import *
from django.contrib.sessions.models import Session
from django.contrib import messages
from django.contrib.auth.hashers import check_password

def get_active_sessions_for_user(user):
    user_sessions = []
    for session in Session.objects.filter(expire_date__gte=timezone.now()):
        data = session.get_decoded()
        if data.get('_auth_user_id', None) == str(user.id):
            user_sessions.append(session)
    return user_sessions


def LoginPage(request):
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')
        user = User.objects.get(email=email)
        if check_password(password, user.password):
            active_sessions = get_active_sessions_for_user(user)
            if active_sessions:
                for session in active_sessions:
                    session.delete()
            user_login(request, user)
            user_details = User.objects.filter(email=email).values('type', 'username', 'id').first()
            user_type = user_details['type']
            username = user_details['username']
            user_id = user_details['id']
            request.session['user'] = user_type
            request.session['username'] = username
            user_redirection = {
                'ADMIN': '/home_page',
                'TECHNICIAN': '/warrantyin',
                'SALES': '/stockout',
            }
            return redirect(user_redirection.get(user_type, '/'))  # Fallback to root if user type not in the dictionary

        else:
            messages.info(request, 'Invalid login credentials')

    return render(request, "accounts/login.html")

def LogoutView(request):
    user_logout(request)
    
    return redirect('/accounts/login')