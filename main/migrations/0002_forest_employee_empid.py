# Generated by Django 3.1.6 on 2021-03-05 09:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='forest_employee',
            name='empid',
            field=models.CharField(default=1, max_length=200),
            preserve_default=False,
        ),
    ]
