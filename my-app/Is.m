function[Is]=Is(u)
%Fonction qui prend en argument le vecteur u (type list) contenant toutes
%les variables d'entrée, et qui renvoie du courant à l'entrée du stator Is (type double)

Is=Im(u)+Ir(u);
end