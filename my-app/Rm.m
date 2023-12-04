function[Rm]=Rm(u)
% Fonction qui renvoie le nombre de type double Rm, et qui prend en argument
% un vecteur u (type list) contenant des nombres de type double. (double
% correspond à un nombre décimal avec double précision)
%Rm=Pertes_fer(u)/(3*Im(u)^2)

Rm=3*E(u)^2/Pertes_fer(u);