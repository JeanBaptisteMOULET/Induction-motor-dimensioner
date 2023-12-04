function[Rs]=Rs(u)
%Fonction qui prend en argument le vecteur u (type list) contenant toutes
%les variables d'entrée, et qui renvoie la valeur de la résistance statorique par phase (type double)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Temperature_enroulement_s=u(1);
Section_fil_s=u(2);
Nombre_paires_de_poles_s=u(3);
Nombre_de_tours_par_bobines_s=u(4);
q=u(5);
hauteur_tete_bobine_s=u(6);
Diametre_interne_s=u(7);
Profondeur_moteur=u(8);
N_bobines_par_encoches_s=u(9);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Constantes
Resistivite_cuivre_normale=17e-9; % ohm.m

Temperature_caracteristique_cuivre=38.7; % Kelvins

Temperature_reference=300; % Kelvins


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Variables

L_entre_poles=sin(pi/(2*Nombre_paires_de_poles_s))*Diametre_interne_s;

c_encoche=sqrt(hauteur_tete_bobine_s^2+(L_entre_poles/2)^2);

Longueur_d_une_spire=4*c_encoche+2*Profondeur_moteur;

N_bobines_par_phase_r=q*(Nombre_paires_de_poles_s)*N_bobines_par_encoches_s;

N_spires_par_phase_s=N_bobines_par_phase_r*(Nombre_de_tours_par_bobines_s);


L_totale_fil_par_phase_s= (Longueur_d_une_spire)*N_spires_par_phase_s;


Resistivite_cuivre=Resistivite_cuivre_normale*(Temperature_enroulement_s-Temperature_caracteristique_cuivre)/(Temperature_reference-Temperature_caracteristique_cuivre);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Calcul de Rs

Rs=Resistivite_cuivre*L_totale_fil_par_phase_s/Section_fil_s;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%