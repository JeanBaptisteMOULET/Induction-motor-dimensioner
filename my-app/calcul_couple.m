function [calcul_couple]= calcul_couple(u)
% Fonction qui prend en argument le vecteur u (type list) contenant toutes
% les variables d'entrée, et qui renvoie la valeur du couple (type double)

g=u(30);

Nombre_paires_de_poles_r=u(12);

f=u(21);

calcul_couple=double((3*Nombre_paires_de_poles_r/(2*pi*f))*(Rr(u)/g)*abs(Ir(u))^2);

end 

