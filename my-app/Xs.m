function [Xes]=Xes(u)
%Fonction qui prend en argument le vecteur u (type list) contenant toutes
%les variables d'entrées, et qui renvoie la valeur de la réactance statorique Xs (type double)


% L_enc=Largeur_encoche
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Nombre_paires_de_poles_s=u(3);
Nombre_de_tours_par_bobines_s=u(4);
Profondeur_moteur=u(8);
Nombre_paires_de_poles_r=u(12);
q_r=u(14);
N_bobines_par_encoches_r=u(18);
f=u(21);
Longueur_dent_stator=u(26);

Largeur_encoche_s=u(28);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


N_bobines_par_phase_r=q_r*N_bobines_par_encoches_r*Nombre_paires_de_poles_r;
N_encoches_s=q_r*Nombre_paires_de_poles_s*2;

Ns=N_bobines_par_phase_r*Nombre_de_tours_par_bobines_s;
Nes=N_encoches_s/3;  %%%3phases car Nes c'est le nombres d'encoches par phase
mu0=4*pi*10e-7;
d3=0.1*Longueur_dent_stator;
Xes=24*pi*mu0*f*(Ns^2/Nes)*(Profondeur_moteur/Largeur_encoche_s)*((Longueur_dent_stator/3)+d3);
end
