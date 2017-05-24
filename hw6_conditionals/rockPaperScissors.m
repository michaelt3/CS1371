function [out] = rockPaperScissors(str1 , str2)
[p1m1,p1m2] = strtok(str1, ',');
[p1m2,p1m3] = strtok(p1m2, ',');
p1m3(1) = [];

[p2m1,p2m2] = strtok(str2, ',');
[p2m2,p2m3] = strtok(p2m2, ',');
p2m3(1) = [];

if strcmp(p1m1,'Rock')
    if strcmp(p2m1, 'Rock')
        turn1 = [];
    elseif strcmp(p2m1, 'Paper')
        turn1 = false;
    elseif strcmp(p2m1, 'Scissors')
        turn1 = true;
    end
end

if strcmp(p1m1,'Paper')
    if strcmp(p2m1, 'Rock')
        turn1 = true;
    elseif strcmp(p2m1, 'Paper')
        turn1 = [];
    elseif strcmp(p2m1, 'Scissors')
        turn1 = false;
    end
end

if strcmp(p1m1,'Scissors')
    if strcmp(p2m1, 'Rock')
        turn1 = false;
    elseif strcmp(p2m1, 'Paper')
        turn1 = true;
    elseif strcmp(p2m1, 'Scissors')
        turn1 = [];
    end
end

if strcmp(p1m2,'Rock')
    if strcmp(p2m2, 'Rock')
        turn2 = [];
    elseif strcmp(p2m2, 'Paper')
        turn2 = false;
    elseif strcmp(p2m2, 'Scissors')
        turn2 = true;
    end
end

if strcmp(p1m2,'Paper')
    if strcmp(p2m2, 'Rock')
        turn2 = true;
    elseif strcmp(p2m2, 'Paper')
        turn2 = [];
    elseif strcmp(p2m2, 'Scissors')
        turn2 = false;
    end
end

if strcmp(p1m2,'Scissors')
    if strcmp(p2m2, 'Rock')
        turn2 = false;
    elseif strcmp(p2m2, 'Paper')
        turn2 = true;
    elseif strcmp(p2m2, 'Scissors')
        turn2 = [];
    end
end

if strcmp(p1m3,'Rock')
    if strcmp(p2m3, 'Rock')
        turn3 = [];
    elseif strcmp(p2m3, 'Paper')
        turn3 = false;
    elseif strcmp(p2m3, 'Scissors')
        turn3 = true;
    end
end

if strcmp(p1m3,'Paper')
    if strcmp(p2m3, 'Rock')
        turn3 = true;
    elseif strcmp(p2m3, 'Paper')
        turn3 = [];
    elseif strcmp(p2m3, 'Scissors')
        turn3 = false;
    end
end

if strcmp(p1m3,'Scissors')
    if strcmp(p2m3, 'Rock')
        turn3 = false;
    elseif strcmp(p2m3, 'Paper')
        turn3 = true;
    elseif strcmp(p2m3, 'Scissors')
        turn3 = [];
    end
end

A = [turn1 turn2 turn3];
if length(A) == 3
    if sum(A) == 0
        out = 'Player 2 wins!';
    end

    if sum(A) == 1
        out = 'Player 2 wins!';
    end

    if sum(A) >= 2
        out = 'Player 1 wins!';
    end
end
if length(A) == 2
    if sum(A) == 0
        out = 'Player 2 wins!';
    end

    if sum(A) == 1
        out = 'Keep Playing!';
    end

    if sum(A) == 2
        out = 'Player 1 wins!';
    end
end

if length(A) == 1
    out = 'Keep Playing!';
end
% Inputs (1):  - (char) A string containing the first player's moves
%              - (char) A string containing the second player's moves
%
% Outputs (1): - (char) A string that says who won the game
%
% Function Description:
%   The age old game of Rock-Paper-Scissors is making its way into the
%   world of MATLAB!
%   This is a hand game played by two people, where players simultaneously
%   form one of three shapes with their hand, and the three shapes form a
%   triangle such that someone always wins! (Unless both players play the
%   same thing...)
%   Scissors beats Paper, Paper beats Rock, Rock beats Scissors:
% 
%                     Scissors ----->  Paper
%                        ^               /
%                         \             /
%                          \           /
%                           \         /
%                            \       /
%                             Rock <-
%
%   Since playing only one round of this game isn't quite thrilling enough,
%   this game will be played best two out of three. The first input will
%   contain the first players moves for each respective round in the format
%   'Rock,Paper,Scissors', or any combination of the three. 'Rock' would be
%   the players first move, Paper the second, and so forth. The same format
%   applies to the second input (the second player's moves).
%
%   To win the overall game (where the game consists of three rounds), a
%   player must win two of those three rounds. Due to the possibility of
%   ties, it is not guaranteed that there will always be a winner. (For
%   example, if the two players tied in two of the rounds, then no one has
%   won the game yet, because neither player has reached two wins.)
%
%   Here is an example match:
%      Player1 -> 'Rock,Scissors,Scissors'
%      Player2 -> 'Paper,Rock,Scissors'
%
%      Round 1: Player 2 beats Player 1, because Paper beats Rock.
%      Round 2: Player 2 beats Player 1, because Rock beats Scissors.
%      Round 3: both players selected the same thing and is a draw.
% 
%      As a result, Player 2 has two wins, and Player 1 has none. Player 2
%      has reached the two wins required to win the game, and so your
%      function would output 'Player 2 wins!'.
%
%   The output of your function should always be one of the following:
%      - 'Player 1 wins!'   if Player 1 wins the game
%      - 'Player 2 wins!'   if Player 2 wins the game
%      - 'Keep Playing!'    if neither player has won 2 rounds yet
%
% Notes:
%   - The first letter in each move will always be capital
%   - The character separating a player's moves in the input will always be
%     a comma (and no space).
%   - The output string must match exactly to one of the above outputs
%     (case matters!)
%   - Each input will contain exactly three moves.
%
% Hints:
%   - Your code should be pretty repetitive, so take advantage of copy and
%     paste.
%
% Test Cases:
%
%   [winner1] = rockPaperScissors('Rock,Scissors,Scissors', ...
%                                 'Paper,Rock,Scissors')
%               winner1 => 'Player 2 Wins!'
% 
%   [winner2] = rockPaperScissors('Paper,Paper,Rock', ...
%                                 'Rock,Scissors,Rock')
%               winner2 => 'Keep Playing!'
% 
%   [winner3] = rockPaperScissors('Paper,Paper,Scissors', ...
%                                 'Scissors,Rock,Paper')
%               winner3 => 'Player 1 Wins!'