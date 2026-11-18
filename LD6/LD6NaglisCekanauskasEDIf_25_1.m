% Naglis Čekanauskas EDIf-25/1 6 laboratorinis darbas (7 variantas)
% Paleidžiamas iš LD6 aplanko (kartu su visomis funkcijomis).
clc; clear; close all;

%% 1. Elementarių funkcijų kūrimas: skaicsinc
disp('=== help skaicsinc ===');
help skaicsinc

x1 = [-pi, -1, 0, 1, pi];
y1 = skaicsinc(x1);
disp('skaicsinc([-pi -1 0 1 pi]) =');
disp(y1);

%% 2. Globalių kintamųjų naudojimas
% Atskiras skriptas: uzd2_3failas.m (naudoja funkcija_teigiama ir funkcija_neigiama)
uzd2_3failas

%% Papildoma užduotis: graftancotan
disp('=== help graftancotan ===');
help graftancotan

xt = -pi:0.01:pi;

% a) be grąžinamų kintamųjų – braižomi grafikai
graftancotan(xt);

% b) vienas grąžinamas kintamasis – matrica [tan; cot]
rez = graftancotan([pi/6, pi/4, pi/3]);
disp('rez = graftancotan([pi/6 pi/4 pi/3]) =');
disp(rez);

% c) du grąžinami kintamieji
[ytan, ycot] = graftancotan([pi/6, pi/4, pi/3]);
disp('ytan ='); disp(ytan);
disp('ycot ='); disp(ycot);
