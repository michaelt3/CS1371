function [out] = evenOrOddlyLengthed (vec1)
A = mod(numel(vec1),2);
even = A == 0;
if even == true, out = vec1(2:2:end);
else out = vec1(1:2:end);
end
% Inputs  (1): - (double) Some random vector, with an even or odd length.
%
% Outputs (1): - (double) A vector of the even or odd indices of the
%                         original vector, depending on its even or odd length.
%
%
% Function Description:
%   This homework problem is straightforward to describe, but not so simple
%   to figure out: using what you know of vectors and logicals, output a
%   vector of only the odd indices of the input vector if that input's
%   length is odd. If the input's length is even, then output a vector of
%   its even indices. ("Odd indices" simply means the numbers in the 1st,
%   3rd, 5th, etc. locations in the vector, while "even indices" simply
%   means the 2nd, 4th, 6th, etc. locations.) So if your input is [1 2 3 4
%   5 6], then your output should be [2 4 6]; if your input is [1 2 3 4 5],
%   then you should output [1 3 5].
%
% Hints:
%   - Things to get you thinking: mod() function, start:step:end, index vectors. 
%
% Test Cases:
%
%       [out1] = evenOrOddlyLengthed([1:10])
%           => out1 = [2 4 6 8 10]
%
%       [out2] = evenOrOddlyLengthed([2 1 2 1 2 1 2 1 2 1 2 1 2])
%           => out2 = [2 2 2 2 2 2 2]
%
%       [out3] = evenOrOddlyLengthed([1:4:24]);
%           => out3 = [5 13 21]
%