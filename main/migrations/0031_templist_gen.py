# Generated by Django 4.2.5 on 2023-11-13 11:02

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("main", "0030_templist_brand"),
    ]

    operations = [
        migrations.AddField(
            model_name="templist",
            name="gen",
            field=models.CharField(max_length=200, null=True),
        ),
    ]