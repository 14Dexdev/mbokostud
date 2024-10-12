from argon2 import PasswordHasher
from django.shortcuts import render

# Create your views here.
from rest_framework.decorators import action
from django.db import IntegrityError
from django.http import JsonResponse
from requests import request
from rest_framework.viewsets import ReadOnlyModelViewSet,ModelViewSet
from rest_framework.views import APIView
from .Serializer import*
from rest_framework import generics,permissions,authentication,filters
from .models import *
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import authenticate,login,get_user_model
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from .Permission import IsOwnerOrReadOnly
from django.contrib.auth.hashers import make_password



class UserCreateView(generics.CreateAPIView):
       serializer_class = SerializeUser

       def create(self, request, *args, **kwargs):
           serializer = self.get_serializer(data=request.data)
           serializer.is_valid(raise_exception=True)
           user = serializer.save()
           token, created = Token.objects.get_or_create(user=user)
           return Response({
               'user': serializer.data,
               'token': token.key
           })

class UserLoginView(generics.GenericAPIView):
    serializer_class=LoginSerializer
    permission_classes = (permissions.AllowAny,)

    def post(self, request):
        serializer = LoginSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.validated_data
            token, created = Token.objects.get_or_create(user=user)
            return Response({'token': token.key})
        return Response(serializer.errors, status=400)

class ModelUser(ModelViewSet):
    
    serializer_class=SerializeUser
    def get_queryset(self):
        return Utilisateur.objects.all()
    
    def create(self, request, *args, **kwargs):
           serializer = self.get_serializer(data=request.data)
           serializer.is_valid(raise_exception=True)
        #    password=make_password(serializer.validated_data.pop('raw_password'))
           user = serializer.save()
           token, created = Token.objects.get_or_create(user=user)
           return Response({
               'user': serializer.data,
               'token': token.key
           })
    # def perform_create(self, serializer):
    

class ModeMatiere(ModelViewSet):
    serializer_class=MatiereSerializer
    # authentication_classes=[authentication.SessionAuthentication]
    # permission_classes=[permissions.IsAuthenticatedOrReadOnly]

    def get_queryset(self):
        return Matiere.objects.all()

class ListMatiere(generics.ListAPIView):
    serializer_class=SerializeMatiere
    # authentication_classes=[authentication.SessionAuthentication]
    # permission_classes=[permissions.IsAuthenticatedOrReadOnly]

    def get_queryset(self):
        return Matiere.objects.all()

class ModelClient(ModelViewSet):
    serializer_class=ClientSerializer

    def post(self, request, user_id,objectif_id,Salle_id,Matiere_id):
           serializer = self.get_serializer(data=request.data)
           serializer.is_valid(raise_exception=True)
           user = Utilisateur.objects.get(pk=user_id)
           objectif=Objectif.objects.get(pk=objectif_id)
           salle=Salles.objects.get(pk=Salle_id)
           matiere=Matiere.objects.get(pk=Matiere_id)
           child = serializer.save(user=user,objectif=objectif,salle=salle,matiere=matiere)
              
           return Response(serializer.data)
        #    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def get_queryset(self):
         return Client.objects.all()

class ListClient(generics.ListAPIView):
    serializer_class=SerializeClient
    def get_queryset(self):
         return Client.objects.all()
    

class ModelCommentaireGet(generics.ListAPIView):
    permission_classes=[IsOwnerOrReadOnly]
    serializer_class=SerializeCommentaire
    

    
    def get_queryset(self):
        
        return Commentaire.objects.all()

class TopEnseignantView(ReadOnlyModelViewSet):
    serializer_class = SerializeEnseignant

    def list(self, request):
        top_enseignants = Ensegnant.objects.annotate(
            moyenne_note=models.Avg('note__note')
        ).order_by('-moyenne')[:10]  # Affiche les 10 meilleurs
        serializer = self.get_serializer(top_enseignants, many=True)
        return Response(serializer.data)

class ModelCommentaire(ModelViewSet):
#     permission_classes=[IsOwnerOrReadOnly]
    authentication_classes=[authentication.SessionAuthentication,authentication.TokenAuthentication]
    serializer_class=CommentaireSerializer

    def perform_create(self, serializer):
        # Récupérer le groupe associé à partir des données de la requête
        ensegnant_id = self.request.data.get('ensegnant')
        groupe = Ensegnant.objects.get(pk=ensegnant_id)

        # Affecter l'utilisateur connecté et le groupe au serializer
        serializer.save(client=self.request.user) 

    def update(self, request, *args, **kwargs):
         return super().update(request, *args, **kwargs)

    def get_queryset(self):
        
        return Commentaire.objects.all()


class ModelSale(ModelViewSet):
    serializer_class=SerializeSalle
    authentication_classes=[authentication.SessionAuthentication]
    permission_classes= [permissions.IsAuthenticatedOrReadOnly]
    def get_queryset(self):
        
        return Salles.objects.all()

class ModelGroupe(ModelViewSet):
    authentication_classes=[authentication.SessionAuthentication]
    permission_classes= [permissions.IsAuthenticatedOrReadOnly]
    serializer_class=SerializeGroupe
    def get_queryset(self):
        
        return GroupeMatiere.objects.all()
    

