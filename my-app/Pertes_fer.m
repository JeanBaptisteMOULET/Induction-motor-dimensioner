function[Pertes_fer]=Pertes_fer(u)
%Fonction qui prend en argument le vecteur u (type list) contenant toutes
%les variables d'entrée, et qui renvoie la valeur des pertes fer (type float)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                  
Diametre_interne_s=u(7);
Profondeur_moteur=u(8);
Rayon_machine=u(23);
Longueur_dent_stator=u(26);
Largeur_dent_stator=u(27);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%% Variables primaires
Rayon_interne_stator=Diametre_interne_s/2;

Bds1=Bds(u);% nécessité de renommer la variable issue de l'appel de fonction

Bcs1=Bcs(u);

a1=1.57510e-2;%coefficient lié à la nature du tôle  FeV1000 65HDMN (page 87)

b1=1.2210e-3 ; %coefficient lié à la nature du tôle  FeV1000 65HDMN (page 87)

%%%%%%%%%%%%%%%%%%%%%%% Variables secondaires

masse_volumique_fer=7.65;

volume_dent_s=Largeur_dent_stator*Longueur_dent_stator*Profondeur_moteur;

f=50; %Hz
a_bds = a1*Bds1^2;
b_bds = b1*Bds1^2;

a_bcs = a1*Bcs1^2;
b_bcs = b1*Bcs1^2;


volume_culasse_s=(4/3)*pi*(Rayon_machine)^3-(4/3)*pi*(Rayon_interne_stator+Longueur_dent_stator)^3;%Soustraction de volumes de sphères

%%%%%%%%%%%%%%%%%%%%%%% Variable tertiaires

kds=2;

kcs=2;

Mds=masse_volumique_fer*volume_dent_s; % masse d'une dent statorique

Wfe_bds=a_bds*f+b_bds*f^2; %densité massique de fer pour l*induction magnétique dans les dents statorique

Wfe_bcs=a_bcs*f+b_bcs*f^2;% cs : culasse statorique

Mcs=masse_volumique_fer*volume_culasse_s; % masse de la culasse statorique
%%%%%%%%%%%%%%%%%%%%%%% Variable finale

Pertes_fer=kds*Mds*Wfe_bds+kcs*Mcs*Wfe_bcs;