% Naglis Čekanauskas EDIf-25/1 2026-09-28 (7 variantas)
clc; clear; close all;
%% a) Užduotis
% Funkcija z(r) = exp(r^2), kur r = sqrt(x^2 + y^2)
% x ir y intervale nuo -1 iki 1

[X_a, Y_a] = meshgrid(-1:0.05:1, -1:0.05:1);
R_a = sqrt(X_a.^2 + Y_a.^2);
Z_a = exp(R_a.^2);

figure('Name', 'Užduotis 1a', 'NumberTitle', 'off');
surf(X_a, Y_a, Z_a);

colormap('jet');
shading interp;
grid on;

view(30, 30);

% Pavadinimai ir ašys
title('Paviršiaus grafikas z(r) = e^{r^2}');
xlabel('x ašis');
ylabel('y ašis');
zlabel('z(r)');


%% b) Užduotis
% Funkcija f(x, y) = 1 - 2*x^2 - 3*y^2
% x ir y intervale nuo -2 iki 1

[X_b, Y_b] = meshgrid(-2:0.05:1, -2:0.05:1);
Z_b = 1 - 2.*X_b.^2 - 3.*Y_b.^2;

figure('Name', 'Užduotis 1b', 'NumberTitle', 'off');
surf(X_b, Y_b, Z_b);

% Grafiko spalva ir šešėliavimo nustatymai
colormap('parula');
shading interp;
grid on;

% Vaizdo kampo nustatymas (45 laipsnių kampu)
view(45, 45);

% Pavadinimai ir ašys
title('Paviršiaus grafikas f(x, y) = 1 - 2x^2 - 3y^2');
xlabel('x ašis');
ylabel('y ašis');
zlabel('f(x, y)');
%% Papildoma užduotis (7 variantas)

% Koordinačių tinklo sudarymas
[X, Y] = meshgrid(-2:0.1:2, -2:0.1:2);

% Lygties z(x,y) = 1 - (x^2 + y^2) apskaičiavimas
Z = 1 - (X.^2 + Y.^2);

% Sukuriamas grafiko langas
figure('Name', 'Papildoma užduotis: shading savybės', 'NumberTitle', 'off');

% 1. Shading faceted (standartinis su tinklelio linijomis)
subplot(1, 3, 1);
surf(X, Y, Z);
shading faceted;
title('shading faceted');
xlabel('x'); ylabel('y'); zlabel('z');
grid on;

%2. Shading flat (vientisa spalva langeliuose, be tinklelio linijų)
subplot(1, 3, 2);
surf(X, Y, Z);
shading flat;
title('shading flat');
xlabel('x'); ylabel('y'); zlabel('z');
grid on;

% 3. Shading interp (glotnus, interpoliuotas spalvų perėjimas)
subplot(1, 3, 3);
surf(X, Y, Z);
shading interp;
title('shading interp');
xlabel('x'); ylabel('y'); zlabel('z');
grid on;

% Bendras grafiko pavadinimas
sgtitle('Funkcijos z(x,y) = 1 - (x^2 + y^2) vaizdavimas naudojant skirtingus shading argumentus');