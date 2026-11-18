function y = skaicsinc(x)
% SKAICSINC Apskaičiuoja funkciją y = sin(x)/x (kai x ~= 0) ir y = 1 (kai x = 0).
%
%   y = skaicsinc(x)
%
%   Įėjimo kintamieji:
%       x - skaičius, vektorius arba matrica
%   Išėjimo kintamieji:
%       y - to paties dydžio masyvas su apskaičiuotomis reikšmėmis
%
%   Pavyzdys:
%       y = skaicsinc([-pi 0 pi/2])

% Paruošiame tokio paties dydžio masyvą rezultatams
y = zeros(size(x));

% Randame kur x lygus nuliui, o kur nelygus
nulis = (x == 0);
ne_nulis = ~nulis;

% Priskiriame reikšmes pagal sąlygą
y(nulis) = 1;
y(ne_nulis) = sin(x(ne_nulis)) ./ x(ne_nulis);
end
