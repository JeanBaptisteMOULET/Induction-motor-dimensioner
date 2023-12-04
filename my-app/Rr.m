function[Rr]=Rr(u)
% Fonction qui renvoie le nombre de type double Rr, et qui prend en argument
% un vecteur u (type list) contenant des nombres de type double. (double
% correspond à un nombre décimal avec double précision)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Temperature_enroulement_r=u(10);
Section_fil_r=u(11);
Nombre_paires_de_poles_r=u(12);
Nombre_de_tours_par_bobines_r=u(13);
q_r=u(14);
hauteur_tete_bobine_r=u(15);
Diametre_externe_r=u(16);
Longueur_rotor=u(17);
N_bobines_par_encoches_r=u(18);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Constantes
Resistivite_cuivre_normale=17e-9; % ohm.m

Temperature_caracteristique_cuivre=38.7; % Kelvins

Temperature_reference=300; % Kelvins

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Variables


L_entre_poles=sin(pi/(2*Nombre_paires_de_poles_r))*Diametre_externe_r;

c_encoche=sqrt(hauteur_tete_bobine_r^2+(L_entre_poles/2)^2);

Longueur_d_une_spire_r=4*c_encoche+2*Longueur_rotor;



N_bobines_par_phase_r=q_r*N_bobines_par_encoches_r*Nombre_paires_de_poles_r;

N_spires_par_phase_r=N_bobines_par_phase_r*(Nombre_de_tours_par_bobines_r);




L_totale_fil_par_phase_r= (Longueur_d_une_spire_r)*N_spires_par_phase_r;

Resistivite_cuivre=Resistivite_cuivre_normale*(Temperature_enroulement_r-Temperature_caracteristique_cuivre)/(Temperature_reference-Temperature_caracteristique_cuivre);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Rr=Resistivite_cuivre*L_totale_fil_par_phase_r/Section_fil_r;