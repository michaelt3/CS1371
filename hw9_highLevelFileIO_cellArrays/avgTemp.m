function [avgHigh, avgLow] = avgTemp(ca)
totalHigh = 0;
totalLow = 0;
A = length(ca) + 1;
countHigh = 0;
countLow = 0;

for i = 1:length(ca)
    if strcmpi(ca(i),'High') == true
        totalHigh = totalHigh + ca{A};
        countHigh = countHigh + 1;
    else
        totalLow = totalLow + ca{A};
        countLow = countLow + 1;
    end
    A = A + 1;
end

avgHigh = round(totalHigh / countHigh)
avgLow = round(totalLow / countLow)
end
% Inputs  (1): - (cell) a cell array containing historic temperatures
%
% Outputs (2): - (double) the average high temperature
% 			   - (double) the average low temperature
%
% Function Description:
%   What's the temperature going to be tomorrow? Write a function called 
%   "avgTemp" that will find the average high and low temperatures from a
%   cell array of historic highs and lows. The cell array will be
%   structured like so:
%
%     {'High', 80
%	   'Low',  60
%      'Low',  63
%      'High', 77
%      'Low',  55}
%   
%   There may be any number of rows, but there will always be two columns.
%   An element in the first column will be a string ('High' or 'Low'), and 
%   an element in the second column will be a number representing the
%   temperature. Your job is to output both the average high temperature
%   and the average low temperature, rounded to the nearest integer.
%
% Notes:
%   - Highs and lows may appear in any order in the cell array.
%   - Use the round() function to round your outputs.
%
% Hints:
%   - You may solve this with iteration if you want, but you can also do it
%       with logical indexing.
%   - Strcmp() can be used to compare a single string to a cell array of
%       strings, and it will return a mask in this case.
%
% Test Cases:
%
%    temps1 = {'High',99;'Low',60;'High',100;'Low',43;'Low',44;'Low',50;'High',82};
%    [high1, low1] = avgTemp(temps1)
%        high1 => 94
%        low1  => 49
%
%    temps2 = {'High',50;'Low',20;'High',51;'High',69;'Low',32;'High',55;'Low',23};
%    [high2, low2] = avgTemp(temps2)
%        high2 => 56
%        low2  => 25
