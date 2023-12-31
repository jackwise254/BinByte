# Generated by Django 4.2.3 on 2023-09-12 11:13

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='CustomPermission',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('action', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Module',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('view_name', models.CharField(blank=True, max_length=255, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='TypeCode',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.CharField(max_length=50)),
                ('description', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('type', models.CharField(choices=[('ADMIN', 'Admin'), ('TECHNICIAN', 'Technician'), ('SALES', 'Sales')], max_length=50, null=True, verbose_name='Type')),
                ('email', models.EmailField(max_length=254, unique=True, verbose_name='Enter Email for login')),
                ('firstname', models.CharField(max_length=100, null=True, verbose_name='First Name')),
                ('username', models.CharField(max_length=100, null=True, verbose_name='User Name')),
                ('lastname', models.CharField(max_length=100, null=True, verbose_name='Last Name')),
                ('is_staff', models.BooleanField(default=False)),
                ('is_superuser', models.BooleanField(default=False)),
                ('is_active', models.BooleanField(default=True)),
                ('last_login', models.DateTimeField(blank=True, null=True)),
                ('date_joined', models.DateTimeField(auto_now_add=True)),
                ('custom_permissions', models.ManyToManyField(blank=True, to='users.custompermission')),
                ('groups', models.ManyToManyField(blank=True, related_name='custom_user_set', to='auth.group')),
                ('user_permissions', models.ManyToManyField(blank=True, related_name='custom_user_permission_set', to='auth.permission')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.AddField(
            model_name='custompermission',
            name='module',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.module'),
        ),
        migrations.AddField(
            model_name='custompermission',
            name='type_code',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.typecode'),
        ),
        migrations.AlterUniqueTogether(
            name='custompermission',
            unique_together={('module', 'type_code', 'action')},
        ),
    ]
