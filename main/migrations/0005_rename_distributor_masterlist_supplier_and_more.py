# Generated by Django 4.2.5 on 2023-09-28 16:33

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0004_brand_cpu_gen_hdd_newcondition_ram_screen_speed_type'),
    ]

    operations = [
        migrations.RenameField(
            model_name='masterlist',
            old_name='distributor',
            new_name='supplier',
        ),
        migrations.RenameField(
            model_name='masterlist',
            old_name='brand',
            new_name='unit_price',
        ),
        migrations.RenameField(
            model_name='masterlist',
            old_name='checked_by',
            new_name='vat',
        ),
        migrations.RemoveField(
            model_name='masterlist',
            name='comment',
        ),
        migrations.RemoveField(
            model_name='masterlist',
            name='conditions',
        ),
        migrations.RemoveField(
            model_name='masterlist',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='masterlist',
            name='customer',
        ),
        migrations.RemoveField(
            model_name='masterlist',
            name='datedelivered',
        ),
        migrations.RemoveField(
            model_name='masterlist',
            name='daterepaired',
        ),
        migrations.RemoveField(
            model_name='masterlist',
            name='delvno',
        ),
        migrations.RemoveField(
            model_name='masterlist',
            name='gen',
        ),
        migrations.RemoveField(
            model_name='masterlist',
            name='price',
        ),
        migrations.RemoveField(
            model_name='masterlist',
            name='screen',
        ),
        migrations.RemoveField(
            model_name='masterlist',
            name='speed',
        ),
        migrations.RemoveField(
            model_name='masterlist',
            name='time',
        ),
    ]