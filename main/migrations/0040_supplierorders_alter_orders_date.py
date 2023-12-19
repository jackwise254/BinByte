# Generated by Django 4.1.12 on 2023-12-18 08:15

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("main", "0039_alter_product_sold_to"),
    ]

    operations = [
        migrations.CreateModel(
            name="SupplierOrders",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "order_type",
                    models.CharField(
                        choices=[("Debit", "Debit"), ("Credit", "Credit")],
                        max_length=10,
                        null=True,
                    ),
                ),
                ("name", models.CharField(max_length=200, null=True)),
                ("amount", models.FloatField(null=True)),
                ("date", models.DateField(auto_now=True, null=True)),
                ("unique_key", models.CharField(max_length=200, null=True)),
                ("random", models.IntegerField(null=True)),
                ("total_amount", models.FloatField(null=True)),
            ],
        ),
        migrations.AlterField(
            model_name="orders",
            name="date",
            field=models.DateField(auto_now=True, null=True),
        ),
    ]