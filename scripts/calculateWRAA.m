function [ wRAA ] = calculateWRAA( B, W )
%calculateWRAA Summary of this function goes here
%   Detailed explanation goes here
    W.Properties.VariableNames{'wOBA'} = 'lgWOBA';




    T = join(B, W, 'RightVariables', {'lgWOBA', 'wOBAScale'});
    wRAA = ((T.wOBA - T.lgWOBA) ./ T.wOBAScale) .* ...
        double(calculatePA(T));








end

