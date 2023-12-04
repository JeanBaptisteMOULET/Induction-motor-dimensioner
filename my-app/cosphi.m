function[cosphi]=cosphi(u)
% Fonction qui prend en argument le vecteur u (type list) contenant toutes
% les variables d'entrée, et qui renvoie la valeur du cos(phi) (type
% double) alias facteur de puissance

S=3*(Vs(u))*conj(Is(u));

P=real(S);

cosphi=P/S;


end