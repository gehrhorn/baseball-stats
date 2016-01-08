% startup script to process baseball data

%% Master
% playerID       A unique code asssigned to each player.  The playerID links
%                  the data in this file with records in the other files.
% birthYear      Year player was born
% birthMonth     Month player was born
% birthDay       Day player was born
% birthCountry   Country where player was born
% birthState     State where player was born
% birthCity      City where player was born
% deathYear      Year player died
% deathMonth     Month player died
% deathDay       Day player died
% deathCountry   Country where player died
% deathState     State where player died
% deathCity      City where player died
% nameFirst      Player's first name
% nameLast       Player's last name
% nameGiven      Player's given name (typically first and middle)
% weight         Player's weight in pounds
% height         Player's height in inches
% bats           Player's batting hand (left, right, or both)         
% throws         Player's throwing hand (left or right)
% debut          Date that player made first major league appearance
% finalGame      Date that player made first major league appearance (blank if still active)
% retroID        ID used by retrosheet
% bbrefID        ID used by Baseball Reference website

source = 'data/lahman/Master.csv';
formatString = {'%C', '%u16', '%u8', '%u8', '%C', '%C', '%C', '%u16', ...
    '%u8', '%u8', '%C', '%C', '%C', '%C', '%C', '%C', '%u16', '%u8', ...
    '%C', '%C', '%D', '%D', '%C', '%C'};

Master = makeTable(source, formatString);
Names = Master(:, {'playerID', 'nameFirst', 'nameLast', 'nameGiven'});


%% Batting

% 2.2 Batting Table
% playerID       Player ID code
% yearID         Year
% stint          player's stint (order of appearances within a season)
% teamID         Team
% lgID           League
% G              Games
% AB             At Bats
% R              Runs
% H              Hits
% 2B             Doubles
% 3B             Triples
% HR             Homeruns
% RBI            Runs Batted In
% SB             Stolen Bases
% CS             Caught Stealing
% BB             Base on Balls
% SO             Strikeouts
% IBB            Intentional walks
% HBP            Hit by pitch
% SH             Sacrifice hits
% SF             Sacrifice flies
% GIDP           Grounded into double plays
 
source = 'data/lahman/Batting.csv';
formatString = {'%C', '%u16', '%u8', '%C', '%C', '%u16', '%u16', '%u16', ...
    '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', ...
    '%u16', '%u16', '%u16', '%u16', '%u16', '%u16'};
Batting = makeTable(source, formatString);

%% Pitching
% 2.3 Pitching table
% 
% playerID       Player ID code
% yearID         Year
% stint          player's stint (order of appearances within a season)
% teamID         Team
% lgID           League
% W              Wins
% L              Losses
% G              Games
% GS             Games Started
% CG             Complete Games 
% SHO            Shutouts
% SV             Saves
% IPOuts         Outs Pitched (innings pitched x 3)
% H              Hits
% ER             Earned Runs
% HR             Homeruns
% BB             Walks
% SO             Strikeouts
% BAOpp          Opponent's Batting Average
% ERA            Earned Run Average
% IBB            Intentional Walks
% WP             Wild Pitches
% HBP            Batters Hit By Pitch
% BK             Balks
% BFP            Batters faced by Pitcher
% GF             Games Finished
% R              Runs Allowed
% SH             Sacrifices by opposing batters
% SF             Sacrifice flies by opposing batters
% GIDP           Grounded into double plays by opposing batter

source = 'data/lahman/Pitching.csv';
formatString = {'%C', '%u16', '%u8', '%C', '%C', '%u16', '%u16', ...
    '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', ...
    '%u16', '%u16', '%u16', '%f32', '%f32', '%u16', '%u16', '%u16', ...
    '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', };
Pitching = makeTable(source, formatString);

