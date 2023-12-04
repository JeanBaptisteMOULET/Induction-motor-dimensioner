function[Ir]=Ir(u)
%Fonction qui prend en argument le vecteur u (type list) contenant toutes
%les variables d'entrée, et qui renvoie du courant rotorique Ir (type double)
g=u(30);
Ir=E(u)/((1i*Xr(u))+(Rr(u)/g));
end