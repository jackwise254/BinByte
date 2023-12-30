from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from random import randint
from django.utils.encoding import smart_str
import xlwt
from .models import *
from django.db.models import Count
from django.db.models import Q
from django.contrib import messages
import csv, io
from itertools import chain
from django.db.models import Sum

def customercsvss(request):
    response = HttpResponse(content_type='application/ms-excel')
    names = str(randint(1000000, 9999999))  + str('_customers.xls')
    sess= request.session.get('username')

    response['Content-Disposition'] = 'attachment; filename=%s' % smart_str(names)  

    wb = xlwt.Workbook(encoding='utf-8')
    ws = wb.add_sheet('Customers ')
    
    row_num = 0
    columns = ['USERNAME', 'FIRSTNAME', 'LASTNAME', 'EMAIL', 'IDNO', 'PHONE', 'LOCATION']

    for col_num in range(len(columns)):
            ws.write(row_num, col_num, columns[col_num])

    rows = Customer.objects.all().values_list('username', 'fname', 'lname','email', 'id_no', 'phone', 'location')
    for row in rows:
        row_num += 1
        for col_num in range(len(row)):
            value = row[col_num]
            if value is None:
                value = '' 
            ws.write(row_num, col_num, value)

    wb.save(response)
    return response