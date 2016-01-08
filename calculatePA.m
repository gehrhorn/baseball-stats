function [ PA] = calculatePA( T )
%CALCULATEPA Calculate Plate Apperances
%   the base data set doesn't have a PA data field, but we need it a lot
PA = T.AB + T.BB + T.HBP + T.SH + T.SF;

end

