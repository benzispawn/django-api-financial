# Generated by Django 5.1.2 on 2024-10-17 10:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api_financial', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='stocktimeline',
            name='st_day',
            field=models.DateField(),
        ),
    ]
