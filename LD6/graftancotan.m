function varargout = graftancotan(x)
% GRAFTANCOTAN Apskaičiuoja vektoriaus-eilutės tangentą ir kotangentą.
%
%   graftancotan(x)              - nubraižo tan(x) ir cot(x) grafikus
%   rez = graftancotan(x)        - grąžina matricą [tan(x); cot(x)]
%   [ytan, ycot] = graftancotan(x) - grąžina tan(x) ir cot(x) atskirai
%
%   Įėjimo kintamieji:
%       x - vektorius-eilutė
%
%   Pavyzdys:
%       graftancotan(-pi:0.01:pi)

% Užtikriname, kad x būtų vektorius-eilutė
if ~isrow(x)
    x = x(:)';
end

% Tangento ir kotangento skaičiavimas
y_tan = tan(x);
y_cot = cot(x);

if nargout == 0
    % Variantas be grąžinamų reikšmių: braižomi grafikai
    figure('Name', 'Tangento ir Kotangento grafikai', 'NumberTitle', 'off');

    subplot(2, 1, 1);
    plot(x, y_tan, 'b-', 'LineWidth', 1.5);
    grid on;
    title('Funkcija tan(x)');
    xlabel('x'); ylabel('tan(x)');
    ylim([-10, 10]); % Apribojimas ties asimptotėmis geresniam vaizdui

    subplot(2, 1, 2);
    plot(x, y_cot, 'r--', 'LineWidth', 1.5);
    grid on;
    title('Funkcija cot(x)');
    xlabel('x'); ylabel('cot(x)');
    ylim([-10, 10]); % Apribojimas ties asimptotėmis geresniam vaizdui

elseif nargout == 1
    % 1 grąžinamas argumentas: abu rezultatai vienoje matricoje (2 eilutės)
    varargout{1} = [y_tan; y_cot];

else
    % 2 grąžinami argumentai: tangentas ir kotangentas atskirai
    varargout{1} = y_tan;
    varargout{2} = y_cot;
end
end
