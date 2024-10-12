from django.contrib import admin

# Register your models here.
from django.contrib import admin

from .models import *

class UtilisateurAdmin(admin.ModelAdmin):
   
    list_display=('id','username','email',"Photo","Ville",'Date_de_naissance')

class EtablissementAdmin(admin.ModelAdmin):

    list_display=('id','nom','Description')

class CitationAdmin(admin.ModelAdmin):

    list_display=('contenu')

class EnsegnantAdmin(admin.ModelAdmin):
    list_display=('id','description','Valeur','nombre_de_requete')

class ClientAdmin(admin.ModelAdmin):
    list_display=('id',"niveau",'reussite')

class LivretAdmin(admin.ModelAdmin):
    list_display=("Nom_du_livre",'Auteur','contenu')

class MessagerieAdmin(admin.ModelAdmin):
    list_display=("id",'contenu','date_envoi','date_recepion')

class MatiereAdmin(admin.ModelAdmin):
    list_display=('id','nom_matiere','photo')


class CommentaireAdmin(admin.ModelAdmin):
    list_display=("id",'Contenu')

class SalleAdmin(admin.ModelAdmin):
    list_display=('id','classe')

class ReussiteAdmin(admin.ModelAdmin):
    list_display=('id','annee','taux_de_reussite')

class NoteAdmin(admin.ModelAdmin):
    list_display=('id',"note")

class requeteAdmin(admin.ModelAdmin):
    list_display=('id','validation')

class repetiteur_clientAdmin(admin.ModelAdmin):
    list_display=("id",'reussite')

class GroupeMatiereAdmin(admin.ModelAdmin):
    list_display=('id','Groupe')
   

admin.site.register(Utilisateur,UtilisateurAdmin)
admin.site.register(Ensegnant,EnsegnantAdmin)
admin.site.register(Client,ClientAdmin)
admin.site.register(Livre,LivretAdmin)
admin.site.register(Reussite,ReussiteAdmin)
admin.site.register(Messagerie,MessagerieAdmin)
admin.site.register(Matiere,MatiereAdmin)
admin.site.register(Liste_livre_ajoute)
admin.site.register(Commentaire,CommentaireAdmin)
admin.site.register(repetiteur_client,repetiteur_clientAdmin)
admin.site.register(requete,requeteAdmin)
admin.site.register(Niveau_eleve)
admin.site.register(Etablissement,EtablissementAdmin)
admin.site.register(Note,NoteAdmin)
admin.site.register(Objectif)
admin.site.register(Salles,SalleAdmin)
admin.site.register(GroupeMatiere,GroupeMatiereAdmin)
