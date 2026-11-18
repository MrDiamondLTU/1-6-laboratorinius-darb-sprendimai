% Naglis Čekanauskas EDIf-25/1 2026-09-28 (7 variantas)
clc; clear; close all;

%% 1. Dvimatis grafikų vaizdavimas

% --- a dalis ---
t = linspace(-pi, pi, 50); 
y_a = sin(t);              % Funkcija y(t) = sin(t)

figure(1);
plot(t, y_a, 'r--', 'LineWidth', 1.5);
xlabel('t');
ylabel('y(t)');
title('Funkcijos y(t) = sin(t) grafikas');
axis([min(t), max(t), min(y_a), max(y_a)]); % Ribos pagal mažiausias ir didžiausias reikšmes
legend('y(t) = sin(t)', 'Location', 'northeastoutside'); % Paaiškinimas už grafiko ribų
grid on;

% --- b ir c dalys ---
x = linspace(-pi, pi, 50);
y1 = -x.^2 + 9;            % y(x) = -x^2 + 9
y2 = x.^3 - 2*x.^2 - 9;    % y(x) = x^3 - 2x^2 - 9

figure(2);
plot(x, y1, 'b-', 'LineWidth', 1.5); hold on;
plot(x, y2, 'g--', 'LineWidth', 1.5); hold off;

xlabel('x');
ylabel('y(x)');
title('Funkcijų y_1(x) ir y_2(x) grafikai');

% Ribų nustatymas pagal mažiausias ir didžiausias abiejų funkcijų reikšmes
all_y = [y1, y2];
axis([min(x), max(x), min(all_y), max(all_y)]);

legend('y_1(x) = -x^2 + 9', 'y_2(x) = x^3 - 2x^2 - 9', 'Location', 'northeastoutside');
grid on;


%% 2. Specializuotų grafikų kūrimas

% --- a ir b dalys ---
% Duomenų matrica: 6 studentai (eilutės) ir 4 laboratoriniai darbai (stulpeliai)
evaluations = [
    8, 7, 9, 10;  % V.A.
    6, 8, 7,  9;  % A.G.
    9, 9, 10, 8;  % G.N.
    7, 6, 8,  7;  % A.T.
    10, 9, 8, 9;  % E.S.
    5, 7, 6,  8   % J.S.
    ];

student_names = {'V.A.', 'A.G.', 'G.N.', 'A.T.', 'E.S.', 'J.S.'};

figure(3);

% a) Vertikalių stulpelių diagrama (bar)
subplot(2, 1, 1);
bar(evaluations'); % Transponuojame, kad X ašyje būtų laboratoriniai darbai (1..4)
xlabel('l.d.');
ylabel('Pažymys');
title('a) Studentų pažangumas laboratorinių darbų metu');
ylim([0 10]);
legend(student_names, 'Location', 'northeastoutside');
grid on;

% b) Kiekvieno laboratorinio darbo vidurkis diskrečiame formate (stem)
ld_averages = mean(evaluations, 1); % Kiekvieno stulpelio (l.d.) vidurkis

subplot(2, 1, 2);
stem(1:4, ld_averages, 'filled', 'LineWidth', 1.5);
xlabel('l.d.');
ylabel('Vidurkis');
title('b) Laboratorinių darbų įvertinimų vidurkiai');
xlim([0 5]);
ylim([0 10]);
xticks(1:4);
grid on;
%% Papildoma užduotis (7 variantas)
% Signalų grafinis atvaizdavimas, naudojant 2 lab. d. 3 užduoties signalus
clc; clear; close all;

% 1. 2 laboratorinio darbo 3 užduoties duomenys
A_amp = 6;            % Amplitudė (V)
f = 2;                % Dažnis (Hz)
sigma = 1.5;          % Triukšmo lygis (V)
U1 = 4;               % Įtampos riba U1 (V)
U2 = 2;               % Įtampos riba U2 (V)

t = 0:0.005:2;                          % Laiko vektorius
s = A_amp * cos(2 * pi * f * t);        % Signalas s(t)
n = sigma * randn(size(t));             % Triukšmas
u_pradinis = s + n;                     % Pradinis (triukšmo paveiktas) signalas

u_filtruotas = u_pradinis;              % Filtruotas signalas:
u_filtruotas(abs(u_filtruotas) < U2) = 0;   % |u| < U2 pakeičiama nuliais

% 2. Grafinis atvaizdavimas
figure('Name', 'Signalų grafinis atvaizdavimas', 'NumberTitle', 'off');

% -------------------------------------------------------------------------
% a) Pradinis ir filtruotas signalai bei filtravimo ribos U1, U2
% -------------------------------------------------------------------------
subplot(1, 2, 1); % Horizontalus išdėstymas (1 eilutė, 2 stulpeliai)
hold on;

% Pradinis signalas – ištisinė mėlyna linija
plot(t, u_pradinis, 'b-', 'LineWidth', 1.2, 'DisplayName', 'Pradinis signalas');
% Filtruotas signalas – taškinė žalia linija
plot(t, u_filtruotas, 'g:', 'LineWidth', 2.0, 'DisplayName', 'Filtruotas signalas');
% Riba U1
yline(U1, 'r--', 'LineWidth', 1.2, 'DisplayName', sprintf('Riba U_1 = %.1f V', U1));
% Riba U2 – brūkšninė-taškinė linija
yline(U2, 'm-.', 'LineWidth', 1.2, 'DisplayName', sprintf('Riba U_2 = %.1f V', U2));

hold off;

title('a) Pradinis ir filtruotas signalai');
xlabel('Laikas t, s', 'FontSize', 13, 'FontWeight', 'bold');
ylabel('Įtampa U, V', 'FontSize', 13, 'FontWeight', 'bold');
xlim([min(t), max(t)]);
ylim([min(u_pradinis) - 1, max(u_pradinis) + 1]);
legend('Location', 'southoutside');
grid on;

% -------------------------------------------------------------------------
% b) Pradinio signalo reikšmės, viršijančios U1 ribą (diskretus formatas)
% -------------------------------------------------------------------------
subplot(1, 2, 2);

ind = u_pradinis > U1;
t_virs = t(ind);
u_virs = u_pradinis(ind);

hold on;
stem(t_virs, u_virs, 'b', 'LineWidth', 1.0, 'DisplayName', 'Reikšmės > U_1');

% Visos minimalios ir maksimalios reikšmės tarp viršijančių U1
max_val = max(u_virs);
min_val = min(u_virs);
t_max = t_virs(u_virs == max_val);
t_min = t_virs(u_virs == min_val);

% Maksimumo žymeklis (dydis 9)
plot(t_max, max_val * ones(size(t_max)), 'ro', 'MarkerSize', 9, ...
    'MarkerFaceColor', 'r', 'DisplayName', sprintf('Maksimumas (%.2f V)', max_val));
% Minimumo žymeklis
plot(t_min, min_val * ones(size(t_min)), 'gs', 'MarkerSize', 7, ...
    'MarkerFaceColor', 'g', 'DisplayName', sprintf('Minimumas (%.2f V)', min_val));
hold off;

title('b) Signalo reikšmės, viršijančios U_1 ribą');
xlabel('Laikas t, s', 'FontSize', 13, 'FontWeight', 'bold');
ylabel('Įtampa U, V', 'FontSize', 13, 'FontWeight', 'bold');
xlim([min(t), max(t)]);
ylim([U1 - 0.5, max_val + 1]);
legend('Location', 'southoutside');
grid on;
