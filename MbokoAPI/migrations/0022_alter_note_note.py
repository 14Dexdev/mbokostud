# Generated by Django 4.2.7 on 2024-06-30 22:06

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('MbokoAPI', '0021_objectif_reussite'),
    ]

    operations = [
        migrations.AlterField(
            model_name='note',
            name='note',
            field=models.DecimalField(decimal_places=1, max_digits=1, validators=[django.core.validators.MaxValueValidator(5), django.core.validators.MinValueValidator(1)]),
        ),
    ]
