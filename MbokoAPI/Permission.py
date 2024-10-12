from rest_framework import permissions 

class IsProprietaire(permissions.BasePermission):
    def has_permission(self, request, view,obj):
        if request.method in permissions.SAFE_METHODS:
            return True
        
        return obj.user == request.user
    


class IsOwnerOrReadOnly(permissions.BasePermission):
    """
    Permet uniquement à l'utilisateur propriétaire d'un objet de le modifier ou de le supprimer.
    """
    def has_object_permission(self, request, view, obj):
        # Vérifiez si la requête est une requête GET (lecture)
        if request.method in permissions.SAFE_METHODS:
            return True

        # Vérifiez si l'utilisateur est le propriétaire de l'objet
        return obj.client == request.user