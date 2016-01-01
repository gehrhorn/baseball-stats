function [ B ] = calculateWOBA( B )
%calculateWOBA calculate wOBA for a table of batting data
%   Detailed explanation goes here
battingsuccess = B.wBB .* double(B.BB - B.IBB) + B.wHBP .* double(B.HBP) + ...
    B.w1B .* double(B.H - B.x2B - B.x3B - B.HR) + ...
    B.w2B .* double(B.x2B) + B.w3B .* double(B.x3B) + B.wHR .* double(B.HR);
battingattempts = double(B.AB + B.BB - B.IBB + B.SF + B.HBP);
B.wOBA = battingsuccess ./ battingattempts;
B;

end

