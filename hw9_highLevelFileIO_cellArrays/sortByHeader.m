function [out] = sortByHeader(fn, header)
[num, text, raw] = xlsread(fn);
col = numel(raw) / length(raw);

for i = 1:col
    if strcmpi(raw(1,i),header) == true
        if strcmpi(class(raw{i+(i - 1)*length(raw)}),'double') == true
            [A, index] = sort(cell2mat(raw(2+(i - 1)*length(raw):i*length(raw))))
            index = index + 1;
            out = [(raw(1,:)); , raw(index,:)]
        else
            [A, index] = sort(text(2+(i - 1)*length(raw):i*length(raw)));
            index = index + 1;
            out = [(raw(1,:)); , raw(index,:)] 
        end
    end
end
end
% Inputs  (2): - (char) The file name of an Excel file
%              - (char) The name of a header to sort by
%
% Outputs (1): - (cell) Cell array containing the sorted Excel data 
%
% Function Description:   
%	Given the file name of an Excel file as a first input, write a function
%	called "sortByHeader" that sorts the rows of the excel file by the data
%	in the column given by the 2nd input. If the data in the given column
%	is text, then sort it alphabetically. If the data in the given column
%	is numeric, then sort it in ascending order. Then output the sorted
%	data from the entire excel file as a cell array.
% 
% Notes:
%	- The function should work for any excel file with any number of rows
%       and columns, not just techScores.xls
%   - The header given in the 2nd input is guaranteed to always exist in
%       the excel file.
%   - The data in the column that you are to sort by will either be all
%       strings or all doubles.
%
% Hints:
%   - The sort() function can take an input of a cell array of strings, and
%       will sort the strings alphabetically.
%
% Test Cases:
%
%	x = 'techScores.xls';
%
%   scores = sortByHeader(x, 'Opponent');
%   scores => 'Opponent'              'Tech Points'    'Opponent Points'
%             'Clemson'               [         30]    [             27]
%             'Clemson'               [         39]    [             34]
%             'Duke'                  [         49]    [             10]
%             'Florida State'         [         49]    [             44]
%             'Georgia'               [         24]    [             30]
%             'Iowa'                  [         14]    [             24]
%             'Jacksonville State'    [         37]    [             17]
%             'Miami'                 [         17]    [             33]
%             'Mississippi State'     [         42]    [             31]
%             'North Carolina'        [         24]    [              7]
%             'Vanderbilt'            [         56]    [             31]
%             'Virginia'              [         34]    [              9]
%             'Virginia Tech'         [         28]    [             23]
%             'Wake Forest'           [         30]    [             27]
%
%   scores = sortByHeader(x, 'Tech Points');
%   scores => 'Opponent'              'Tech Points'    'Opponent Points'
%             'Iowa'                  [         14]    [             24]
%             'Miami'                 [         17]    [             33]
%             'North Carolina'        [         24]    [              7]
%             'Georgia'               [         24]    [             30]
%             'Virginia Tech'         [         28]    [             23]
%             'Clemson'               [         30]    [             27]
%             'Wake Forest'           [         30]    [             27]
%             'Virginia'              [         34]    [              9]
%             'Jacksonville State'    [         37]    [             17]
%             'Clemson'               [         39]    [             34]
%             'Mississippi State'     [         42]    [             31]
%             'Florida State'         [         49]    [             44]
%             'Duke'                  [         49]    [             10]
%             'Vanderbilt'            [         56]    [             31]