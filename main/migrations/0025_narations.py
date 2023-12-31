# Generated by Django 4.2.5 on 2023-11-13 09:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    dependencies = [
        ("main", "0024_masterlist_datedelivered_stockout_datedelivered_and_more"),
    ]

    operations = [
        migrations.CreateModel(
            name="Narations",
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
                ("naration", models.CharField(max_length=200, null=True)),
                ("date", models.DateField(auto_now=True)),
                ("balance", models.FloatField(null=True)),
                ("amount", models.FloatField(null=True)),
                (
                    "vendor",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.CASCADE,
                        to="main.vendor",
                    ),
                ),
            ],
        ),
    ]