%% Fielding
% 2.4 Fielding Table
% 
% playerID       Player ID code
% yearID         Year
% stint          player's stint (order of appearances within a season)
% teamID         Team
% lgID           League
% Pos            Position
% G              Games 
% GS             Games Started
% InnOuts        Time played in the field expressed as outs 
% PO             Putouts
% A              Assists
% E              Errors
% DP             Double Plays
% PB             Passed Balls (by catchers)
% WP             Wild Pitches (by catchers)
% SB             Opponent Stolen Bases (by catchers)
% CS             Opponents Caught Stealing (by catchers)
% ZR             Zone Rating

source = 'data/lahman/Fielding.csv';
formatString = {'%C', '%u16', '%u8', '%C', '%C', '%C', '%u16', '%u16', '%u16', ...
    '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16'};
Fielding = makeTable(source, formatString);

%% All Star
% 2.5  AllstarFull table
% 
% playerID       Player ID code
% YearID         Year
% gameNum        Game number (zero if only one All-Star game played that season)
% gameID         Retrosheet ID for the game idea
% teamID         Team
% lgID           League
% GP             1 if Played in the game
% startingPos    If player was game starter, the position played

source = 'data/lahman/AllstarFull.csv';
formatString = {'%C', '%u8', '%u8', '%C', '%C', '%C', '%u8', '%C'};
AllstarFull = makeTable(source, formatString);

%% Hall of Fame
% 2.6  HallOfFame table
% 
% playerID       Player ID code
% yearID         Year of ballot
% votedBy        Method by which player was voted upon
% ballots        Total ballots cast in that year
% needed         Number of votes needed for selection in that year
% votes          Total votes received
% inducted       Whether player was inducted by that vote or not (Y or N)
% category       Category in which candidate was honored
% needed_note    Explanation of qualifiers for special elections

source = 'data/lahman/HallOfFame.csv';
formatString = {'%C', '%u8', '%C', '%u16', '%u16', '%u16', '%C', '%C', '%C'};
HallOfFame = makeTable(source, formatString);

%% Managers

% 2.7  Managers table
%  
% playerID       Player ID Number
% yearID         Year
% teamID         Team
% lgID           League
% inseason       Managerial order.  Zero if the individual managed the team
%                  the entire year.  Otherwise denotes where the manager appeared
%                  in the managerial order (1 for first manager, 2 for second, etc.)
% G              Games managed
% W              Wins
% L              Losses
% rank           Team's final position in standings that year
% plyrMgr        Player Manager (denoted by 'Y')

source = 'data/lahman/Managers.csv';
formatString = {'%C', '%u8', '%C', '%C', '%u16', '%u16', '%u16', '%u16', '%u8', '%C'};
Managers = makeTable(source, formatString);

%% Teams
% 2.8  Teams table
% 
% yearID         Year
% lgID           League
% teamID         Team
% franchID       Franchise (links to TeamsFranchise table)
% divID          Team's division
% Rank           Position in final standings
% G              Games played
% GHome          Games played at home
% W              Wins
% L              Losses
% DivWin         Division Winner (Y or N)
% WCWin          Wild Card Winner (Y or N)
% LgWin          League Champion(Y or N)
% WSWin          World Series Winner (Y or N)
% R              Runs scored
% AB             At bats
% H              Hits by batters
% 2B             Doubles
% 3B             Triples
% HR             Homeruns by batters
% BB             Walks by batters
% SO             Strikeouts by batters
% SB             Stolen bases
% CS             Caught stealing
% HBP            Batters hit by pitch
% SF             Sacrifice flies
% RA             Opponents runs scored
% ER             Earned runs allowed
% ERA            Earned run average
% CG             Complete games
% SHO            Shutouts
% SV             Saves
% IPOuts         Outs Pitched (innings pitched x 3)
% HA             Hits allowed
% HRA            Homeruns allowed
% BBA            Walks allowed
% SOA            Strikeouts by pitchers
% E              Errors
% DP             Double Plays
% FP             Fielding  percentage
% name           Team's full name
% park           Name of team's home ballpark
% attendance     Home attendance total
% BPF            Three-year park factor for batters
% PPF            Three-year park factor for pitchers
% teamIDBR       Team ID used by Baseball Reference website
% teamIDlahman45 Team ID used in Lahman database version 4.5
% teamIDretro    Team ID used by Retrosheet

