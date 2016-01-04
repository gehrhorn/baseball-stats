function [ names ] = getPlayerName( T, N )
%getPlayerName Return data on player names

    [~, idx] = ismember(T, N.playerID);
    names = N(idx, {'nameFirst' 'nameLast'});
    

end