class ModelEnseignant(ModelViewSet):
     
     serializer_class= EnseignantSerializer
     
     def post(self, request, user_id,Salle_id,Matiere_id):
           serializer = self.get_serializer(data=request.data)
           serializer.is_valid(raise_exception=True)
           user = Utilisateur.objects.get(pk=user_id)
           salle=Salles.objects.get(pk=Salle_id)
           matiere=Matiere.objects.get(pk=Matiere_id)
           enseignat = serializer.save(user=user,salle=salle,matiere=matiere)
              
           return Response(serializer.data)

     def get_queryset(self):
          return Ensegnant.objects.all()
     
class ListEnseignant(generics.ListAPIView):
     serializer_class=SerializeEnseignant
     def get_queryset(self):
          return Ensegnant.objects.all()
     
class ModelLivre(ModelViewSet):
     
     serializer_class=SerializeLivre
     authentication_classes=[authentication.SessionAuthentication]
     permission_classes= [permissions.IsAuthenticatedOrReadOnly]
     def post(self,Salle_id,Matiere_id):
           serializer = self.get_serializer(data=request.data)
           serializer.is_valid(raise_exception=True)
           salle=Salles.objects.get(pk=Salle_id)
           matiere=Matiere.objects.get(pk=Matiere_id)
           child = serializer.save(salle=salle,matiere=matiere)
              
           return Response(serializer.data)
     

     def retrieve(self, request, pk=None):
        # Récupérer le produit par son ID (optionnel)
        produit = self.get_object()
        serializer = self.get_serializer(produit)
        return Response(serializer.data)

     def list(self, request):
        # Effectuer la recherche en utilisant les paramètres de la requête
        queryset = self.filter_queryset(self.get_queryset())
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

     def get_queryset(self):
          return Livre.objects.all()
     
     def partial_update(self, request, *args, **kwargs):
          return super().partial_update(request, *args, **kwargs)

class Listlivre(generics.ListAPIView):
     serializer_class=SerializeLivre

     
    
     def get_queryset(self):
          return Livre.objects.all()     

class ModelListe_livre(ModelViewSet):
     
     serializer_class=SerializeListe_livre
     permission_classes=[permissions.IsAuthenticatedOrReadOnly]
     def post(self, request, user_id,livre_id):
           serializer = self.get_serializer(data=request.data)
           serializer.is_valid(raise_exception=True)
           user = Utilisateur.objects.get(pk=user_id)
           livre=Livre.objects.get(pk=livre_id)
           child = serializer.save(user=user,livre=livre)
              
           return Response(serializer.data)
     
     def get_queryset(self):
          return Liste_livre_ajoute.objects.all()

class Liste_livre_ajoutee(generics.ListAPIView):
     serializer_class=Liste_livreSerializer
     permission_classes=[permissions.IsAuthenticatedOrReadOnly]
     def perform_create(self, serializer):
        # Récupérer le groupe associé à partir des données de la requête
        livre_ajoute = self.request.data.get('livre_ajoute')
        groupe = Livre.objects.get(pk=livre_ajoute)

        # Affecter l'utilisateur connecté et le groupe au serializer
        serializer.save(Id_user=self.request.user, ensegnant=groupe) 

     def get_queryset(self):
          return Liste_livre_ajoute.objects.all()

class ModelNote(ModelViewSet):
     
     serializer_class=SerializeNote
     permission_classes=[IsOwnerOrReadOnly]
     def post(self, request, client_id,enseignant_id):
           serializer = self.get_serializer(data=request.data)
           serializer.is_valid(raise_exception=True)
           client = self.request.user
           repetiteur=Ensegnant.objects.get(pk=enseignant_id)
           note = serializer.save(Nom_client=client,Nom_repetiteur=repetiteur)
              
           return Response(serializer.data)
     
     def get_queryset(self):
          return Note.objects.all()
     
class ListNote(generics.ListAPIView):
     serializer_class=NoteSerializer
     def get_queryset(self):
          return Note.objects.all()

class ModelNiveau(ModelViewSet):
     
     serializer_class=SerializeNiveau_eleve
     
     def perform_create(self, serializer):
       
         
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save(user=self.request.user)

     def get_queryset(self):
          return Niveau_eleve.objects.all()
     
class ListNiveau(generics.ListAPIView):
     serializer_class=Niveau_eleveSerializer
     def get_queryset(self):
          return Niveau_eleve.objects.all()

class ModelRequete(ModelViewSet):
     permission_classes=[IsOwnerOrReadOnly]
     
     def perform_create(self, serializer):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        ensegnant_id = self.request.data.get('ensegnant')
        groupe = Ensegnant.objects.get(pk=ensegnant_id)

        # Affecter l'utilisateur connecté et le groupe au serializer
        serializer.save(client=self.request.user, ensegnant=groupe) 

     def get_queryset(self):
          return requete.objects.all()

class ListRequete(generics.ListAPIView):
     serializer_class=RequeteSerializer
     def get_queryset(self):
          return requete.objects.all()

