# Generated by Django 4.2.5 on 2023-11-28 07:34

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    dependencies = [
        ("main", "0037_expense"),
    ]

    operations = [
        migrations.CreateModel(
            name="Expense_description",
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
                ("description", models.CharField(max_length=200, null=True)),
            ],
        ),
        migrations.AlterField(
            model_name="expense",
            name="description",
            field=models.ForeignKey(
                null=True,
                on_delete=django.db.models.deletion.CASCADE,
                to="main.expense_description",
            ),
        ),
    ]
