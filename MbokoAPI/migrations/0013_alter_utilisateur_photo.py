# Generated by Django 4.2.7 on 2024-06-22 23:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('MbokoAPI', '0012_matiere_photo_alter_utilisateur_photo'),
    ]

    operations = [
        migrations.AlterField(
            model_name='utilisateur',
            name='Photo',
            field=models.ImageField(null=True, upload_to=''),
        ),
    ]
