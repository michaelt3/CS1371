function out = ticTacToeTurn(board, move)
col1 = 1;
col2 = 1;

ind = find(strcmp(' ',board))';
size = length(ind);

out{2,size} = [];

for i = ind
   board{i} = move ;
   out{1,col1} = board;
   col1 = col1 + 1;
   
   A = cell2mat(board);
   out{2,col2} = moveEvaluator(A,move);
   col2 = col2 + 1;
   board{i} = ' ';
end
end
% Inputs  (2): - (cell) A 3x3 cell array containing a tic tac toe board.
%              - (char) A single character of 'x' or 'o', indicating whose
%                       turn it is in the tic tac toe game.
%
% Outputs (1): - (cell) A 2xN cell array of all the next possible moves,
%                       and strings describing the outcome of each move.
%
% Helper Functions (1): moveEvaluator.p
%
% Function Description:
%   Write a MATLAB function to find and evaluate the outcome of all the
%   possible next moves in a tic tac toe game. Your inputs will be a 3x3
%   cell array of a tic tac toe board that looks something like this:
%
%       { 'x' 'o' 'x'
%         'o' 'x' 'o'
%         'o' ' ' ' ' }
%
%   Spaces will represent empty spaces, and besides that, a string of 'x'
%   represents where player X has made a move and a string of 'o' indicates
%   where player O has made a move. You will also have an input of whose
%   turn it is in the tic tac toe game. Your job is to find all the next
%   possible moves for this player, let's say for the above example that
%   it's player X's turn: your 2nd input would simply be the string: 'x'.
%
%   Your function should output a 2xN cell array where the first row
%   contains cell arrays of all the next possible moves, and the second row
%   should be a string describing the outcome of the move. The player will
%   either win, or the turn will be passed onto the next player; so if it's
%   player X's turn, you can either have the string 'Player X Wins!' or the
%   string 'Your move, player O.' This output would look like this for the
%   above example:
%
%    {   { 'x' 'o' 'x'             {'x' 'o' 'x'
%          'o' 'x' 'o'              'o' 'x' 'o'
%          'o' 'x' ' '}             'o' ' ' 'x'}
%
%     'Your move, player O.'       'Player X Wins!' }
%
%
%   You are also give a helper function to help you code this problem. This
%   function has already been written, and is provided with the homework. 
%   It is called moveEvaluator, and its inputs/outputs are described below:
%
%   Helper Function Name: moveEvaluator
%   Helper Function Inputs (2): - (char) A 3x3 character array representing
%                                        a tic tac toe board, after a move
%                                        has been made.
%                               - (char) A single character of the the
%                                        player that just moved.
%   Helper Function Outputs (1): - (char) A string indicating the outcome
%                                         of the turn.
%
%   The helper function moveEvaluator takes in a 3x3 character array of a
%   tic tac toe board after a move has been made, with spaces used to 
%   represent the empty spaces on the board, and a single character of the 
%   player who just went. This 2nd input will be a string of either 'x' or 
%   'o'. This helper function will then output the outcome of that turn: if
%   it was player X's turn, then the two possible outcomes are 'Player X
%   Wins!' or 'Your turn, player O.' Similarly, if it was player O's turn,
%   then the two possible outcomes are 'Player O Wins!' or 'Your turn,
%   player X.'
%
% Notes:
%   - You are not supposed to actually write the code for the helper
%       function included; it is provided for you to call while working on
%       your ticTacToeTurn function.
%   - The .mat file provided with this homework contains variables
%       to use as inputs when running the test cases below. You should not
%       load the .mat file in your actual function, and if you do then your
%       code will error when autograded and you will receive 0 points for
%       this problem.
%   - The order that you should output all the next possible boards should
%       be the order that MATLAB would linearly index the empty spaces on the
%       board (i.e. down the columns). If you use the find function to find 
%       the empty spaces, this is taken care of for you.