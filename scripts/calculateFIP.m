function [ FIP ] = calculateFIP( P, W )
%calculateFIP Calculate FIP for pitching
%   Detailed explanation goes here
    T = join(P, W, 'RightVariables', 'cFIP');
    FIP = T.cFIP + double(13 * T.HR + 3 * (T.BB + P.HBP) - 2 * T.SO) ./ (double(T.IPouts) / 3);
    
end

