function [ N ] = getPlayerName( T )
%getPlayerName Return data on player names

    load('baseballstats.mat', 'Master');
    [~, idx] = ismember(T, Master.playerID);
    N = Master(idx, {'nameFirst' 'nameLast'});
    

end

