function [ P ] = calculateFIP( P )
%calculateFIP Calculate FIP for pitching
%   Detailed explanation goes here
    P = P.cFIP + double(13 * P.HR + 3 * (P.BB + P.HBP) - 2 * P.SO) ./ (double(P.IPouts) / 3);

end

