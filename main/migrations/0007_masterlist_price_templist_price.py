# Generated by Django 4.2.5 on 2023-10-27 10:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0006_templist'),
    ]

    operations = [
        migrations.AddField(
            model_name='masterlist',
            name='price',
            field=models.CharField(max_length=200, null=True),
        ),
        migrations.AddField(
            model_name='templist',
            name='price',
            field=models.CharField(max_length=200, null=True),
        ),
    ]