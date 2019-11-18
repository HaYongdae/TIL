# Generated by Django 2.2.7 on 2019-11-18 06:26

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Subway',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=10)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('address', models.CharField(max_length=30)),
                ('phone', models.CharField(max_length=15)),
                ('menu', models.CharField(max_length=10)),
                ('bread', models.CharField(max_length=10)),
                ('vegetable', models.CharField(max_length=10)),
                ('sauce', models.CharField(max_length=10)),
                ('drink', models.CharField(max_length=10)),
            ],
        ),
    ]
