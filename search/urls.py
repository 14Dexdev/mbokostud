from django.urls import path
from .views import *
urlpatterns=[
    path('',SearchCommntaire.as_view(), name='SearchCommentaire'),
    # path('Enseignant/',SearchEnseignant.as_view(), name='SearchEnseignant')
    path('Livre/',SearchLivre.as_view(), name='SearchLivre'),
    path('Messagerie/',SearchMessagerie.as_view(), name='SearchMessagerie'),
]