# Generated by Django 4.2.5 on 2023-11-27 10:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    dependencies = [
        ("users", "0001_initial"),
        ("main", "0036_orders_total_amount"),
    ]

    operations = [
        migrations.CreateModel(
            name="Expense",
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
                ("date", models.DateTimeField(auto_now=True)),
                ("description", models.CharField(max_length=200, null=True)),
                ("amount", models.IntegerField(null=True)),
                (
                    "name",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.CASCADE,
                        to="users.user",
                    ),
                ),
            ],
        ),
    ]
