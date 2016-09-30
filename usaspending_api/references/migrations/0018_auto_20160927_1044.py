# -*- coding: utf-8 -*-
# Generated by Django 1.10.1 on 2016-09-27 14:44
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('references', '0017_auto_20160927_1023'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='legalentity',
            options={'managed': True},
        ),
        migrations.AlterUniqueTogether(
            name='refprogramactivity',
            unique_together=set([('program_activity_code', 'budget_year', 'responsible_agency_id', 'allocation_transfer_agency_id', 'main_account_code')]),
        ),
        migrations.AlterModelTable(
            name='legalentity',
            table='legal_entity',
        ),
    ]
