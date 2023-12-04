function [v] =Bdr_Bcr_Hdr_Hcr_Hds_Hcs(u)
% Fonction qui prend en argument le vecteur u (type list) contenant toutes
% les variables d'entrée, et qui renvoie un vecteur (type list) contenant
%toutes les variables indiquées dans le nom de la fonction (type double)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Nbre_paires_poles_s=u(3);
Nombre_de_tours_par_bobines_s=u(4);
q=u(5);
Diametre_interne_s=u(7);
Profondeur_moteur=u(8);
N_bobines_par_encoches=u(9);
q_r=u(14);
Diametre_externe_r=u(16);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Nombre_phases=u(19);
angle_de_racourcissement=u(20);
f=u(21);
Be=u(22);
Rayon_machine=u(23);
Longueur_dent_rotor=u(24);
Largeur_dent_rotor=u(25);
Longueur_dent_stator=u(26);
Largeur_dent_stator=u(27);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Longueur_entrefer=Diametre_externe_r/2-Diametre_interne_s/2;
Rayon_interne_stator=Diametre_interne_s/2;
Nombre_encoche_par_pole_s=q*Nombre_phases;
Nombre_encoche_par_pole_r=q_r*Nombre_phases;
Rayon_externe_rotor=Diametre_externe_r/2;
%q: nombre d'encoches par pôles et par phases

%kb: coefficient_de_bobinage

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Variables
a_reperage_pole=pi/Nbre_paires_poles_s; %alias pas polaire

Surface_du_pole=(Rayon_externe_rotor+Longueur_entrefer/2)*Profondeur_moteur*a_reperage_pole;
Sp=Surface_du_pole;

Scr=a_reperage_pole*(Rayon_externe_rotor-Longueur_dent_rotor)*Profondeur_moteur;

Sdr=Largeur_dent_rotor*Profondeur_moteur*Nombre_encoche_par_pole_r;

Sds=Largeur_dent_stator*Profondeur_moteur*Nombre_encoche_par_pole_s;

Scs=a_reperage_pole*(Rayon_interne_stator+Longueur_dent_stator)*Profondeur_moteur;


Bds=Be*Sp/Sds;

Bcs=Be*Sp/(2*Scs);

Bdr=Be*Sp/Sdr;

Bcr=Be*Sp/Scr;



ATds= 5.8056*exp(4.1861 * Bds)*Longueur_dent_stator;

 ATdr= 5.8056*exp(4.1861 * Bdr)*Longueur_dent_rotor;

 ATcs= 5.8056*exp(4.1861 * Bcs)*a_reperage_pole*Rayon_machine;

 ATcr= 5.8056*exp(4.1861 * Bcr)*a_reperage_pole*(Rayon_externe_rotor-Longueur_dent_rotor);

ATe= 5.8056*exp(4.1861*Be)*Longueur_entrefer;

Hdr=5.8056*exp(4.1861 * Bdr);
Hcr=5.8056*exp(4.1861 * Bcr);
Hds=5.8056*exp(4.1861 * Bcs);
Hcs=5.8056*exp(4.1861 * Bcs);

v=[Bdr,Bcr,Hdr,Hcr,Hds,Hcs];
end