# Generated by Django 5.0.1 on 2024-01-08 07:25

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("main", "0051_accessory_bprice_accessory_qty_accessory_sprice_and_more"),
    ]

    operations = [
        migrations.AddField(
            model_name="dcustomer",
            name="sales_agent",
            field=models.CharField(blank=True, max_length=200),
        ),
    ]
