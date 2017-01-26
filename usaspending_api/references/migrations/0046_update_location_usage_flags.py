# -*- coding: utf-8 -*-
# Generated by Django 1.10.1 on 2017-01-25 19:18
from __future__ import unicode_literals

from django.db import migrations
from django.core.management import call_command

def update_location_flags(apps, schema_editor):
    call_command('update_location_usage_flags')

class Migration(migrations.Migration):

    dependencies = [
        ('references', '0045_auto_20170125_1500'),
    ]

    operations = [
        # populate newly-added fields using data in old fields
        migrations.RunPython(update_location_flags, reverse_code=migrations.RunPython.noop),
    ]