class ModelRepetiteur_client(ModelViewSet):
     
     def post(self, request, user_id,objectif_id):
           serializer = self.get_serializer(data=request.data)
           serializer.is_valid(raise_exception=True)
           user = Client.objects.get(pk=user_id)
           objectif=Ensegnant.objects.get(pk=objectif_id)
           repetiteur_clients = serializer.save(user=user,objectif=objectif)
              
           return Response(serializer.data)
     
     def get_queryset(self):
          return repetiteur_client.objects.all()

class ListRepetiteur_Client(generics.ListAPIView):
     serializer_class=repetiteur_clientSerializer
     def get_queryset(self):
          return repetiteur_client.objects.all()

class ModelObjectif(ModelViewSet):
     authentication_classes=[authentication.SessionAuthentication]
     permission_classes= [permissions.IsAuthenticatedOrReadOnly]
     def post(self, request):
           serializer = self.get_serializer(data=request.data)
           serializer.is_valid(raise_exception=True)
           user = self.request.user
           objectif = serializer.save(user=user)
              
           return Response(serializer.data)
     
     def get_queryset(self):
          return Objectif.objects.all()
     
class ModelEtablissement(ModelViewSet):
     authentication_classes=[authentication.SessionAuthentication]
     permission_classes= [permissions.IsAuthenticatedOrReadOnly,permissions.IsAdminUser]
     def post(self, request):
           serializer = self.get_serializer(data=request.data)
           serializer.is_valid(raise_exception=True)
              
           return Response(serializer.data)
     
     def get_queryset(self):
          return Etablissement.objects.all()

class ModelReussite(ModelViewSet):
     serializer_class=ReussiteSerializer
     authentication_classes=[authentication.SessionAuthentication]
     permission_classes= [permissions.IsAuthenticatedOrReadOnly,permissions.IsAdminUser]
     def post(self, request, user_id,classe):
           serializer = self.get_serializer(data=request.data)
           serializer.is_valid(raise_exception=True)
           user = Etablissement.objects.get(pk=user_id)
           classe=Salles.objects.get(pk=classe)
           objectif = serializer.save(id_etablissement=user,classe=classe)
              
           return Response(serializer.data)
     
     def get_queryset(self):
          return Objectif.objects.all()
     
     
class ListObjectif(generics.ListAPIView):
     serializer_class=ObjectifSerializer
     def get_queryset(self):
          return Objectif.objects.all()
     
class ModelEtablissement(ModelViewSet):
     serializer_class=serializerEtablissement
     def get_queryset(self):
          return Etablissement.objects.all()
     
class ModelCitation(ModelViewSet):
     serializer_class= SerializerCitation
     def get_queryset(self):
          return Citation.objects.all()

class Modelreussite(generics.ListAPIView):
     serializer_class=SerializerReussite
     def get_queryset(self):
          return Reussite.objects.all()
     

# class YourModelSearchView(ViewSet):
#     def retrieve(self, request, pk=None):
#         if pk is None:
#             return Response({"detail": "L'ID est requis"}, status=400)

#         try:
#             # Recherche dans Elasticsearch
#             search = Search(using=YourModelDocument._get_using().using, index=YourModelDocument.Index.name).query('match', id=pk)
#             results = search.execute()

#             # Traiter les résultats de la recherche et construire une réponse
#             # ... 
#         except Exception as e:
#             return Response({"detail": str(e)}, status=500)

#     def list(self, request):
#         search_query = request.query_params.get('q')

#         try:
#             # Recherche dans Elasticsearch
#             search = Search(using=YourModelDocument._get_using().using, index=YourModelDocument.Index.name)

#             if search_query:
#                 search = search.query('match', name=search_query)

#             results = search.execute()

#             # Traiter les résultats de la recherche et construire une réponse
#             # ...
#         except Exception as e:
#             return Response({"detail": str(e)}, status=500)
class UserView(APIView):
      permission_classes = [permissions.IsAuthenticated]
     #  queryset=Utilisateur.objects.all()
     #  serializer_class=SerializeUser
      def get(self, request):
          serializer = SerializeUser(request.user)
          return Response(serializer.data)

class BookViewSet(ModelViewSet):
    queryset = Livre.objects.all()
    serializer_class = LivreSerializer

    def get_queryset(self):
        # Logique de recommandation basique. Par exemple, en fonction du genre.
        genre = self.request.query_params.get('genre', None)
        if genre:
            return Livre.objects.filter(Categorie=genre)
        return super().get_queryset()  

class MessagerieModel(ModelViewSet):
     permission_classes=[permissions.IsAuthenticated]
     queryset= Messagerie.objects.all()
     serializer_class=SerializerMessage

     def post(self, request):
           serializer = self.get_serializer(data=request.data)
           serializer.is_valid(raise_exception=True)
           user = self.request.user
           objectif = serializer.save(messager=user)
              
           return Response(serializer.data)
     
     def perform_create(self, serializer):
        # Attribuer l'utilisateur actuel à l'instance de modèle
        serializer.save(messager=self.request.user)

class MessageListe(generics.ListAPIView):
     queryset=Messagerie.objects.all()
     serializer_class=MessageSerializer