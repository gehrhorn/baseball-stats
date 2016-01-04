function [ N ] = getPlayerName( T )
%getPlayerName Return data on player names

    load('baseballstats.mat', 'Names');
    [~, idx] = ismember(T, Names.playerID);
    N = Names(idx, {'nameFirst' 'nameLast'});
    

end

