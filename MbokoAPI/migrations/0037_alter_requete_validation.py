# Generated by Django 4.2.7 on 2024-07-31 14:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('MbokoAPI', '0036_alter_messagerie_messager_alter_messagerie_recepteur'),
    ]

    operations = [
        migrations.AlterField(
            model_name='requete',
            name='validation',
            field=models.BooleanField(null=True),
        ),
    ]
