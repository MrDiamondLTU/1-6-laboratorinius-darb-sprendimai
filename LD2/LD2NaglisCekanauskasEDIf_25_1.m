%Naglis Čekanauskas 2 laboratorinis darbas
% 7 variantas
clc; clear; close all;
%% 1. Vienmačiai masyvai

a = (200:-10:10)';

b = log10(a);

c = 10.^b;

d = c - a;

%% 2. Dvimačiai masyvai
%Matricos įvedimas
A = [pi/2,        3i,        exp(pi);
    log2(2),     2*pi,      log10(1);
    log(exp(1)), pi^3,      cos(pi)];

%Matricos A vidurinio  stulpelio pakeitimas 
A(:, 2) = rand(3, 1);

% Gautos matricos kiekvieno stulpelio suma
stulpeliu_sumos = sum(A, 1);

%% 3. Praktinis veiksmų su masyvais taikymas
% Initial duomenys
A_amp = 6;            % Amplitudė (V)
f = 2;                % Dažnis (Hz)
sigma = 1.5;          % Triukšmo lygis (V)
U1 = 4;               % Įtampos riba U1 (V)
U2 = 2;               % Įtampos riba U2 (V)

% Laiko vektorius
t = 0:0.005:2;

% Signalo s(t) ir triukšmo n sugeneravimas
s = A_amp * cos(2 * pi * f * t);
n = sigma * randn(size(t));
s_triuksm = s + n;    % Triukšmo paveiktas signalas

% a) Atrinkimas reikšmių, viršijančių U1
atrinktos = s_triuksm(s_triuksm > U1);

% b) Filtravimas: reikšmės, kurių |s| < U2, pakeičiamos 0
s_filt = s_triuksm;
s_filt(abs(s_filt) < U2) = 0;

% c) Nefiltruoto signalo dydis (elementų skaičius)
dydis_nefiltruoto = length(s_triuksm);

% d) a) dalyje atrinktų reikšmių dydis
dydis_atrinktu = length(atrinktos);

% e) Didžiausia ir mažiausia filtruoto signalo įtampos reikšmė
max_filt = max(s_filt);
min_filt = min(s_filt);
%% Papildoma uzduotis
% 1. Vektoriaus A įvedimas iš komandinės eilutės (pvz., įvedant [1:12])
A = input('Įveskite 12 elementų vektorių A: ');

% 2. Vektoriaus B sudarymas naudojant indeksavimą su ":" ir "end"
% Pirmiausia paimami elementai nuo 10 iki galo (end), po to – nuo 1 iki 9
B = [A(10:end), A(1:9)];

% 3. Teksto ir vektoriaus B išvedimas komandiniame lange
disp('vektorius B yra:');
disp(B);