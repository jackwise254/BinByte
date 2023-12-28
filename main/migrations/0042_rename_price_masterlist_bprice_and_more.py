# Generated by Django 4.1.12 on 2023-12-21 09:46

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("main", "0041_narations_order_type"),
    ]

    operations = [
        migrations.RenameField(
            model_name="masterlist",
            old_name="price",
            new_name="bprice",
        ),
        migrations.RenameField(
            model_name="stockout",
            old_name="price",
            new_name="bprice",
        ),
        migrations.RenameField(
            model_name="temp",
            old_name="price",
            new_name="bprice",
        ),
        migrations.RenameField(
            model_name="templist",
            old_name="price",
            new_name="bprice",
        ),
        migrations.AddField(
            model_name="masterlist",
            name="sprice",
            field=models.DecimalField(decimal_places=2, max_digits=10, null=True),
        ),
        migrations.AddField(
            model_name="stockout",
            name="sprice",
            field=models.DecimalField(decimal_places=2, max_digits=10, null=True),
        ),
        migrations.AddField(
            model_name="temp",
            name="sprice",
            field=models.DecimalField(decimal_places=2, max_digits=10, null=True),
        ),
        migrations.AddField(
            model_name="templist",
            name="sprice",
            field=models.DecimalField(decimal_places=2, max_digits=10, null=True),
        ),
    ]