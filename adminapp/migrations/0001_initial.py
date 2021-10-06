# Generated by Django 3.2.6 on 2021-09-23 16:48

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cate_name', models.CharField(max_length=150)),
                ('cate_status', models.IntegerField(default=1)),
            ],
        ),
        migrations.CreateModel(
            name='manufctr',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('manu_name', models.CharField(max_length=150)),
                ('manu_location', models.CharField(max_length=150)),
                ('manu_status', models.IntegerField(default=1)),
            ],
        ),
        migrations.CreateModel(
            name='producttype',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('protype_name', models.CharField(max_length=150)),
                ('protype_short', models.CharField(max_length=150)),
                ('protype_status', models.IntegerField(default=1)),
                ('cat', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='adminapp.category')),
            ],
        ),
        migrations.CreateModel(
            name='product',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pro_name', models.CharField(max_length=150)),
                ('pro_spec', models.CharField(max_length=400)),
                ('pro_color', models.CharField(max_length=100)),
                ('pro_price', models.BigIntegerField()),
                ('pro_stock', models.IntegerField()),
                ('pro_image', models.ImageField(default='images/Image-Not-Available.png', upload_to='images')),
                ('pro_status', models.IntegerField(default=1)),
                ('manuf', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='adminapp.manufctr')),
                ('protype', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='adminapp.producttype')),
            ],
        ),
    ]
