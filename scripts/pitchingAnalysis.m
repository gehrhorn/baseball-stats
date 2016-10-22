load('baseballstats.mat', 'Pitching', 'PitchingPost', 'Names', 'Salaries');
%% 
% 
% 
% Let's find the top ten pitchers in strikeout rate (should be high), walk 
% rate (should be low), and home run rate (should be very low)

P = Pitching(Pitching.BFP ~= 0, :);
Psummary = varfun(@sum, P, 'InputVariables', {'SO', 'BB', 'BFP', 'HR'}, ...
    'GroupingVariables', 'playerID');
Psummary = Psummary(Psummary.sum_BFP >= 500,:);
Psummary.SOrate = double(Psummary.sum_SO) ./ double(Psummary.sum_BFP);
Psummary.BBrate = double(Psummary.sum_BB) ./ double(Psummary.sum_BFP);
Psummary.HRrate = double(Psummary.sum_HR) ./ double(Psummary.sum_BFP);
%% 
% Strikeout rate

SOleaders = sortrows(Psummary, 'SOrate', 'descend');
BBleaders = sortrows(Psummary, 'BBrate');
HRleaders = sortrows(Psummary, 'HRrate');
SOleaders(1:10,:)
BBleaders(1:10,:)
HRleaders(1:10,:)