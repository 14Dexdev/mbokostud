from typing import Any
from django.db.models import Avg

# Create your models here.
from django.db import models
from django.contrib.auth.models import AbstractUser,User,AbstractBaseUser,PermissionsMixin,UserManager,send_mail
from django.db.models.query import QuerySet,Q
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.validators import UnicodeUsernameValidator
from django.utils import timezone
from django.core.validators import MaxValueValidator, MinValueValidator

# Create your models here.

CLASSE=[('TERMINAL D','Terminal D'),
        ('TERMINAL C','Terminal C'),
        ('TERMINAL A','TerminalA'),
        ('TERMINAL TI','Terminal TI'),
        ('PREMIERE D','Premiere D'),
        ('PREMIERE C','Premiere C'),
        ('PREMIERE TI','Premiere TI'),
        ('PREMIERE A',"Premiere A"),
        ('SECONDE C','Seconde C'),
        ('SECONDE A','Seconde A'),
        ('TROSIEME','Troisieme'),
        ('QUATRIEME','Quatrieme'),
        ('CINQUIEME','Ciquieme'),
        ('SIXIEME','Sixieme'),
        ('COURS MOYENS DEUX','Cour Moyen Deux'),
        ('COURS MOYEN UN','Cour Moyen Un'),
        ('COURS ELEMENTAIRE DEUX','Cour Elementaire Deux')]

class Salles(models.Model):
     classe=models.CharField(choices=CLASSE,max_length=30)
     def __str__(self) :
        return self.classe
     
class GroupeMatiere(models.Model):
    Groupe=models.TextField()
    def __str__(self):
        return self.Groupe

class Matiere(models.Model):
     photo=models.ImageField()
     nom_matiere=models.TextField()
     GroupeMatiere=models.ForeignKey(GroupeMatiere,on_delete=models.SET_NULL,null=True)
     classe=models.ManyToManyField(Salles)

     def __str__(self) :
        return self.nom_matiere

VILLE_CHOICE=[('DOUALA',"Douala"),
                 ('YAOUNDE',"Yaounde"),
                 ('BERTOUA',"Bertoua"),
                 ('EBOLOWA',"Ebolowa"),
                 ('BUEA',"Buea"),
                 ('LIMBE',"Limbe"),
                 ('BAFOUSSAM',"Bafoussam"),
                 ('DSCHANG',"Dschand"),
                 ('KRIBI',"Kribi"),
                 ('MBANGA',"Mbanga"),
                 ('EDEA',"Edea"),
                 ('TIKO',"Tiko"),
                 ('MAROUA',"Maroua"),
                 ('GAROUA',"Garoua"),
                 ('NGAOUNDERE',"Ngaoundere"),
                 ('SOUZA',"Souza"),
                 ] 
class Utilisateur(AbstractUser,UserManager):
    
    ENSEIGNANT="ENSEIGNANT"
    CLIENT="CLIENT"
 
    ROLE_CHOICE=[(ENSEIGNANT,"Repetiteur"),
                 (CLIENT,"Abonnee")]
   
    role=models.TextField(choices=ROLE_CHOICE,max_length=20)
    Photo=models.ImageField(null=True)
    date_creation=models.DateTimeField(auto_now_add=True,auto_now=False,verbose_name="Date de creation du compte",blank=True)
    Quatier=models.TextField()
    Ville=models.TextField(choices=VILLE_CHOICE,max_length=23)
    Date_de_naissance=models.DateField(null=True)
  
#     username_validator = UnicodeUsernameValidator()

#     username = models.CharField(
#         _("username"),
#         max_length=150,
#         unique=True,
#         help_text=_(
#             "Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only."
#         ),
#         validators=[username_validator],
#         error_messages={
#             "unique": _("A user with that username already exists."),
#         },

    def __str__(self) :
        return self.username;

   

class Objectif(models.Model):
    users=models.ForeignKey(Utilisateur,on_delete=models.SET_NULL,null=True)
    contenu=models.TextField()
    reussite=models.BooleanField()

    def __str__(self) -> str:
        return self.contenu
    
class Repetiteur_clientQuery(models.QuerySet):
    def search(self,query):
        lookup= Q(ensegnant__id__icontains=query)
        qs=self.filter(lookup)
        
        return qs

class Repetiteur_clientManager(models.Manager):

    def get_queryset(self) :
        return Repetiteur_clientQuery(model=self.model,using=self._db)

    def search(self,query):
        return self.get_queryset().search(query)

class MessagerieQuery(models.QuerySet):
    def search(self,query):
        lookup= Q(messager__id=query)|Q(recepteur__id=query)
        qs=self.filter(lookup)
        
        return qs

class MessagerieManger(models.Manager):

    def get_queryset(self) :
        return MessagerieQuery(model=self.model,using=self._db)

    def search(self,query):
        return self.get_queryset().search(query)
    
class EnseignantQuery(models.QuerySet):
    def search(self,query):
        lookup=Q(specialise__id=query) | Q(User__id=query)| Q(classe_tenue__classe=query)
        qs=self.filter(lookup)
        
        return qs

class EnseignantManager(models.Manager):

    def get_queryset(self) :
        return EnseignantQuery(model=self.model,using=self._db)

    def search(self,query):
        return self.get_queryset().search(query)
    

class LivreQuery(models.QuerySet):
    def search(self,query,q):
        lookup=Q(Categorie__id=query) & Q(classe=q)
        qs=self.filter(lookup).distinct()
        return qs

class LivreManager(models.Manager):

    def get_queryset(self) :
        return LivreQuery(model=self.model,using=self._db)

    def search(self,query):
        return self.get_queryset().search(query)

