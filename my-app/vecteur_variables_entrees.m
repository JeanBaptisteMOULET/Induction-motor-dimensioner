%Ce script sert à référencer les différentes variables d'entrées se
%trouvant dans le vecteur u. Il peut également être copié collé après
%l'entête d'une fonction afin de pouvoir y utiliser les variables.
%%%%%%%%%%%%%%%%%%% Rs
Temperature_enroulement_s=u(1);
Section_fil_s=u(2);
Nombre_paires_de_poles_s=u(3);
Nombre_de_tours_par_bobines_s=u(4);
q=u(5);
hauteur_tete_bobine_s=u(6);
Diametre_interne_s=u(7);
Profondeur_moteur=u(8);
N_bobines_par_encoches_s=u(9);

%%%%%%%%%%%%%%%%%%%Rr
Temperature_enroulement_r=u(10);
Section_fil_r=u(11);
Nombre_paires_de_poles_r=u(12);
Nombre_de_tours_par_bobines_r=u(13);
q_r=u(14);
hauteur_tete_bobine_r=u(15);
Diametre_externe_r=u(16);
Longueur_rotor=u(17);
N_bobines_par_encoches_r=u(18);
%%%%%%%%%%%%%%%%%%%Xm
Nombre_phases=u(19);
angle_de_racourcissement=u(20);
f=u(21);
Be=u(22);
Rayon_machine=u(23);
Longueur_dent_rotor=u(24);
Largeur_dent_rotor=u(25);
Longueur_dent_stator=u(26);
Largeur_dent_stator=u(27);
%%%%%%%%%%%%%%%%%%%Xs
Largeur_encoche_s=u(28);
%%%%%%%%%%%%%%%%%%%Xr
Largeur_encoche_r=u(29);
g=u(30);%glissement

