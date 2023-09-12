from django.shortcuts import render, redirect

# Create your views here.
def Home(request):

    return redirect('/accounts/login')

def HomePage(request):
    

    return render(request, 'home/index.html')