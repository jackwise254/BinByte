# Generated by Django 4.2.5 on 2023-10-27 10:43

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0005_rename_distributor_masterlist_supplier_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Templist',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.CharField(max_length=200, null=True)),
                ('serialno', models.CharField(max_length=200, null=True)),
                ('model', models.CharField(max_length=200, null=True)),
                ('cpu', models.CharField(max_length=200, null=True)),
                ('ram', models.CharField(max_length=200, null=True)),
                ('hdd', models.CharField(max_length=200, null=True)),
                ('daterecieved', models.DateField(null=True)),
                ('qty', models.CharField(max_length=200, null=True)),
                ('dels', models.CharField(max_length=200, null=True)),
                ('unit_price', models.CharField(max_length=200, null=True)),
                ('total', models.CharField(max_length=200, null=True)),
                ('vat', models.CharField(max_length=200, null=True)),
                ('supplier', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='main.vendor')),
            ],
            options={
                'ordering': ['-id'],
            },
        ),
    ]
