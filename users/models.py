from enum import unique
from django.db import models
from django.utils import timezone
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.contrib.auth.models import Group, Permission
class UserManager(BaseUserManager): #override the default user manager
    '''
    args:BaseUserManager
    purpose:OVerride the default user manager
    '''
    def _create_user(self, username, firstname, lastname, email, password, is_staff, is_superuser, is_active, **extra_fields):
        if not email:
            raise ValueError('Users must have an username')
        now = timezone.now()
        
        user = self.model(
            username=username,
            firstname=firstname,
            lastname=lastname,
            email=email,
            is_staff=is_staff,
            is_active=is_active,
            is_superuser=is_superuser,
            last_login=now,
            date_joined=now,
            # type='ADMIN',
            **extra_fields
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, username=None,firstname=None,lastname=None,email=None, password=None, is_active=True, **extra_fields):
        '''
        purpose: create a normal user by overriding the default create_user
        '''
        return self._create_user(username, firstname, lastname, email, password, False, False, is_active, **extra_fields)

    def create_superuser(self, email, password, **extra_fields):
        '''
        purpose: create a superuser by overriding the default create_superuser
        '''
        username = 'Admin'
        firstname = 'Admin'
        lastname = 'Admin'
        
        # Update the call to include type='ADMIN'
        user = self._create_user(username, firstname, lastname, email, password, True, True, True, type='ADMIN', **extra_fields)
        user.save(using=self._db)
        return user

    
    def save(self, *args, **kwargs):
        if not self.pk:
            self.type = User.Types.ADMIN
        return super().save(*args, **kwargs)

class Module(models.Model):
    name = models.CharField(max_length=255)
    view_name = models.CharField(max_length=255, null=True, blank=True)

class TypeCode(models.Model):
    code = models.CharField(max_length=50)
    description = models.TextField()

class CustomPermission(models.Model):
    module = models.ForeignKey(Module, on_delete=models.CASCADE)
    type_code = models.ForeignKey(TypeCode, on_delete=models.CASCADE)
    action = models.CharField(max_length=50) 

    class Meta:
        unique_together = ['module', 'type_code', 'action']


############################ USER MODEL #################################3
class User(AbstractBaseUser, PermissionsMixin):
    'Abstract base user for all users'
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    objects = UserManager()

    class Types(models.TextChoices):
        'Class to handle different user types'
        ADMIN = "ADMIN", "Admin"
        TECHNICIAN = "TECHNICIAN", "Technician"
        STOCK = "SALES", "Sales"
    
    type = models.CharField(('Type'), max_length=50, choices=Types.choices, null=True)
    email = models.EmailField("Enter Email for login", max_length=254, unique=True)
    firstname = models.CharField("First Name", max_length=100, null=True)
    username = models.CharField("User Name", max_length=100, null=True)
    lastname = models.CharField("Last Name", max_length=100, null=True)
    custom_permissions = models.ManyToManyField(CustomPermission, blank=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    last_login = models.DateTimeField(null=True, blank=True)
    date_joined = models.DateTimeField(auto_now_add=True)
    groups = models.ManyToManyField(Group, blank=True, related_name="custom_user_set")
    user_permissions = models.ManyToManyField(Permission, blank=True, related_name="custom_user_permission_set")


from django.db.models.signals import post_migrate
from django.dispatch import receiver
@receiver(post_migrate)
def create_default_user(sender, **kwargs):
    if sender.name == 'users':
        if User.objects.filter(email='test@admin.com').exists():
            return

        User.objects.create_superuser('test@admin.com', 'test123', )
        default_users = ['test@sales.com', 'test@tech.com' ]
        user_types = ['SALES', 'TECHNICIAN']

        i = -1
        for email in default_users:
            i+=1

            if User.objects.filter(email=email).exists():
                pass
            else:
                User.objects.create_user(username=email.split('@')[1], firstname='Test', lastname='Test', email=email, password='test123', type=user_types[i], )


        
@receiver(post_migrate)
def create_default_permissions(sender, **kwargs):
    if sender.name != 'users':
        return
    
    module_to_view_mapping = {
        "Users": "user_view_name",
        "Staff": "staff_view_name",
        "Vendors": "vendors_view_name",
        "Delivery notes": "delivery_notes_view_name",
        "Exchange Notes": "exchange_notes_view_name",
        "Warranty notes": "warranty_notes_view_name",
        "Credit notes": "credit_notes_view_name",
        "Accessories": "accessories_view_name",
        "Stock Adjustments": "stock_adjustments_view_name",
        "Stock Verification": "stock_verification_view_name",
        "Stock in(Upload Stock)": "stock_in_upload_stock_view_name",
    }  

    modules = [
        "Stock Adjustments", "Stock Verification", "Accessories",
        "Stock In", "Stock Out", "Faulty In", "Warranty In", "Warranty Out", "Users",
        "Staff", "Vendors", "Delivery notes", "Exchange Notes", "Warranty Notes",
        "Credit notes", "Sales", "Download Speadsheet", "Barcodes", "Jobcards",
        "Previous Rcvd", "Faulty In Status", "Warranty In status","Lab Report", "Cards"
    ]
    models1 = [
        "Stock Adjustments", "Stock Verification", "Accessories",
        "Stock In", "Stock Out", "Faulty In", "Warranty In", "Warranty Out", "Users",
        "Staff", "Vendors", "Delivery notes", "Exchange Notes", "Warranty Notes",
        "Credit notes", "Sales", "Download Speadsheet", "Barcodes", "Jobcards",
         "Lab Report", "Cards"
    ]

    user_type_permissions = {
        'ADMIN': {'modules': modules, 'actions': ['create', 'read', 'update', 'delete']},
        'SALES': {'modules': ["Stock Verification", "Stock Out", "Faulty In", "Warranty Out", 
                              "Download Speadsheet", "Barcodes", "Delivery notes", "Exchange Notes", 
                              "Warranty Notes", "Credit notes", "Sales"], 
                  'actions': {'default': ['create', 'read', 'update']}},
        'TECHNICIAN': {'modules': [ "Faulty In","Barcodes", "Download Speadsheet", "Warranty In", "Warranty In status", "Faulty In Status", "Cards"], 
                       'actions': ['read',]}
    }

    for module_name in modules:
        for type_code, permissions in user_type_permissions.items():
            actions = permissions['actions'] if isinstance(permissions['actions'], list) else permissions['actions'].get(module_name, permissions['actions']['default'])

            for action in actions:
                if module_name not in permissions['modules']:
                    continue

                print(f"{type_code.capitalize()} can {action} {module_name.lower()}")
                view_name = module_to_view_mapping.get(module_name.capitalize(), None)
                module_obj, _ = Module.objects.get_or_create(name=module_name.capitalize(), view_name=view_name)

                description = f"Can {action} {module_name.lower()}"
                type_code_obj, _ = TypeCode.objects.get_or_create(code=type_code, description=description)

                permission_obj, _ = CustomPermission.objects.get_or_create(
                    module=module_obj,
                    type_code=type_code_obj,
                    action=action
                )

                users_of_type = User.objects.filter(type__icontains=type_code)
                for user in users_of_type:
                    user.custom_permissions.add(permission_obj)
