function[Bcs]=Bcs(u)
% Fonction qui prend en argument le vecteur u (type list) contenant toutes
% les variables d'entrée, et qui renvoie la valeur de l'induction magnétique 
% dans la culasse statorique (type double)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Extraction des variables
Nbre_paires_poles_s=u(3);
Diametre_interne_s=u(7);
Profondeur_moteur=u(8);
Diametre_externe_r=u(16);
Be=u(22);
Longueur_dent_stator=u(26);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%% Variables primaire
Rayon_interne_stator=Diametre_interne_s/2;
Rayon_rotor=Diametre_externe_r/2;
Longueur_entrefer=Diametre_externe_r/2-Diametre_interne_s/2;
a_reperage_pole=pi/Nbre_paires_poles_s; %alias pas polaire

%%%%%%%%%%%% 

%%%%%%%%%%%% Variables secondaire

Surface_du_pole=(Rayon_rotor+Longueur_entrefer/2)*Profondeur_moteur*a_reperage_pole;

Scs=a_reperage_pole*(Rayon_interne_stator+Longueur_dent_stator)*Profondeur_moteur;

%%%%%%%%%%%% 

%%%%%%%%%%%%  Variable finale

Bcs=Be*Surface_du_pole/(2*Scs);

%%%%%%%%%%%% 
end