function [ T ] = makeTable( stats, formatString )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

ds = datastore(stats, 'TreatAsMissing', 'NA');
ds.TextscanFormats = formatString;
T = readall(ds);

end

