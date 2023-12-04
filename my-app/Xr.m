function [Xr]=Xr(u)
%Fonction qui prend en argument le vecteur u (type list) contenant toutes
%les variables d'entrées, et qui renvoie la valeur de la réactance rotorique Xr (type double)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Nombre_paires_de_poles_s=u(3);
q_r=u(14);
Profondeur_moteur=u(8);
N_bobines_par_encoches=u(9);
Nombre_de_tours_par_bobines_r=u(13);
f=u(21);
Longueur_dent_rotor=u(24);

Largeur_encoche_r=u(29); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ner=q_r*Nombre_paires_de_poles_s*2;% Nombre d'encoches par phase au rotor

N_bobines_par_phase_r=q_r*(Nombre_paires_de_poles_s)*N_bobines_par_encoches;

Ns=N_bobines_par_phase_r*Nombre_de_tours_par_bobines_r;

%%%%%%%%%%%%%%%%%%%%%%%%%%%

mu0=4*pi*10e-7;
d3=0.1*Longueur_dent_rotor;
Xr=24*pi*mu0*f*(Ns^2/Ner)*(Profondeur_moteur/Largeur_encoche_r)*((Longueur_dent_rotor /3)+d3);
end