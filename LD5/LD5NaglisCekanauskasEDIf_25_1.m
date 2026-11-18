% Naglis Čekanauskas EDIf-25/1 2026-09-28 (7 variantas)
clc; clear; close all;
%% 1 Užduotis: Celių masyvai

% a) Asmeninis celių masyvas:
% [vardas, gimimo data, tel. numeris, 2 paskutinių semestrų pažymių matrica (2 eilutės)]
as = {'Vardenis', '2003-04-12', '+37060012345', [8, 9, 10, 7; 9, 10, 8, 9]};

% b) Draugo celių masyvas
draugas = {'Pavardenis', '2003-08-25', '+37061198765', [7, 8, 9, 6; 8, 9, 7, 10]};

% Apjungiame abu masyvus į vieną bendrą (2x4 celių matricą)
bendra_cele = [as; draugas];

% Rezultato grafinis pavaizdavimas
figure('Name', 'Celių masyvo grafinis vaizdavimas');
cellplot(bendra_cele);
title('Celių masyvo struktūra (cellplot)');

% --- Nurodytų funkcijų demonstracija ---
disp('=== 1 UŽDUOTIES FUNKCIJŲ REZULTATAI ===');

% cell – tuščio celių masyvo sukūrimas
nauja_cele = cell(2, 3);

% length – celių masyvo ilgis (elementų skaičius didžiausioje dimensijoje)
ilgis = length(as);
disp(['Masyvo ilgis (length): ', num2str(ilgis)]);

% isempty – patikrinimas, ar celių masyvas tuščias (0 - ne, 1 - taip)
ar_tuscias = isempty(as);
disp(['Ar masyvas tuščias (isempty): ', num2str(ar_tuscias)]);

% cell2mat – celės turinio konvertavimas į įprastą matricą
pazymiai = cell2mat(as(4));
disp('Pažymių matrica (cell2mat):');
disp(pazymiai);

% isreal – tikrinimas, ar reikšmės yra realieji skaičiai
ar_realus = isreal(pazymiai);
disp(['Ar pažymiai yra realieji skaičiai (isreal): ', num2str(ar_realus)]);

% cellfun – funkcijos taikymas kiekvienam celės elementui (pvz., elementų ilgiui nustatyti)
elementu_ilgiai = cellfun(@length, as);
disp('Kiekvieno elemento dydis/ilgis (cellfun):');
disp(elementu_ilgiai);

% isclass / isa – duomenų tipo tikrinimas
% (Pastaba: šiuolaikiniame MATLAB vietoje pasenusios 'isclass' naudojama 'isa')
ar_tekstas = isa(as{1}, 'char');
disp(['Ar pirmas elementas yra tekstas char (isa): ', num2str(ar_tekstas)]);
%% 2 Užduotis: Srauto valdymo konstruktoriai
clc; clear;

istorija = []; % Vektorius anksčiau įvestoms m reikšmėms kaupti

while true
    % Reikšmės nuskaitymas iš vartotojo
    m = input('Įveskite kintamojo m reikšmę: ');

    % Tikrinama, ar ši reikšmė jau buvo įvesta anksčiau
    if any(istorija == m)
        disp(['Kintamojo reikšmė m = ', num2str(m), ' buvo įvesta antrą kartą.']);
        disp('Programa stabdoma.');
        break;
    end

    % Naujos reikšmės išsaugojimas istorijoje
    istorija = [istorija, m];

    % Šakotosios funkcijos f(m) apskaičiavimas
    if m < 0
        fm = m^2 + 1;
    elseif m == 0
        fm = (m + 1) / 2;
    else % m > 0
        fm = m^2 - 1;
    end

    % Rezultato išvedimas į komandinį langą
    disp(['Apskaičiuota reikšmė: f(', num2str(m), ') = ', num2str(fm)]);
    disp('----------------------------------------');
end
%% Papildoma užduotis (4 balai) - 7 variantas
clc; clear; close all;

% Tušti masyvai sugeneruotiems skaičiams kaupti
masyvas1 = [];
masyvas2 = [];

while true
    % Generuojami du atsitiktiniai skaičiai pagal užduoties formules
    sk1 = round(rand * 7);
    sk2 = round(rand * 9);

    % Skaičiai pridedami į masyvų pabaigą
    masyvas1 = [masyvas1, sk1];
    masyvas2 = [masyvas2, sk2];

    % Tikrinama, ar tuo pačiu metu abiejose išraiškose sugeneruotas tas pats skaičius
    if sk1 == sk2
        disp(['Ciklas nutrauktas ', num2str(length(masyvas1)), '-oje iteracijoje.']);
        disp(['Sutapęs skaičius: ', num2str(sk1)]);
        break;
    end
end

% Sugeneruotų skaičių kitimo atvaizdavimas viename grafike dviem kreivėmis
figure('Name', 'Papildoma užduotis: skaičių kitimas');
plot(masyvas1, '-o', 'LineWidth', 1.5);
hold on;
plot(masyvas2, '-s', 'LineWidth', 1.5);
hold off;

grid on;
xlabel('Iteracijos (žingsnio) numeris');
ylabel('Sugeneruota reikšmė');
title('Atsitiktinių skaičių kitimas iki pirmojo sutapimo');
legend('round(rand*7)', 'round(rand*9)', 'Location', 'best');