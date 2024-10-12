from requests import Response
from rest_framework import serializers,filters,response
from .models import *
from django.contrib.auth import authenticate


url= serializers.SerializerMethodField(read_only=True)
class SerializeUser(serializers.ModelSerializer):
    # children_1 = SerializeClient(many=True, read_only=True)
    # children_2 = SerializeEnseignant(many=True, read_only=True)
    # children_4 = SerializeObjectif(many=True, read_only=True)
    # children_5 = SerializeListe_livre(many=True, read_only=True)
    # raw_password= serializers.CharField(write_only=True)

    class Meta:
        model=Utilisateur
        fields=['id','email','username','password','first_name','last_name','Date_de_naissance','Photo','role','Ville','Quatier','date_creation']
        extra_kwargs = {'password': {'write_only': True}}

        def create(self, validated_data):
           user = User.objects.create_user(**validated_data)
           return user
     
class SerializeGroupe(serializers.ModelSerializer):
    # children_1 = SerializeMatiere(many=True, read_only=True)


    class Meta:
        model=GroupeMatiere
        fields='__all__'


class SerializeSalle(serializers.ModelSerializer):
     
    # children_1 = SerializeClient(many=True, read_only=True)
    # children_2 = SerializeEnseignant(many=True, read_only=True)
    # children_3 = SerializeLivre(many=True, read_only=True)
    # children_4 = SerializeMatiere(many=True, read_only=True)

    class Meta:
        model=Salles
        fields='__all__'

class serializerEtablissement(serializers.ModelSerializer):
    class Meta:
        model=Etablissement
        fields='__all__'

class SerializeMatiere(serializers.ModelSerializer):
   
    GroupeMatiere=SerializeGroupe
    class Meta:
        model=Matiere
        fields='__all__'

class MatiereSerializer(serializers.ModelSerializer):
   
    class Meta:
        model=Matiere
        fields='__all__'

class SerializeObjectif(serializers.ModelSerializer):
    # children_1 = SerializeClient(many=True, read_only=True)
    users=SerializeUser()

    class Meta:
        model=Objectif
        fields='__all__'

class ObjectifSerializer(serializers.ModelSerializer):
    # children_1 = SerializeClient(many=True, read_only=True)

    class Meta:
        model=Objectif
        fields='__all__'

class SerializeClient(serializers.ModelSerializer):
    # children_1 = SerializeNote(many=True, read_only=True)
    # children_2 = SerializeCommentaire(many=True, read_only=True)
    # children_3 = SerializeNiveau_eleve(many=True, read_only=True)
    # children_4 = SerializeRequete(many=True, read_only=True)
    # children_5 = Serializerepetiteur_client(many=True, read_only=True)
    user=SerializeUser()
    Difficulete=SerializeMatiere(many=True)
    classe=SerializeSalle(many=True)
    class Meta:
        model=Client
        fields='__all__'

    # def get_Difficulete(self,obj):
    #     return obj.Difficulete
    
    # def get_classe(self,obj):
    #     return obj.classe.classe

class ClientSerializer(serializers.ModelSerializer):

    class Meta:
        model=Client
        fields='__all__'    

class SerializeNote(serializers.ModelSerializer):
   
    Nom_client=SerializeUser()
    nom_repetiteur=SerializeUser()
    class Meta:
        model=Note
        fields='__all__' 
   
class SerializeEnseignant(serializers.ModelSerializer):
    # children_1 = SerializeNote(many=True, read_only=True)
    User=SerializeUser()
    moyenne=serializers.SerializerMethodField(read_only=True)
    classe=SerializeSalle(many=True)
    specialise=SerializeMatiere(many=True)
    # reussite=serializers.SerializerMethodField(read_only=True)
    # specialise=SerializeMatiere()
    

    class Meta:
        model=Ensegnant
        fields= '__all__'
     
    
    def get_moyenne(self, obj):
        # Django ORM s'occupe de la jointure implicitement
        moyenne = Note.objects.filter(nom_repetiteur__id=obj.id).aggregate(moyenne=Avg('note'))['moyenne']
        
        return moyenne if moyenne else 0.0  # Retourne 0 si aucune note
      

    def create(self, validated_data):
        return super().create(validated_data)
 
 

