% startup script to process baseball data

source = 'Master.csv';
formatString = {'%q', '%f', '%f', '%f', '%C', '%C', '%C', '%f', ...
    '%f', '%f', '%C', '%C', '%C', '%q', '%q', '%q', '%f', '%f', ...
    '%C', '%C', '%D', '%D', '%C', '%C'};

Master = makeTable(source, formatString);
