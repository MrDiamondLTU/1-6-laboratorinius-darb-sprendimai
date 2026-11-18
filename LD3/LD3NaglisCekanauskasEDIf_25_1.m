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
legend('y(t) = sin(t)', 'Location', 'best');
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

legend('y_1(x) = -x^2 + 9', 'y_2(x) = x^3 - 2x^2 - 9', 'Location', 'best');
grid on;


% 2. Specializuotų grafikų kūrimas

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

% b) Kiekvieno studento vidurkis diskrečiame formate (stem)
student_averages = mean(evaluations, 2); % Skaičiuojamas kiekvieno studento vidurkis

subplot(2, 1, 2);
stem(1:6, student_averages, 'filled', 'LineWidth', 1.5);
xlabel('Studentas');
ylabel('Vidurkis');
title('b) Studentų įvertinimų vidurkiai');
xlim([0 7]);
ylim([0 10]);
xticks(1:6);
grid on;
%% Papildoma
%3 Laboratorinis darbas: Papildoma užduotis (7 variantas)
% Signalų grafinis atvaizdavimas
clc; clear; close all;

%1. Duomenų paruošimas (jei naudojami pavyzdiniai duomenys)
% Jei turite 2 lab. d. kintamuosius, šią dalį galite pakeisti savaisiais.
t = linspace(0, 10, 200);                 % Laiko ašis
U1 = 2;                                   % Apatinė filtravimo riba U1
U2 = 5;                                   % Viršutinė filtravimo riba U2

% Pavyzdinis pradinis ir filtruotas signalas:
u_pradinis = 3 * sin(2*pi*0.2*t) + 3;     % Pradinis signalas
u_filtruotas = u_pradinis;               % Filtruotas signalas tarp U1 ir U2
u_filtruotas(u_pradinis < U1 | u_pradinis > U2) = NaN; 


%2. Grafinis atvaizdavimas
figure('Name', 'Signalų grafinis atvaizdavimas', 'NumberTitle', 'off');

% -------------------------------------------------------------------------
% a) Pirmasis grafikas: Pradinis ir filtruotas signalai bei ribos U1, U2
% -------------------------------------------------------------------------
subplot(1, 2, 1); % Horizontalus išdėstymas (1 eilutė, 2 stulpeliai)
hold on;

% Pradinis signalas
plot(t, u_pradinis, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Pradinis signalas');
% Filtruotas signalas
plot(t, u_filtruotas, 'g:', 'LineWidth', 2.0, 'DisplayName', 'Filtruotas signalas');
% Horizontali linija U1 
yline(U1, 'r--', 'LineWidth', 1.2, 'DisplayName', sprintf('Riba U_1 = %.1f V', U1));
% Horizontali linija U2 
yline(U2, 'm-.', 'LineWidth', 1.2, 'DisplayName', sprintf('Riba U_2 = %.1f V', U2));

hold off;

% Ašių ir grafiko apipavidalinimas
title('a) Pradinis ir filtruotas signalai');
xlabel('Laikas t, s', 'FontSize', 13, 'FontWeight', 'bold');
ylabel('Įtampa U, V', 'FontSize', 13, 'FontWeight', 'bold');
xlim([min(t), max(t)]);
ylim([min(u_pradinis)-1, max(u_pradinis)+1]);
legend('Location', 'southoutside');
grid on;
% -------------------------------------------------------------------------
% Antrasis grafikas: Pradinio signalo reikšmės, viršijančios U1 ribą
% -------------------------------------------------------------------------
subplot(1, 2, 2); % Horizontalus išdėstymas

ind = u_pradinis > U1;
t_virsh = t(ind);
u_virsh = u_pradinis(ind);

hold on;

stem(t_virsh, u_virsh, 'b', 'LineWidth', 1.0, 'DisplayName', 'Reikšmės > U_1');

% Surandame minimalias ir maksimalias įtampos reikšmes tarp viršijančių U1
max_val = max(u_virsh);
min_val = min(u_virsh);

t_max = t_virsh(u_virsh == max_val);
t_min = t_virsh(u_virsh == min_val);

% Maksimalių reikšmių žymekliai 
plot(t_max, max_val * ones(size(t_max)), 'ro', 'MarkerSize', 9, ...
    'MarkerFaceColor', 'r', 'DisplayName', sprintf('Maksimumas (%.2f V)', max_val));

% Minimalių reikšmių žymekliai
plot(t_min, min_val * ones(size(t_min)), 'gs', 'MarkerSize', 7, ...
    'MarkerFaceColor', 'g', 'DisplayName', sprintf('Minimumas (%.2f V)', min_val));

hold off;

% Ašių ir grafiko apipavidalinimas
title('b) Signalo reikšmės, viršijančios U_1 ribą');
xlabel('Laikas t, s', 'FontSize', 13, 'FontWeight', 'bold');
ylabel('Įtampa U, V', 'FontSize', 13, 'FontWeight', 'bold');
xlim([min(t), max(t)]);
ylim([0, max(u_pradinis)+1]);
legend('Location', 'southoutside');
grid on;