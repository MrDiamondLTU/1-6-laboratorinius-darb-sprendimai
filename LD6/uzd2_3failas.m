clear; clc; close all;

% Deklaruojame globalius kintamuosius
global x y

% Sugeneruojamas vektorius nuo 2*pi iki -2*pi su žingsniu -0.1
x = 2*pi : -0.1 : -2*pi;

% Sukuriamas tokio pat ilgio nulinis vektorius y
y = zeros(size(x));

% Iškviečiamos abi sukurtos funkcijos
funkcija_teigiama;
funkcija_neigiama;

% Demonstruojame, kad kintamieji yra globalūs
disp('--- Globalūs kintamieji atmintyje ---');
whos global

% Grafiko braižymas:

figure;
plot(x, y, '-.k+', 'LineWidth', 1.2, 'MarkerSize', 6);
grid on;
title('Funkcijos y(x) grafikas');
xlabel('x');
ylabel('y');