source = 'data/lahman/Teams.csv';
formatString = {'%u16', '%C', '%C', '%C', '%C', '%u8', '%u16', '%u16', ...
    '%u16', '%u16', '%C', '%C', '%C', '%C', '%u16', '%u16', '%u16', ...
    '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', ...
    '%u16', '%u16', '%u16', '%f32', '%u16', '%u16', '%u16', '%u16', ...
    '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%f32', '%C', '%C', ...
    '%u32', '%u16', '%u16', '%C', '%C', '%C'};
Teams = makeTable(source, formatString);

%% BattingPost
% 2.9  BattingPost table
% 
% yearID         Year
% round          Level of playoffs 
% playerID       Player ID code
% teamID         Team
% lgID           League
% G              Games
% AB             At Bats
% R              Runs
% H              Hits
% 2B             Doubles
% 3B             Triples
% HR             Homeruns
% RBI            Runs Batted In
% SB             Stolen Bases
% CS             Caught stealing
% BB             Base on Balls
% SO             Strikeouts
% IBB            Intentional walks
% HBP            Hit by pitch
% SH             Sacrifices
% SF             Sacrifice flies
% GIDP           Grounded into double plays

source = 'data/lahman/BattingPost.csv';
formatString = {'%u16', '%C', '%C', '%C', '%C', '%u16', '%u16', '%u16', '%u16', ...
    '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', ...
    '%u16', '%u16'};
BattingPost = makeTable(source, formatString);

%% PitchingPost
% 
% 2.10  PitchingPost table
% 
% playerID       Player ID code
% yearID         Year
% round          Level of playoffs 
% teamID         Team
% lgID           League
% W              Wins
% L              Losses
% G              Games
% GS             Games Started
% CG             Complete Games
% SHO             Shutouts 
% SV             Saves
% IPOuts         Outs Pitched (innings pitched x 3)
% H              Hits
% ER             Earned Runs
% HR             Homeruns
% BB             Walks
% SO             Strikeouts
% BAOpp          Opponents' batting average
% ERA            Earned Run Average
% IBB            Intentional Walks
% WP             Wild Pitches
% HBP            Batters Hit By Pitch
% BK             Balks
% BFP            Batters faced by Pitcher
% GF             Games Finished
% R              Runs Allowed
% SH             Sacrifice Hits allowed
% SF             Sacrifice Flies allowed
% GIDP           Grounded into Double Plays

source = 'data/lahman/PitchingPost.csv';
formatString = {'%C', '%u16', '%C', '%C', '%C', '%u16', '%u16', '%u16', ...
    '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', ...
    '%u16', '%u16', '%f32', '%f32', '%u16', '%u16', '%u16', '%u16', ...
    '%u16', '%u16', '%u16', '%u16', '%u16', '%u16'};
PitchingPost = makeTable(source, formatString);

%% TeamFranchises
% 
% 2.11 TeamsFranchises table
% 
% franchID       Franchise ID
% franchName     Franchise name
% active         Whetehr team is currently active (Y or N)
% NAassoc        ID of National Association team franchise played as

source = 'data/lahman/TeamsFranchises.csv';
formatString = {'%C', '%C', '%C', '%C'};
TeamsFranchises = makeTable(source, formatString);

%% FieldingOF
% 2.12 FieldingOF table
% 
% playerID       Player ID code
% yearID         Year
% stint          player's stint (order of appearances within a season)
% Glf            Games played in left field
% Gcf            Games played in center field
% Grf            Games played in right field

source = 'data/lahman/FieldingOF.csv';
formatString = {'%C', '%u16', '%u16', '%u16', '%u16', '%u16'};
FieldingOF = makeTable(source, formatString);

