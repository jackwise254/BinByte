# Generated by Django 4.2.5 on 2023-11-04 10:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0021_mode'),
    ]

    operations = [
        migrations.AddField(
            model_name='dcustomer',
            name='mode',
            field=models.CharField(blank=True, max_length=200),
        ),
    ]