class repetiteur_client(models.Model):
    client=models.ForeignKey(Utilisateur,on_delete=models.SET_NULL,null=True,related_name='eleve')
    ensegnant=models.ForeignKey(Utilisateur,on_delete=models.SET_NULL,null=True,related_name='repetiteur')
    reussite=models.BooleanField(null=True)
    objects=Repetiteur_clientManager()


class Livre(models.Model):
    Nom_du_livre=models.TextField()
    Categorie=models.ForeignKey(Matiere,on_delete=models.SET_NULL,null=True)
    Auteur=models.TextField() 
    description=models.TextField(null=True)
    classe=models.ManyToManyField(Salles)
    contenu=models.FileField()
    niveau_du_livre=models.IntegerField(validators=[MaxValueValidator(5),MinValueValidator(0)])
    objects=LivreManager()


    def __str__(self) :
        return self.Nom_du_livre
    

class Liste_livre_ajoute(models.Model):
    livre_ajoute=models.ForeignKey(Livre,on_delete=models.SET_NULL,null=True)
    Id_user=models.ForeignKey(Utilisateur,on_delete=models.SET_NULL,null=True)

class Etablissement(models.Model):
    nom=models.TextField()
    Description=models.TextField()
    public=models.BooleanField(default=True)
    
    Ville=models.TextField(choices=VILLE_CHOICE,max_length=23)
    localisation=models.TextField()
    image=models.ImageField(null=True)

    def __str__(self) -> str:
        return self.nom

class Citation(models.Model):
    contenu=models.TextField()
    matiere=models.ForeignKey(Matiere,on_delete=models.SET_NULL,null=True)
    classe=models.ForeignKey(Salles,on_delete=models.SET_NULL,null=True)

class Ensegnant(models.Model):
    User=models.ForeignKey(Utilisateur,on_delete=models.SET_NULL,null=True)
    specialise=models.ManyToManyField(Matiere)
    classe_tenue=models.ManyToManyField(Salles,name='classe')
    description=models.TextField()
    Valeur=models.PositiveIntegerField(default=0)
    Taux_de_reussite=models.PositiveIntegerField(null=True,default=0)
    Taux_d_echec=models.PositiveIntegerField(null=True,default=0)
    nombre_de_requete=models.IntegerField()
    objects=EnseignantManager()
    def __str__(self) :
        return f'{self.id}'
   
class Client(models.Model):
    user=models.ForeignKey(Utilisateur,on_delete=models.SET_NULL,null=True)
    niveau=models.PositiveIntegerField(null=True)
    Difficulete=models.ManyToManyField(Matiere)
    Programme_objectif=models.FileField(null=True)
    reussite=models.BooleanField(default=False)
    classe=models.ManyToManyField(Salles)
    
    # Theorie="Theorie"
    repetiteur=models.ManyToManyField(Ensegnant)
    # ROLE_CHOICE=[(Pratique,"Exercice"),
    #              (Theorie,"Lecture")]

class Note(models.Model):

    note=models.DecimalField(max_digits=5,decimal_places=1,validators=[MaxValueValidator(5),MinValueValidator(1)])
    Nom_client=models.ForeignKey(Client,on_delete=models.SET_NULL,null=True,related_name='nom_client')
    nom_repetiteur=models.ForeignKey(Ensegnant or Livre or Etablissement,on_delete=models.SET_NULL,null=True,related_name='nom_repetiteur')

    class Meta:
        unique_together = ['Nom_client', 'nom_repetiteur']  # Assurer une seule note par utilisateur et par enseignant

    def __str__(self):
        return f"{self.Nom_client} - {self.note}/5 pour {self.nom_repetiteur}" 
       
   
class Messagerie(models.Model):
    messager=models.ForeignKey(Utilisateur,related_name="Messagrie_messager",on_delete=models.SET_NULL,null=True)
    recepteur=models.ForeignKey(Utilisateur,related_name="Messagerie_recepteur",on_delete=models.SET_NULL,null=True)
    contenu=models.TextField()
    date_envoi=models.DateTimeField(auto_now_add=True,auto_now=False)
    date_recepion=models.DateField(null=True)
    objects=MessagerieManger()
    


class Commentaire(models.Model):
    Contenu=models.TextField(unique=False)
    livre=models.OneToOneField(Livre,on_delete=models.SET_NULL,null=True)
    ensegnant=models.ForeignKey(Ensegnant,on_delete=models.SET_NULL,null=True)
    client=models.ForeignKey(Utilisateur,on_delete=models.SET_NULL,null=True)
    objects=Repetiteur_clientManager()
    id_etablissement=models.ForeignKey(Etablissement,on_delete=models.SET_NULL,null=True)
    def __str__(self) :
        return f"{self.id}"


class Niveau_eleve (models.Model):
    niveau=models.PositiveIntegerField()
    user=models.ForeignKey(Client,on_delete=models.SET_NULL,null=True)
    date=models.DateTimeField(auto_now_add=True,auto_now=False)


class requete(models.Model):

    client=models.ForeignKey(Client,on_delete=models.SET_NULL,null=True)
    ensegnant=models.ForeignKey(Ensegnant,on_delete=models.SET_NULL,null=True)
    validation=models.BooleanField(null=True)
    objects=Repetiteur_clientManager()
    
    unique_together = ['client', 'ensegnant'] 

class Reussite(models.Model):
    etablissement=models.ForeignKey(Etablissement,on_delete=models.SET_NULL,null=True)
    taux_de_reussite=models.IntegerField()
    examen=models.TextField(null=True)
    classe=models.ForeignKey(Salles,on_delete=models.SET_NULL,null=True)
    annee=models.TextField()

class Quizz(models.Model):
    Question=models.TextField()
    Response=models.TextField()
    