%% ManagersHalf
% 2.13 ManagersHalf table
% 
% playerID       Manager ID code
% yearID         Year
% teamID         Team
% lgID           League
% inseason       Managerial order.  One if the individual managed the team
%                  the entire year.  Otherwise denotes where the manager appeared
%                  in the managerial order (1 for first manager, 2 for second, etc.)
% half           First or second half of season
% G              Games managed
% W              Wins
% L              Losses
% rank           Team's position in standings for the half

source = 'data/lahman/ManagersHalf.csv';
formatString = {'%C', '%u16', '%C', '%C', '%u8', '%C', '%u16', '%u16', '%u16', '%u8'};
ManagersHalf = makeTable(source, formatString);

%% TeamsHalf

% 2.14 TeamsHalf table

% yearID         Year
% lgID           League
% teamID         Team
% half           First or second half of season
% divID          Division
% DivWin         Won Division (Y or N)
% rank           Team's position in standings for the half
% G              Games played
% W              Wins
% L              Losses

source = 'data/lahman/TeamsHalf.csv';
formatString = {'%u16', '%C', '%C', '%u8', '%C', '%C', '%u8', '%u16', '%u16', '%u16'};
TeamsHalf = makeTable(source, formatString);

%% Salaries
% 
% 2.15 Salaries table
% 
% yearID         Year
% teamID         Team
% lgID           League
% playerID       Player ID code
% salary         Salary

source = 'data/lahman/Salaries.csv';
formatString = {'%u16', '%C', '%C', '%C', '%d'};
Salaries = makeTable(source, formatString);

%% SeriesPost

% 2.16 SeriesPost table
% 
% yearID         Year
% round          Level of playoffs 
% teamIDwinner   Team ID of the team that won the series
% lgIDwinner     League ID of the team that won the series
% teamIDloser    Team ID of the team that lost the series
% lgIDloser      League ID of the team that lost the series 
% wins           Wins by team that won the series
% losses         Losses by team that won the series
% ties           Tie games

source = 'data/lahman/SeriesPost.csv';
formatString = {'%u16', '%C', '%C', '%C', '%C', '%C', '%u16', '%u16', '%u16'};
SeriesPost = makeTable(source, formatString);

%% AwardsManagers
% 
% 2.17 AwardsManagers table
% 
% playerID       Manager ID code
% awardID        Name of award won
% yearID         Year
% lgID           League
% tie            Award was a tie (Y or N)
% notes          Notes about the award

source = 'data/lahman/AwardsManagers.csv';
formatString = {'%C', '%C', '%u16', '%C', '%C', '%C'};
AwardsManagers = makeTable(source, formatString);

%% AwardsPlayers

% 2.18 AwardsPlayers table
% 
% playerID       Player ID code
% awardID        Name of award won
% yearID         Year
% lgID           League
% tie            Award was a tie (Y or N)
% notes          Notes about the award

source = 'data/lahman/AwardsPlayers.csv';
formatString = {'%C', '%C', '%u16', '%C', '%C', '%C'};
AwardsPlayers = makeTable(source, formatString);

%% AwardsShareManagers

% 2.19 AwardsShareManagers table
% 
% awardID        name of award votes were received for
% yearID         Year
% lgID           League
% playerID       Manager ID code
% pointsWon      Number of points received
% pointsMax      Maximum numner of points possible
% votesFirst     Number of first place votes

source = 'data/lahman/AwardsShareManagers.csv';
formatString = {'%C', '%u16', '%C', '%C', '%u16', '%u16', '%u16'};
AwardsShareManagers = makeTable(source, formatString);

%% AwardsSharePlayers

% 2.20 AwardsSharePlayers table
% 
% awardID        name of award votes were received for
% yearID         Year
% lgID           League
% playerID       Player ID code
% pointsWon      Number of points received
% pointsMax      Maximum numner of points possible
% votesFirst     Number of first place votes

source = 'data/lahman/AwardsSharePlayers.csv';
formatString = {'%C', '%u16', '%C', '%C', '%u16', '%u16', '%u16'};
AwardsSharePlayers = makeTable(source, formatString);

%% FieldingPost

