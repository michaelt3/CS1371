function [area] = shoelace(vecX , vecY)
A = vecX';
B = vecY';
sum1 = sum(A(1:end-1) .* B(2:end)) + sum(A(end) .* B(1));
sum2 = sum(A(2:end) .* B(1:end-1)) + sum(A(1) .* B(end));
area = (abs(sum1 - sum2)) ./ 2;
end
% Inputs  (2): - (double) A vector of x coordinates
%              - (double) A vector of y coordinates
% Outputs (1): - (double) The area of the polygon defined by the inputs
%
% Function Description:
%	Given pairs of x and y coordinates defining a simple polygon, write a
%	function shoelace that computes and outputs the area of this polygon.
%
%   In order to do this, you will be implementing the shoelace algorithm.
%   This algorithm works by lining up your x coordinates in a column and
%   your y coordinates in a column next to it. Then, you multiply numbers
%   diagonally so that the first x value is multiplied by the second y
%   value, the second x value is multiplied by the third y value, and so on
%   until the last x value is multiplied by the first y value. You take the
%   sum of these numbers. Let's call this sum1. Then, the process is
%   repeated so that the first y value is multiplied by the second x
%   value, the second y value is multiplied by the third x value, and so on
%   until the last y value is multiplied by the first x value. You take the
%   sum of these numbers. Let's call this sum2. The area in the polygon is
%   then half the positive difference between sum1 and sum2. Or:
%
%                               |sum1 - sum2|/2
%
%   The shoelace method is named so because of the diagram you make when
%   computing it, as approximated in ascii below for a triangle.
%                                  X  Y
%                                  1  3
%                                   \/
%                                   /\  
%                     6 <=(3*2) <- 2  7  -> (1*7)=>  7
%                                   \/
%                                   /\
%                    28 <=(7*4) <- 4  1 -> (2*1)=>   2
%                                   \/
%                                   /\
%                     1 <=(1*1) <- 1  3 -> (4*3)=>  12
%                   ----------------------------------
%             Sums:  35                             21
%
%                   area = (35 - 21)/2 = 7
%
%   Looks kind of like a shoe with laces, right? In this example, a
%   triangle with x coordinates [1, 2, 4] and corresponding y coordinates
%   [3, 7, 1] is determined to have area 7.
%
%
% Notes:
%	- You are guaranteed to have at least 3 pairs of x and y coordinates.
%	  There may be more
%   - Wikipedia has a decent page on this:
%     http://en.wikipedia.org/wiki/Shoelace_formula
%   - You are also guaranteed that the points will be ordered either
%     clockwise or counterclockwise around the polygon (Basically all this
%     means is that the points we give you can be used for the shoelace
%     method)
%
% Hints:
%	- You may find abs() useful
%   - Remember that .* performs an element-by-element multiplication; this
%     could help you a lot in this problem.
%
% Test Cases:
%
%       [area1] = shoelace([1,2,4], [3,7,1]);
%           => area1 = 7
% 
%       [area2] = shoelace([-22, 7, 12, 4], [0, -1, 6, 24])
%           => area2 = 434           
% 
%       [area3] = shoelace([1, 5, -10, 2], [1, 6, -2, 1])
%           => area3 = 23
% 
%