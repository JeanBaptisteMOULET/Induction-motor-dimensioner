function [Bds] =Bds(u)
% Fonction qui prend en argument le vecteur u (type list) contenant toutes
% les variables d'entrée, et qui renvoie la valeur de l'induction magnétique 
% dans la dent statorique (type double)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Extraction des variables
Nbre_paires_poles_s=u(3); 
q=u(5);
Diametre_interne_s=u(7);
Profondeur_moteur=u(8);
Diametre_externe_r=u(16);
Be=u(22);
Largeur_dent_stator=u(26);
Nombre_phases=u(19);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%% Variables primaire
Longueur_entrefer=Diametre_externe_r/2-Diametre_interne_s/2;
Rayon_rotor=Diametre_externe_r/2;
Nombre_encoche_par_pole_s=q*Nombre_phases;
a_reperage_pole=pi/Nbre_paires_poles_s; %alias pas polaire
%%%%%%%%%%%% 

%%%%%%%%%%%% Variables secondaire
Surface_du_pole=(Rayon_rotor+Longueur_entrefer/2)*Profondeur_moteur*a_reperage_pole;

Sds=Largeur_dent_stator*Profondeur_moteur*Nombre_encoche_par_pole_s;%Section d'une dent statorique
%%%%%%%%%%%% 

%%%%%%%%%%%%  Variable finale
Bds=Be*Surface_du_pole/Sds;
%%%%%%%%%%%% 
end