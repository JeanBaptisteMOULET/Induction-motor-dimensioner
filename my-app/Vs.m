function[Vs]=Vs(u)
%Fonction qui prend en argument le vecteur u (type list) contenant toutes
%les variables d'entrée, et qui renvoie la valeur de Vs (complexe) (type
%double)

Vs=Is(u)*(Rs(u)+1i*Xs(u))+E(u); %Loi des mailles

end