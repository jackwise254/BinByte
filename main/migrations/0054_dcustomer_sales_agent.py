# Generated by Django 5.0.1 on 2024-01-08 07:26

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("main", "0053_remove_dcustomer_sales_agent"),
    ]

    operations = [
        migrations.AddField(
            model_name="dcustomer",
            name="sales_agent",
            field=models.CharField(blank=True, max_length=200),
        ),
    ]