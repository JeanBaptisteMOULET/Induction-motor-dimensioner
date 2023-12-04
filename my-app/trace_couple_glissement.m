function[trace_couple_glissement]=trace_couple_glissement(u)
%Fonction qui prend en argument le vecteur u (type list) contenant toutes
%les variables d'entrée, et qui renvoie une matrice contenant les points
%(glissement,couple) (type double).
trace_couple_glissement=zeros(2,1000);
j=1;
for i=1:-0.01:0
    u(30)=i;
    trace_couple_glissement(1,j)=i;
    trace_couple_glissement(2,j)=calcul_couple(u);
    j=j+1;
end
end




