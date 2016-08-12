function [ T ] = makeTable( stats, formatString )
%makeTable
%   Reads data files and adds them to a table

ds = datastore(stats, 'TreatAsMissing', 'NA');
ds.TextscanFormats = formatString;
T = readall(ds);

end

