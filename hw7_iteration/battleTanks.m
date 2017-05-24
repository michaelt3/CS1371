function [out1, out2, out3] = battleTanks(in1, in2, in3)
original = in3;
letter = in3=='A'|in3=='B'|in3=='C'|in3=='D'|in3=='E'|in3=='F'|in3=='G'|in3=='H';
number = in3=='1'|in3=='2'|in3=='3'|in3=='4'|in3=='5'|in3=='6'|in3=='7'|in3=='8';

in3(number) = in3(letter);
in3(letter) = original(number);
in3(in3 == 'A') = '1';
in3(in3 == 'B') = '2';
in3(in3 == 'C') = '3';
in3(in3 == 'D') = '4';
in3(in3 == 'E') = '5';
in3(in3 == 'F') = '6';
in3(in3 == 'G') = '7';
in3(in3 == 'H') = '8';

a = 1;
counter1 = 0;       %number of hits that player1 got
counter2 = 0;       %number of hits that player2 got
hits1 = [];
hits2 = [];

p1counter1 = 0;
p1counter2 = 0;
p1counter3 = 0;
p1counter4 = 0;
order1 = [];

p2counter1 = 0;
p2counter2 = 0;
p2counter3 = 0;
p2counter4 = 0;
order2 = [];

while length(in3) > 0
    [move,in3] = strtok(in3,' ');
    row = move(1);
    col = move(2);
    if mod(a,2) == 1
        test = in2(str2num(row),str2num(col)) ~= 0;
        if test == true
            hits1 = [hits1 in2(str2num(row),str2num(col))];
            counter1 = counter1 + 1;
            if in2(str2num(row),str2num(col)) == 1
                p1counter1 = p1counter1 + 1;
                if p1counter1 == 2
                    order1 = [order1 1];
                end
            elseif in2(str2num(row),str2num(col)) == 2
                p1counter2 = p1counter2 + 1;
                if p1counter2 == 3
                    order1 = [order1 2];
                end
            elseif in2(str2num(row),str2num(col)) == 3
                p1counter3 = p1counter3 + 1;
                if p1counter3 == 4
                    order1 = [order1 3];
                end
            elseif in2(str2num(row),str2num(col)) == 4
                p1counter4 = p1counter4 + 1;  
                if p1counter4 == 6
                    order1 = [order1 4];
                end
            end
            in2(str2num(row),str2num(col)) = 0;
        end
        
    elseif mod(a,2) == 0
        test = in1(str2num(row),str2num(col)) ~= 0;
        if test == true
            hits2 = [hits2 in1(str2num(row),str2num(col))];
            counter2 = counter2 + 1;
            if in1(str2num(row),str2num(col)) == 1
                p2counter1 = p2counter1 + 1;
                if p2counter1 == 2
                    order2 = [order2 1];
                end
            elseif in1(str2num(row),str2num(col)) == 2
                p2counter2 = p2counter2 + 1;
                if p2counter2 == 3
                    order2 = [order2 2];
                end
            elseif in1(str2num(row),str2num(col)) == 3
                p2counter3 = p2counter3 + 1;
                if p2counter3 == 4
                    order2 = [order2 3];
                end
            elseif in1(str2num(row),str2num(col)) == 4
                p2counter4 = p2counter4 + 1;  
                if p2counter4 == 6
                    order2 = [order2 4];
                end
            end
            in1(str2num(row),str2num(col)) = 0;
        end
    end
    a = a + 1;   
end

if counter1 > counter2
    out1 = in1
    out2 = hits1
    out3 = order1
elseif counter2 > counter1
    out1 = in2
    out2 = hits2
    out3 = order2
elseif counter1 == counter2
    out1 = in1
    out2 = in2
    out3 = 'Cease Fire!'
