# Generated by Django 4.2.7 on 2024-06-27 14:12

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('MbokoAPI', '0015_alter_commentaire_repetiteur'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='ensegnant',
            name='Moyen',
        ),
        migrations.AlterField(
            model_name='note',
            name='Nom_utilisateur',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='nom_client', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='note',
            name='nom_repetiteur',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='nom_repetiteur', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='repetiteur_client',
            name='client',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='eleve', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='repetiteur_client',
            name='ensegnant',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='repetiteur', to=settings.AUTH_USER_MODEL),
        ),
    ]