class EnseignantSerializer(serializers.ModelSerializer):
    
    moyenne=serializers.SerializerMethodField(read_only=True)
    reussite=serializers.SerializerMethodField(read_only=True)
    echec=serializers.SerializerMethodField(read_only=True)
    class Meta:
        model=Ensegnant
        fields='__all__'

    def get_moyenne(self, obj):
        # Django ORM s'occupe de la jointure implicitement
        moyenne = Note.objects.filter(nom_repetiteur__id=obj.id).aggregate(moyenne=Avg('note'))['moyenne']
        # moyenne=
        return moyenne if moyenne else 0  # Retourne 0 si aucune note
    
    def get_reussite(self,obj):

  
        reussites=Client.objects.filter(repetiteur__id=obj.id).filter(reussite=True).aggregate(models.Count('reussite'))
        return reussites  
    
    def get_echec(self,obj):

        reussites=Client.objects.filter(repetiteur__id=obj.id).filter(reussite=False).aggregate(models.Count('reussite'))
        return reussites  

class SerializeLivre(serializers.ModelSerializer):
    # children_1 = SerializeNote(many=True, read_only=True)
    # children_2 = SerializeCommentaire(many=True, read_only=True)
    Categorie=SerializeMatiere()
    classe=SerializeSalle(many=True)

    class Meta:
        model=Livre
        fields='__all__'


class LivreSerializer(serializers.ModelSerializer):
    # children_1 = SerializeNote(many=True, read_only=True)
    # children_2 = SerializeCommentaire(many=True, read_only=True)
    

    class Meta:
        model=Livre
        fields='__all__'

class SerializeListe_livre(serializers.ModelSerializer):

    livre_ajoute=SerializeLivre
    Id_use=SerializeUser
    class Meta:
        model=Liste_livre_ajoute
        fields='__all__'

class Liste_livreSerializer(serializers.ModelSerializer):

    class Meta:
        model=Liste_livre_ajoute
        fields='__all__'

class Serializerepetiteur_client(serializers.ModelSerializer):
    repetiteur=SerializeEnseignant()
    client=SerializeClient
    class Meta:
        model=repetiteur_client
        fields='__all__'

class repetiteur_clientSerializer(serializers.ModelSerializer):

    class Meta:
        model=repetiteur_client
        fields='__all__'

class SerializeRequete(serializers.ModelSerializer):
    ensegnant=SerializeEnseignant()
    client=SerializeClient()
    class Meta:
        model=requete
        fields='__all__'

class RequeteSerializer(serializers.ModelSerializer):

    class Meta:
        model=requete
        fields='__all__'

class SerializeNiveau_eleve(serializers.ModelSerializer):

    user=SerializeClient()
    class Meta:
        model=Niveau_eleve
        fields='__all__'


class Niveau_eleveSerializer(serializers.ModelSerializer):

    
    class Meta:
        model=Niveau_eleve
        fields='__all__'

class SerializeCommentaire(serializers.ModelSerializer):
    
    livre=SerializeLivre()
    ensegnant=SerializeEnseignant()
    client=SerializeUser()
    id_etablissement=serializerEtablissement()
    class Meta:
        model=Commentaire
        fields='__all__'
    

    

class CommentaireSerializer(serializers.ModelSerializer):
    user_names=serializers.CharField(source='client',read_only=True)
    
    class Meta:
        model=Commentaire
        fields='__all__'
    
    



class NoteSerializer(serializers.ModelSerializer):
    
    class Meta:
        model=Note
        fields='__all__'

class SerializerCitation(serializers.ModelSerializer):
    class Meta:
        model=Citation
        fields='__all__'

class SerializerReussite(serializers.ModelSerializer):
    etablissement=serializerEtablissement()
    classe=SerializeSalle()
    class Meta:
        model = Reussite
        fields='__all__'

class ReussiteSerializer(serializers.ModelSerializer):
 
    class Meta:
        model = Reussite
        fields='__all__'
        
class LoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()

    def validate(self, data):
        user = authenticate(**data)
        if user and user.is_active:
            return user
        raise serializers.ValidationError("Nom d'utilisateur ou mot de passe incorrect.")
    
class MessageSerializer(serializers.ModelSerializer):
    messager= SerializeUser()
    recepteur=SerializeUser()

    class Meta:
        model= Messagerie
        fields='__all__'

class SerializerMessage(serializers.ModelSerializer):
    messager= serializers.HiddenField(default=serializers.CurrentUserDefault())  # Champ caché
    class Meta:
        model= Messagerie
        fields='__all__'
    