end
% Inputs (3):  - (double) An array of Player 1's field of tanks
%              - (double) An array of Player 2's field of tanks
%              - (string) A string detailing the battle (ex: 'A7 B4 C3')
%
% Outputs (3): - (double) An 8x8 array of the victorious side in the battle.
%                         (Or an array of the first players's field.)
%              - (double) A vector detailing the winning players's hits, in
%                         order.
%                         (Or an array of the second player's field.)
%              - (varies) A vector detailing what tanks the winning player
%                         destroyed, in order.
%                         (Or the string 'Cease Fire!')
%
% Function Description:
%  When you were little, you may have heard of the game Battleship (if not
%  then see the Hints section of this problem statement for a linked
%  description). Well unfortunately, ships are slow, boring and not nearly
%  as cool as tanks. Now you get to play with tanks, because you're old
%  enough to make your own choices and tanks are awesome. Unfortunately, we
%  don’t have the budget to give you real tanks for this homework
%  assignment, so instead you get to write a Matlab function simulating a
%  game of BattleTanks!
%
%  Your function will take three inputs: the first two are arrays that show
%  how each player has laid out their tanks on their field. The third
%  input is a string of the moves made in the game, containing the moves of
%  both players. The two arrays will always be 8x8 arrays, and the
%  different tanks on the field will be indicated by numbers 1 through 4
%  (and empty space will just be 0's). The string of moves will be of the
%  form: 'A7', where the letter A indicates the column and the number 7
%  indicates the row. If the first player makes the move 'A7', then that
%  means he/she will hit any tank that is located at column 1 and row 7 of
%  the enemy's field.
% 
% Battle Details:
%
%  - The battlefield will be an 8x8 array with up to 4 tanks represented.
%    Tanks may be aligned horizontally or vertically. A heavy
%    tank is 3x2, and represented by the number 4. A medium tank is 2x2,
%    represented by the number 3. A tank destroyer is 3x1, represented by
%    the number 2. A light tank is 2x1, represented by the number 1. 0
%    represents empty space.
%
%  - The string detailing the battle will be a string of which coordinates
%    in the opponent's battlefield a player "shoots at". This input string
%    will be of the form: 'A7 B4 F6', where moves are separated by a space.
%    For each move the letter (A through H) refers to the column (1 through
%    8 respectively), and the number refers to the row. The first player
%    will always make the first move, and moves will then alternate between
%    players for the full length of the string. There is no guarantee that
%    both players will make the same number of moves, and there is no
%    guarantee that all the moves in the string will be used before the
%    battle ends.
%
%  - You must keep track of the order in which each player hits the
%    opponent's tanks, and also keep track of the order in which each player
%    destroys the opponent's tanks. (Keep track of the numbers representing
%    the tanks, not the tank names.) A tank is destroyed when every index
%    of that tank in a player's array has been hit by the enemy.
% 
% Winning conditions:
%
%  - If one player destroys all of the opponent's tanks, then they have won.
%
%  - If neither side has lost all their tanks after all moves have been
%    played, the winner is determined by the number of hits scored on the
%    enemy fleet (NOT the number of tanks they destroyed). It is thus
%    possible to win but not destroy any tanks.
%
%  - The game is allowed to end in a tie. If all of the moves in the input
%    string have been made, and each player has the same number of hits on
%    the other, then the game will be a tie. In the event of this, the
%    outputs of the function will become the secondary outputs described in
%    parentheses at the top of this problem statement: 1) the 1st players
%    final 8x8 array, 2) the 2nd players final 8x8 array, and 3) a string,
%    'Cease fire!'.
% 
% Rules of Engagement: 
%  - Collateral damage is not allowed. No coordinates will be given that do
%    not land within the 8x8 grid. That is, no letter after H in
%    alphabetical order and no number greater than 8 will be given.
%  - Incompetent players are allowed make the same move multiple times.
%    However, it can only count as a "hit" the first time they make the
%    move.
%  - The battlefield will always be 8x8.
%  - Players are not required to play all their tanks. But if they only have
%    one tank out there, and that one tank gets destroyed, then they lose.
%  - There will be no duplicate tanks, eg. two light tanks will not be on 
%    the same side.
%  - In your output arrays, any place where a tank has been hit but not
%    destroyed should be represented by a 0. So there may be "jagged tanks"
%    in an output array.
%
% Hints:
%   - A helper function may be written in the same file, but following the
%     "end" of the main function. This is a function that can be called
%     from the main function, but not the command window, and can be very
%     helpful for performing repeated tasks.
%   - If you have no idea what the heck this problem is asking because you
%     have no idea what Battleship is, then go this URL:
%     http://en.wikipedia.org/wiki/Battleship_(game)
%
% Test Cases:
%
%      load('battleTanks.mat')
%
%      [results1, winHits1, winDestroy1] = battleTanks(battleAP1,battleAP2,moveA)
%           => results1 should be the same as resultsA (which is saved in battleTanks.mat)
%              winHits1 = [1 1 2 2 2 3 3 3 3]
%              winDestroy1 = [1 2 3]
%
%      [results2, winHits2, winDestroy2] = battleTanks(battleBP1,battleBP2,moveB)
%           => results2 should be the equal to resultsB1 (in .mat file)
%              winHits2 should be the equal to resultsB2 (in .mat file)
%              winDestroy2 = 'Cease fire!'