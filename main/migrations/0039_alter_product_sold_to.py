# Generated by Django 4.1.12 on 2023-12-04 09:49

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("main", "0038_expense_description_alter_expense_description"),
    ]

    operations = [
        migrations.AlterField(
            model_name="product",
            name="sold_to",
            field=models.CharField(max_length=200, null=True),
        ),
    ]
