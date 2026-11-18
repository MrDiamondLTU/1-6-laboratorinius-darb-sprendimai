function funkcija_teigiama
% FUNKCIJA_TEIGIAMA Apskaičiuoja y = sin(x), kai x >= 0.
%   Duomenys perduodami tik per globalius kintamuosius x ir y.
global x y
idx = (x >= 0);
y(idx) = sin(x(idx));
end
