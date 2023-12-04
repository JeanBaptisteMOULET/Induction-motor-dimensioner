function[rendement]=rendement(u)
%Fonction qui prend en argument le vecteur u contenant toutes les variables
%d'entrée et qui renvoie la valeur du rendement (type nombre décimal)


Puissance_active=3*abs(Vs(u))*abs(Is(u))*cosphi(u); %Puissance active consommée en entrée

rendement= Puissance_meca(u)/Puissance_active;


end