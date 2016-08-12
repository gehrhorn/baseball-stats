function [ wOBA ] = calculateWOBA( B, W )
%calculateWOBA calculate wOBA for a table of batting data
%   Detailed explanation goes here

T = join(B, W);
battingsuccess = T.wBB .* double(T.BB - T.IBB) + T.wHBP .* double(T.HBP) + ...
    T.w1B .* double(T.H - T.x2B - T.x3B - T.HR) + ...
    T.w2B .* double(T.x2B) + T.w3B .* double(T.x3B) + T.wHR .* double(T.HR);
battingattempts = double(T.AB + T.BB - T.IBB + T.SF + T.HBP);
wOBA = battingsuccess ./ battingattempts;

end

