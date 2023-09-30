from django.db import models

# Create your models here.

class Customer(models.Model):
    fname = models.CharField(max_length=200, null=True)
    lname = models.CharField(max_length=200, null=True)
    phone = models.CharField(max_length=200, null=True)
    location = models.CharField(max_length=200, null=True)
    email = models.CharField(max_length=200, null=True)
    user_created_at = models.CharField(max_length=200, null=True)
    random = models.CharField(max_length=200, null=True)
    username = models.CharField(max_length=200, null=True)
    id_no = models.CharField(max_length=200, null=True)
    status = models.CharField(max_length=200, null=True)
    invono = models.CharField(max_length=200, null=True)
    date_joined = models.DateField(auto_now=True)
    id_document = models.ImageField(max_length=200, null=True)
    pin_document = models.ImageField(max_length=200, null=True)
    registration_document = models.ImageField(max_length=200, null=True)
    l_document = models.ImageField(max_length=200, null=True)
    business_document = models.ImageField(max_length=200, null=True)
    location_document = models.ImageField(max_length=200, null=True)
    other_document = models.ImageField(max_length=200, null=True)

    class Meta:
        ordering = ["username"]


class Vendor(models.Model):
    fname = models.CharField(max_length=200, null=True)
    lname = models.CharField(max_length=200, null=True)
    phone = models.CharField(max_length=200, null=True)
    location = models.CharField(max_length=200, null=True)
    email = models.CharField(max_length=200, null=True)
    user_created_at = models.CharField(max_length=200, null=True)
    random = models.CharField(max_length=200, null=True)
    username = models.CharField(max_length=200, null=True)
    id_no = models.CharField(max_length=200, null=True)
    status = models.CharField(max_length=200, null=True)
    invono = models.CharField(max_length=200, null=True)

class Masterlist(models.Model):
    type = models.CharField(max_length=200 , null=True)
    serialno = models.CharField(max_length=200 , null=True)
    model = models.CharField(max_length=200 , null=True)
    cpu = models.CharField(max_length=200 , null=True)
    ram = models.CharField(max_length=200 , null=True)
    hdd = models.CharField(max_length=200 , null=True)
    daterecieved = models.DateField(auto_now_add=False, null=True)
    qty = models.CharField(max_length=200 , null=True)
    total = models.CharField(max_length=200 , null=True)
    dels = models.CharField(max_length=200 , null=True)
    supplier = models.ForeignKey(Vendor, on_delete=models.CASCADE, null=True)
    unit_price = models.CharField(max_length=200 , null=True)
    total = models.CharField(max_length=200 , null=True)
    vat = models.CharField(max_length=200 , null=True)
    class Meta:
        ordering = ["-id"]


class NewCondition(models.Model):
    conditions = models.CharField(max_length = 200)
    created_at = models.DateField(auto_now_add=True)

class Brand(models.Model):
    brand = models.CharField(max_length = 200)
    created_at = models.DateField(auto_now_add=True)

class Type(models.Model):
    type = models.CharField(max_length = 200)
    created_at = models.DateField(auto_now_add=True)

class Gen(models.Model):
    gen = models.CharField(max_length = 200)
    created_at = models.DateField(auto_now_add=True)

class Cpu(models.Model):
    cpu = models.CharField(max_length = 200)
    created_at = models.DateField(auto_now_add=True)

class Speed(models.Model):
    speed = models.CharField(max_length = 200, null=True)
    created_at = models.DateField(auto_now_add=True)

class Ram(models.Model):
    ram = models.CharField(max_length = 200)
    created_at = models.DateField(auto_now_add=True)

class Hdd(models.Model):
    hdd = models.CharField(max_length = 200)
    created_at = models.DateField(auto_now_add=True)

class Screen(models.Model):
    screen = models.CharField(max_length = 200)
    created_at = models.DateField(auto_now_add=True)


from django.db.models.signals import post_migrate
from django.dispatch import receiver
@receiver(post_migrate)
def create_default_items(sender, **kwargs):
    if sender.name == 'users':
        brands = [ 'hp','Dell','Acer','Lenovo','Samsung','Fujitsu','Toshiba','Asus','Mix','Apple','Philips','Viewsonic']
        for b in brands:
            Brand.objects.update_or_create(brand=b)
        
        conditions = ['Used', 'Refurb', 'New']
        for c in conditions:
            NewCondition.objects.update_or_create(conditions=c)
        
        cpus = ['Intel Core i3','Intel Core i5','Intel Core i7','Intel Core i9','Intel Celeron','Intel Pentium','AMD 3020e','AMD Athlon','AMD Ryzen 3','AMD Ryzen 5','AMD Ryzen 7','AMD Ryzen 9','Intel Xeon','Intel Core m','Intel Core m3','Intel Core m5','Intel Core m7','AMD A4','AMD A6','AMD A8','AMD A9','AMD A10','AMD A12','KX']
        for c in cpus:
            Cpu.objects.update_or_create(cpu=c)

        gens = ['1st Gen','2nd Gen','3rd Gen','4th Gen','5th Gen','6th Gen','7th Gen','8th Gen','9th Gen','10th Gen','11th Gen','12th Gen','AMD','U6780A',]
        for g in gens:
            Gen.objects.update_or_create(gen=g)
        
        hdds = ['16','32','64','128','180','250','256','360','500','512','640','750','960','1000','1024','2000','3000','4000','6000',]
        for h in hdds:
            Hdd.objects.update_or_create(hdd=h)
        
        rams = ['512','1024','2048','3072','4096','8192','16384','32768','65536',]
        for r in rams:
            Ram.objects.update_or_create(ram=r)

        screens = ['10\"','11\"','12\"','13\"','14\"','15\"','16\"','17\"','19\"','20\"','21\"','22\"','23\"','24\"','25\"','27\"','28\"','29\"','30\"','32\"','34\"','42\"','43',]
        for s in screens:
            Screen.objects.update_or_create(screen=s)

        speeds = ['1.0','1.2','1.6','1.8','2.0','2.1','2.2','2.3','2.4','2.5','2.6','2.7','2.8','2.9','3.0','3.2','3.4','3.6','3.5',]
        for sp in speeds:
            Speed.objects.update_or_create(speed=sp)

        types = ['Laptop','Desktop','Allinone','Smartphone','HDD 2.5','HDD 3.5','SSD','Macbook','iMac','Lcd','RAM','Scrap','Discount','OTHERS',]
        for t in types:
            Type.objects.update_or_create(type=t)