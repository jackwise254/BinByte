# Generated by Django 4.2.5 on 2023-11-21 09:53

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("main", "0034_agents_records_random_orders_random"),
    ]

    operations = [
        migrations.AddField(
            model_name="agents_records",
            name="date",
            field=models.DateField(auto_now=True),
        ),
    ]
