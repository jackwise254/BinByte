# Generated by Django 5.0.1 on 2024-01-10 21:25

from django.db import migrations, models


class Migration(migrations.Migration):
    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="Accessory",
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
                ("name", models.CharField(max_length=200, null=True)),
                ("date", models.DateField(auto_now=True)),
                ("qty", models.IntegerField(default=0)),
                ("bprice", models.FloatField(default=0)),
                ("sprice", models.FloatField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name="Agents_Records",
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
                ("units", models.IntegerField(null=True)),
                ("returned_units", models.IntegerField(default=0)),
                ("commission", models.FloatField(null=True)),
                ("random", models.IntegerField(null=True)),
                ("date", models.DateField(auto_now=True)),
                ("sales_revenue", models.IntegerField(default=0)),
                ("refund_amound", models.IntegerField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name="Branches",
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
                ("name", models.CharField(max_length=200, null=True)),
                ("date_craeted", models.DateField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name="Brand",
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
                ("brand", models.CharField(max_length=200)),
                ("created_at", models.DateField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name="Cpu",
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
                ("cpu", models.CharField(max_length=200)),
                ("created_at", models.DateField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name="Customer",
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
                ("fname", models.CharField(max_length=200, null=True)),
                ("lname", models.CharField(max_length=200, null=True)),
                ("phone", models.CharField(max_length=200, null=True)),
                ("location", models.CharField(max_length=200, null=True)),
                ("email", models.CharField(max_length=200, null=True)),
                ("user_created_at", models.CharField(max_length=200, null=True)),
                ("random", models.CharField(max_length=200, null=True)),
                ("username", models.CharField(max_length=200, null=True)),
                ("id_no", models.CharField(max_length=200, null=True)),
                ("status", models.CharField(max_length=200, null=True)),
                ("invono", models.CharField(max_length=200, null=True)),
                ("date_joined", models.DateField(auto_now=True)),
                (
                    "id_document",
                    models.ImageField(max_length=200, null=True, upload_to=""),
                ),
                (
                    "pin_document",
                    models.ImageField(max_length=200, null=True, upload_to=""),
                ),
                (
                    "registration_document",
                    models.ImageField(max_length=200, null=True, upload_to=""),
                ),
                (
                    "l_document",
                    models.ImageField(max_length=200, null=True, upload_to=""),
                ),
                (
                    "business_document",
                    models.ImageField(max_length=200, null=True, upload_to=""),
                ),
                (
                    "location_document",
                    models.ImageField(max_length=200, null=True, upload_to=""),
                ),
                (
                    "other_document",
                    models.ImageField(max_length=200, null=True, upload_to=""),
                ),
            ],
            options={
                "ordering": ["username"],
            },
        ),
        migrations.CreateModel(
            name="Dcustomer",
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
                ("fname", models.CharField(max_length=200, null=True)),
                ("lname", models.CharField(max_length=200, null=True)),
                ("phone", models.CharField(max_length=200, null=True)),
                ("location", models.CharField(max_length=200, null=True)),
                ("email", models.CharField(max_length=200, null=True)),
                ("user_created_at", models.CharField(max_length=200, null=True)),
                ("random", models.CharField(max_length=200, null=True)),
                ("username", models.CharField(max_length=200, null=True)),
                ("id_no", models.CharField(max_length=200, null=True)),
                ("status", models.CharField(max_length=200, null=True)),
                ("invono", models.CharField(max_length=200, null=True)),
                ("d_type", models.CharField(max_length=200, null=True)),
                ("is_active", models.BooleanField(default=True)),
                ("mode", models.CharField(blank=True, max_length=200)),
                ("sales_agent", models.CharField(blank=True, max_length=200)),
            ],
            options={
                "db_table": "dcustomer",
            },
        ),
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
                ("amount", models.IntegerField(null=True)),
            ],
        ),
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
        migrations.CreateModel(
            name="Gen",
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
                ("gen", models.CharField(max_length=200)),
                ("created_at", models.DateField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name="Hdd",
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
                ("hdd", models.CharField(max_length=200)),
                ("created_at", models.DateField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name="Masterlist",
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
                ("type", models.CharField(max_length=200, null=True)),
                ("serialno", models.CharField(max_length=200, null=True)),
                ("model", models.CharField(max_length=200, null=True)),
                ("cpu", models.CharField(max_length=200, null=True)),
                ("brand", models.CharField(max_length=200, null=True)),
                ("gen", models.CharField(max_length=200, null=True)),
                ("ram", models.CharField(max_length=200, null=True)),
                ("screen", models.CharField(max_length=200, null=True)),
                ("speed", models.CharField(max_length=200, null=True)),
                ("comment", models.CharField(max_length=200, null=True)),
                ("hdd", models.CharField(max_length=200, null=True)),
                ("daterecieved", models.DateField(null=True)),
                ("datedelivered", models.DateField(null=True)),
                ("qty", models.CharField(max_length=200, null=True)),
                ("dels", models.CharField(max_length=200, null=True)),
                (
                    "unit_price",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "total",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "vat",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "bprice",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "sprice",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "sub_total",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                ("terms", models.CharField(max_length=200, null=True)),
                ("random", models.CharField(max_length=200, null=True)),
            ],
            options={
                "ordering": ["-id"],
            },
        ),
        migrations.CreateModel(
            name="Mode",
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
                ("name", models.CharField(max_length=200)),
                ("created_at", models.DateField(auto_now=True)),
            ],
        ),
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
                (
                    "order_type",
                    models.CharField(
                        choices=[("Debit", "Debit"), ("Credit", "Credit")],
                        max_length=10,
                        null=True,
                    ),
                ),
                ("naration", models.CharField(max_length=200, null=True)),
                ("date", models.DateField(auto_now=True)),
                ("balance", models.FloatField(null=True)),
                ("amount", models.FloatField(null=True)),
                ("status", models.IntegerField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name="NewCondition",
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
                ("conditions", models.CharField(max_length=200)),
                ("created_at", models.DateField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name="Orders",
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
        migrations.CreateModel(
            name="Product",
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
                ("fname", models.CharField(max_length=200, null=True)),
                ("lname", models.CharField(max_length=200, null=True)),
                ("vendor", models.CharField(max_length=200, null=True)),
                ("customer", models.CharField(max_length=200, null=True)),
                ("email", models.CharField(max_length=200, null=True)),
                ("username", models.CharField(max_length=200, null=True)),
                ("user_name", models.CharField(max_length=200, null=True)),
                ("id_no", models.CharField(max_length=200, null=True)),
                ("document", models.CharField(max_length=200, null=True)),
                ("ref", models.CharField(max_length=200, null=True)),
                ("random", models.CharField(max_length=200, null=True)),
                ("address", models.CharField(max_length=200, null=True)),
                ("phone", models.CharField(max_length=200, null=True)),
                ("delvnote", models.CharField(max_length=200, null=True)),
                ("location", models.CharField(max_length=200, null=True)),
                ("date", models.CharField(max_length=200, null=True)),
                ("invono", models.CharField(max_length=200, null=True)),
                ("sold_to", models.CharField(max_length=200, null=True)),
                ("total", models.IntegerField()),
                ("amount", models.IntegerField(null=True)),
                ("mode", models.CharField(blank=True, max_length=200)),
                ("bprice", models.IntegerField(default=0)),
            ],
            options={
                "db_table": "product",
                "ordering": ["-date"],
            },
        ),
        migrations.CreateModel(
            name="Ram",
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
                ("ram", models.CharField(max_length=200)),
                ("created_at", models.DateField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name="Screen",
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
                ("screen", models.CharField(max_length=200)),
                ("created_at", models.DateField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name="Speed",
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
                ("speed", models.CharField(max_length=200, null=True)),
                ("created_at", models.DateField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name="Stockout",
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
                ("type", models.CharField(max_length=200, null=True)),
                ("serialno", models.CharField(max_length=200, null=True)),
                ("model", models.CharField(max_length=200, null=True)),
                ("cpu", models.CharField(max_length=200, null=True)),
                ("brand", models.CharField(max_length=200, null=True)),
                ("gen", models.CharField(max_length=200, null=True)),
                ("ram", models.CharField(max_length=200, null=True)),
                ("screen", models.CharField(max_length=200, null=True)),
                ("speed", models.CharField(max_length=200, null=True)),
                ("comment", models.CharField(max_length=200, null=True)),
                ("hdd", models.CharField(max_length=200, null=True)),
                ("daterecieved", models.DateField(auto_now_add=True, null=True)),
                ("datedelivered", models.DateField(null=True)),
                ("qty", models.CharField(max_length=200, null=True)),
                ("dels", models.CharField(max_length=200, null=True)),
                (
                    "unit_price",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "total",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "vat",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "bprice",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "sprice",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "sub_total",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                ("terms", models.CharField(max_length=200, null=True)),
                ("random", models.CharField(max_length=200, null=True)),
            ],
            options={
                "ordering": ["-id"],
            },
        ),
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
        migrations.CreateModel(
            name="Temp",
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
                ("type", models.CharField(max_length=200, null=True)),
                ("serialno", models.CharField(max_length=200, null=True)),
                ("model", models.CharField(max_length=200, null=True)),
                ("cpu", models.CharField(max_length=200, null=True)),
                ("ram", models.CharField(max_length=200, null=True)),
                ("hdd", models.CharField(max_length=200, null=True)),
                ("brand", models.CharField(max_length=200, null=True)),
                ("screen", models.CharField(max_length=200, null=True)),
                ("daterecieved", models.DateField(auto_now_add=True, null=True)),
                ("datedelivered", models.DateField(null=True)),
                ("qty", models.CharField(max_length=200, null=True)),
                ("dels", models.CharField(max_length=200, null=True)),
                (
                    "unit_price",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "total",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "vat",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "bprice",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "sprice",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "sub_total",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                ("terms", models.CharField(max_length=200, null=True)),
                ("d_type", models.CharField(max_length=200, null=True)),
                ("random", models.CharField(max_length=200, null=True)),
                ("is_active", models.BooleanField(default=True)),
            ],
            options={
                "ordering": ["-id"],
            },
        ),
        migrations.CreateModel(
            name="Templist",
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
                ("type", models.CharField(max_length=200, null=True)),
                ("serialno", models.CharField(max_length=200, null=True, unique=True)),
                ("model", models.CharField(max_length=200, null=True)),
                ("cpu", models.CharField(max_length=200, null=True)),
                ("ram", models.CharField(max_length=200, null=True)),
                ("hdd", models.CharField(max_length=200, null=True)),
                ("brand", models.CharField(max_length=200, null=True)),
                ("screen", models.CharField(max_length=200, null=True)),
                ("gen", models.CharField(max_length=200, null=True)),
                ("daterecieved", models.DateField(auto_now_add=True, null=True)),
                ("datedelivered", models.DateField(null=True)),
                ("qty", models.CharField(max_length=200, null=True)),
                ("dels", models.CharField(max_length=200, null=True)),
                (
                    "unit_price",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "total",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "vat",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "bprice",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "sprice",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                (
                    "sub_total",
                    models.DecimalField(decimal_places=2, max_digits=10, null=True),
                ),
                ("terms", models.CharField(max_length=200, null=True)),
                ("d_type", models.CharField(max_length=200, null=True)),
                ("is_active", models.BooleanField(default=True)),
                ("random", models.CharField(max_length=200, null=True)),
            ],
            options={
                "ordering": ["-id"],
            },
        ),
        migrations.CreateModel(
            name="Type",
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
                ("type", models.CharField(max_length=200)),
                ("created_at", models.DateField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name="Vendor",
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
                ("fname", models.CharField(max_length=200, null=True)),
                ("lname", models.CharField(max_length=200, null=True)),
                ("phone", models.CharField(max_length=200, null=True)),
                ("location", models.CharField(max_length=200, null=True)),
                ("email", models.CharField(max_length=200, null=True)),
                ("user_created_at", models.CharField(max_length=200, null=True)),
                ("random", models.CharField(max_length=200, null=True)),
                ("username", models.CharField(max_length=200, null=True)),
                ("id_no", models.CharField(max_length=200, null=True)),
                ("status", models.CharField(max_length=200, null=True)),
                ("invono", models.CharField(max_length=200, null=True)),
            ],
        ),
    ]
