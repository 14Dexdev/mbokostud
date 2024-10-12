"""
URL configuration for mbokostudy project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls.static import static
from django.conf import settings
from django.contrib import admin
from django.urls import include, path
from  rest_framework import routers
from rest_framework.authtoken import views
from MbokoAPI.views import *
import search

router=routers.DefaultRouter()

router.register(prefix="Utilisateur",viewset=ModelUser,basename="Utilisateur")
router.register('Matiere',ModeMatiere,basename='Matiere')
router.register('Client',ModelClient,basename='Client')
router.register('Groupe',ModelGroupe,basename='Groupe')
router.register('Salle',ModelSale,basename='Salle')
router.register('Note',ModelNote,basename='Note')
router.register('Niveau',ModelNiveau,basename='Niveau')
router.register('Enseignant',ModelEnseignant,basename='Enseignant')
router.register('Requete',ModelRequete,basename='Requete')
router.register('Livre',ModelLivre,basename='Livre')
router.register('Livre_ajoute',ModelListe_livre,basename='Livre_ajoute')
router.register('Repetiteur_Client',ModelRepetiteur_client,basename='Repetiteur_client')
router.register('Commentaire',ModelCommentaire,basename='Commentaire')
router.register('Objectif',ModelObjectif,basename='Objectif')
router.register('Etablissement',ModelEtablissement,'Etablissement')
router.register('Citation',ModelCitation,'Citation')
router.register('Reussite',ModelReussite,'Reussite')
router.register('TopEnseignant',TopEnseignantView,'TopEnseignant')
router.register('Messagerie',MessagerieModel,'Messagerie')
urlpatterns = [
   path('admin/', admin.site.urls),
   path('MbokoStd/',include(router.urls)),
   path('Login/',UserLoginView.as_view()),
   path('Singup/',UserCreateView.as_view()),
   path('MbokoStd/Commentaireget/',ModelCommentaireGet.as_view()),
   path('MbokoStd/Enseignantget/',ListEnseignant.as_view()),
   path('MbokoStd/Reussiteget/',Modelreussite.as_view()),
   path('MbokoStd/Livreget/',Listlivre.as_view()),
   path('MbokoStd/Search/',include('search.urls')),
   path('MbokoStd/Api_token/',views.obtain_auth_token),
   path('MbokoStd/getUser/',UserView.as_view()),
   path('MbokoStd/getMessage/',MessageListe.as_view()),
#    path('Salle/', include(router.urls))

]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


endpoint="http://127.0.0.1:8000/Utilisateur/"
