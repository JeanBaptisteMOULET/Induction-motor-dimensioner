function[Puissance_meca]=Puissance_meca(u)
f=u(21);
g=u(30);
Nombre_paires_de_poles_s=u(3);

Vitesse_rotor=(1-g)*(2*pi*f)/Nombre_paires_de_poles_s;

Puissance_meca=Vitesse_rotor*calcul_couple(u);%Puissance fournie en sortie
end