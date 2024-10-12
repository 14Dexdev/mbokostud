from MbokoAPI.models import *
from MbokoAPI.Serializer import *
from rest_framework import generics

class SearchCommntaire(generics.ListAPIView):
    queryset=Commentaire.objects.all()
    serializer_class=SerializeCommentaire
    
    def get_queryset(self):
        qs= super().get_queryset()
        q= self.request.GET.get('q')
        
        # result=Commentaire.objects.none()
        # if q is not None:
        #    utilisateur=None 
        #    if self.request.user.is_authenticated:
        #         utilisateur=self.request.user
        result=qs.search(q)
        return result
    
class SearchLivre(generics.ListAPIView):
     queryset=Livre.objects.all() 
     serializer_class=SerializeLivre
     def get_queryset(self):
            qs= super().get_queryset()
            q= self.request.GET.get('q')
            p= self.request.GET.get('p')
            
            # result=Commentaire.objects.none()
            # if q is not None:
            #    utilisateur=None 
            #    if self.request.user.is_authenticated:
            #         utilisateur=self.request.user
            result=qs.search(q,p)
            print(result)
            return result
     
class SearchEnseignant(generics.ListAPIView):
    queryset=Ensegnant.objects.all() 
    serializer_class=SerializeEnseignant
    def get_queryset(self):
        qs= super().get_queryset()
        q= self.request.GET.get('q')
        
        # result=Commentaire.objects.none()
        # if q is not None:
        #    utilisateur=None 
        #    if self.request.user.is_authenticated:
        #         utilisateur=self.request.user
        result=qs.search(q)
        print(result)
        return result
    
class SearchMessagerie(generics.ListAPIView):
    queryset=Messagerie.objects.all() 
    serializer_class=MessageSerializer
    def get_queryset(self):
        qs= super().get_queryset()
        q= self.request.GET.get('q')
        
        # result=Commentaire.objects.none()
        # if q is not None:
        #    utilisateur=None 
        #    if self.request.user.is_authenticated:
        #         utilisateur=self.request.user
        result=qs.search(q)
        print(result)
        return result