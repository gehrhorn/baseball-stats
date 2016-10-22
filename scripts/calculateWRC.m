function [ wRC ] = calculateWRC( B, W )
%calculateWRC Calculate wRC
%   Detailed explanation goes here
W.Properties.VariableNames{'wOBA'} = 'lgWOBA';
T = join(B, W, 'RightVariables', {'lgWOBA', 'wOBAScale', 'R_PA'});
wRC = (((T.wOBA - T.lgWOBA) ./ T.wOBAScale)+T.R_PA) .* ...
    double(calculatePA(T));

end

