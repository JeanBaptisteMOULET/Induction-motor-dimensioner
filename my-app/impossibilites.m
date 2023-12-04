

function y=impossibilites(u)

%Fonction qui prend en argument le vecteur u (type list) contenant toutes
%les variables d'entrée, et qui renvoie une liste (type list) contenant
%"tous" les conflits de dimensions et messages d'avertissement (type char)
%(certains cas impossible n'ont peut être pas étés envisagés et peuvent
%être ajoutés dans cette fonction)

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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Calcul du coefficient  de remplissage
N_encoches_s=q*2*Nombre_paires_de_poles_s*Nombre_phases;
N_dent_stator=N_encoches_s;


N_spires_par_encoche_r=Nombre_de_tours_par_bobines_r*N_bobines_par_encoches_r;
N_spires_par_encoche_s=Nombre_de_tours_par_bobines_s*N_bobines_par_encoches_s;

surface_cuivre_encoche_r=N_spires_par_encoche_r*Section_fil_r;
surface_encoche_r=Longueur_dent_rotor*Largeur_encoche_r;
surface_encoche_s=Longueur_dent_stator*Largeur_encoche_s;
surface_cuivre_encoche_s=N_spires_par_encoche_s*Section_fil_s;
%N.B. Les dents sont rectangulaires, les encoches doivent donc être trapézoïdales
%On se permet d'approximer le trapèze par un rectangle car cette surface
%n'intervient dans aucun calcul excepté la génération du message d'erreur

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


y1='';
y2='';
y3='';
y4='';
y5='';
y6='';
y7='';
y8='';
y9='';
y10='';
y11='';

if (surface_cuivre_encoche_r>surface_encoche_r*0.7)
    % m11=surface_cuivre_encoche_r/surface_encoche_r;
   
y10= 'surface_cuivre_encoche_r>0.7*surface_encoche_r=>coefficient de remplissage>0.7 ';
end

if (surface_cuivre_encoche_s>surface_encoche_s*0.7)
     % m12=surface_cuivre_encoche_s/surface_encoche_s;
    
    y11='surface_cuivre_encoche_s>0.7*surface_encoche_s=>coefficient de remplissage>0.7 ';
end
if (Diametre_interne_s/2+Longueur_dent_stator)>Rayon_machine
y8='(Diametre_interne_s/2+Longueur_dent_stator)>Rayon_machine';
end

if Longueur_dent_rotor>Diametre_externe_r
y9='Longueur_dent_rotor>Diametre_externe_r';
end

if Diametre_externe_r>Rayon_machine*2
    y1='Diametre_externe_r>Diamètre_machine | ';
end

if Diametre_externe_r>Diametre_interne_s
    y7='Diametre_externe_r>Diametre_externe_s | ';
end


if Longueur_dent_stator<Largeur_dent_stator
    y2= 'Longueur_dent_stator<Largeur_dent_stator | ';
end


if Longueur_dent_rotor<Largeur_dent_rotor
    y3='Longueur_dent_rotor<Largeur_dent_rotor | ';
end

if Diametre_interne_s<Diametre_externe_r
    y4='Rayon_interne_stator < Rayon_rotor | ';
end

if Rayon_machine*2<Diametre_externe_r
    y5='Rayon_machine < Rayon_interne_stator | ';
end

if (N_encoches_s*Largeur_encoche_s)+(N_dent_stator*Largeur_dent_stator)<pi*Diametre_interne_s || (N_encoches_s*Largeur_encoche_s)+(N_dent_stator*Largeur_dent_stator)<pi*Diametre_interne_s
    y6='Pas assez de place pour les encoches dans le périmètre du stator | ';
end

y=[y1,y2, y3,y4, y5, y6,y7,y8,y9,y10,y11];







