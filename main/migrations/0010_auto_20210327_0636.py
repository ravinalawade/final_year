# Generated by Django 3.1.6 on 2021-03-27 06:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0009_sos'),
    ]

    operations = [
        migrations.AddField(
            model_name='local_report',
            name='address',
            field=models.CharField(default='', max_length=1000),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='local_report',
            name='report_name',
            field=models.CharField(default='', max_length=1001),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='local_report',
            name='user_name',
            field=models.CharField(default='', max_length=1000),
            preserve_default=False,
        ),
    ]
