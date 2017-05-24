function str = stringFilter(ca)
str = []
for i = 1:length(ca)    
   if ischar(ca{i})
       str = [str ca{i}]
   elseif iscell(ca{i})
       str = [str stringFilter(ca{i})]   
   end
end
end
       
 
%
% Inputs  (1): - (cell) A cell array to be filtered.
%
% Outputs (1): - (char) All of the strings from the input cell array
%                       concatenated into a single string.
%
% Function Description:
%   Write a function called stringFilter to recursively filter all the
%   strings out of a cell array. The cell array will contain elements of
%   class double, cell, char, or logical, and will contain irregular depths 
%   of nested cells. Your function needs to concatenate all the strings in 
%   the cell array into a single output string, where the strings from the 
%   cell array are concatenated in the order that they appear in the input 
%   cell array (i.e. the order they appear in from left to right in the 
%   string).
%
%   For example, consider the cell array:
%
%     {'This' {{{[1:5] true} {' '}} {'is '} false true} 'an example.'}
%
%   Notice that the cell array is 1x3:
%
%     {'This' {{{[1:5] true} {' '}} {'is '} false true} 'an example.'}
%     |-Ind1-|----------------Index 2------------------|---Index 3---|
%
%   Index 2 of this cell array is another complicated cell array that will
%   will need to be recursively filtered. Also notice that there are 4
%   strings contained in this cell array: 'This', ' ', 'is ', and 'an
%   example.' Your function should filter through the cell array, and
%   concatenate the strings contained within into a single string in the
%   order that they appear. So for the above example, the output of your
%   function should be: 'This is an example.'
%
% Notes:
%   - You should not put spaces or any other characters between each
%     addition to the output string. Simply concatenate the strings as they
%     appear in the cell array.
%   - There will not be any structures contained within the cell array.
%
% Hints: 
%   - You must use recursion. Not because you have to for the homework, but
%     because you can't solve this problem otherwise.
%   - Consider combining iteration and recursion.
%
% Test Cases:
%
%       cA1 = {'This' {{{[1:5] true} {' '}} {'is '} false true} 'an example.'};
%       [filtered1] = stringFilter(cA1)
%           filtered1 => 'This is an example.'
%
%       cA2 = {{{{'I told '} 5:25 'her she'} {} [] [] ' knows'} '/take aim and reload'};
%       [filtered2] = stringFilter(cA2)
%           filtered2 => 'I told her she knows/take aim and reload'