% 2.21 FieldingPost table
% 
% playerID       Player ID code
% yearID         Year
% teamID         Team
% lgID           League
% round          Level of playoffs 
% Pos            Position
% G              Games 
% GS             Games Started
% InnOuts        Time played in the field expressed as outs 
% PO             Putouts
% A              Assists
% E              Errors
% DP             Double Plays
% TP             Triple Plays
% PB             Passed Balls
% SB             Stolen Bases allowed (by catcher)
% CS             Caught Stealing (by catcher)

source = 'data/lahman/FieldingPost.csv';
formatString = {'%C', '%u16', '%C', '%C', '%C', '%C', '%u16', '%u16', ...
    '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16'};
FieldingPost = makeTable(source, formatString);

%% Apperances
% 2.22 Appearances table
% 
% yearID         Year
% teamID         Team
% lgID           League
% playerID       Player ID code
% G_all          Total games played
% GS             Games started
% G_batting      Games in which player batted
% G_defense      Games in which player appeared on defense
% G_p            Games as pitcher
% G_c            Games as catcher
% G_1b           Games as firstbaseman
% G_2b           Games as secondbaseman
% G_3b           Games as thirdbaseman
% G_ss           Games as shortstop
% G_lf           Games as leftfielder
% G_cf           Games as centerfielder
% G_rf           Games as right fielder
% G_of           Games as outfielder
% G_dh           Games as designated hitter
% G_ph           Games as pinch hitter
% G_pr           Games as pinch runner
source = 'data/lahman/Appearances.csv';
formatString = {'%u16', '%C', '%C', '%C', '%u16', '%u16', '%u16', '%u16', '%u16', ...
    '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', '%u16', ...
    '%u16'};
Appearances = makeTable(source, formatString);

%% Schools
% 2.23 Schools table
% schoolID       school ID code
% schoolName     school name
% schoolCity     city where school is located
% schoolState    state where school's city is located
% schoolNick     nickname for school's baseball team

source = 'data/lahman/Schools.csv';
formatString = {'%C', '%C', '%C', '%C', '%C'};
Schools = makeTable(source, formatString);

%% CollegePlaying

% 2.24 CollegePlaying table
% playerid       Player ID code
% schoolID       school ID code
% year           year

source = 'data/lahman/CollegePlaying.csv';
formatString = {'%C', '%C', '%u16'};
CollegePlaying = makeTable(source, formatString);

%% Fangraphs wOBA and FIP data

source = 'data/FanGraphs/FanGraphs wOBA and FIP Constants.csv';
formatString = {'%u16', '%f32', '%f32', '%f32', '%f32', '%f32', '%f32', '%f32', '%f32', ...
    '%f32', '%f32', '%f32', '%f32', '%f32'};
wOBAandFIP = makeTable(source, formatString);
wOBAandFIP.Properties.VariableNames{'Season'} = 'yearID';

%% Add Fangraphs SABR (wOBA) hitting stats to the Batting and BattingPost
% tables
Batting.wOBA = calculateWOBA(Batting, wOBAandFIP);
BattingPost.wOBA = calculateWOBA(BattingPost, wOBAandFIP);
Pitching.FIP = calculateFIP(Pitching, wOBAandFIP);
PitchingPost.FIP = calculateFIP(PitchingPost, wOBAandFIP);

%% Add wRAA to Batting and Batting Post
Batting.wRAA = calculateWRAA(Batting, wOBAandFIP);
BattingPost.wRAA = calculateWRAA(BattingPost, wOBAandFIP);

%% Add wRC to Batting and BattingPost


Batting.wRC = calculateWRC(Batting, wOBAandFIP);
BattingPost.wRC = calculateWRC(BattingPost, wOBAandFIP);

%% Add wRC to Batting and BattingPost

Batting.wRC = calculateWRC(Batting, wOBAandFIP);
BattingPost.wRC = calculateWRC(BattingPost, wOBAandFIP);





%% Save data (literally save, not baseball save)
clearvars source formatString;
save('baseballstats.mat', '-v7');
