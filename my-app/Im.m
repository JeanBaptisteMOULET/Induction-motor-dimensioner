function[Im]=Im(u)
%Fonction qui prend en argument le vecteur u (type list) contenant toutes
%les variables d'entrées, et qui renvoie la valeur du courant de magnétisation (type float)
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

ATp=ATe+ATds+ATdr+ATcs+ATcr;



phi_p=Be*Surface_du_pole;

N_encoches_s=q*2*Nbre_paires_poles_s*Nombre_phases;


pas_dentaire_s= Nbre_paires_poles_s*2*pi/N_encoches_s; % pas dentaire électrique

Kd=sin(q*pas_dentaire_s/2)/(q*sin(pas_dentaire_s/2)); %V

Kp= sin(angle_de_racourcissement/2);

Kb=Kd*Kp; %V

N_spires_par_phase=q*Nbre_paires_poles_s*Nombre_de_tours_par_bobines_s*N_bobines_par_encoches;
N_spires_par_phase=u(5)*u(3)*u(4)*u(9);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Variables finales
E= 2*pi*Kb*N_spires_par_phase*f*phi_p/sqrt(2);%V

Im= Nbre_paires_poles_s* pi* ATp / (3*sqrt(2)*Kb*N_spires_par_phase); %V
end