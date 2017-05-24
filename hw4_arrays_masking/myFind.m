function last = myFind (input)
initial = 1:1:99;
counter = input(:)';
index = counter == true;
last(index) = initial(index);
last(last == 0) = [];

end
% Inputs  (1): - (logical) A 2-Dimensional mask.
%
% Outputs (1): - (double) A 1xN vector of the column-wise indices where the
%                         input mask was "true".
%
%
% Function Description:
%   Write a matlab function that imitates the built-in find() function.
%   Your function should take in a 2-dimensional mask of any size, and
%   output a vector of the indices of where the mask was "true". Use the
%   indices of the array as they count down the columns and then across the
%   rows. For example:
%
%               input: [true false
%                       true  true]
%
%               output: [1 2 4]
%                       
%
% Notes:
%   - You may NOT use the find() function! Any submissions using find()
%     will receive 0 credit.
%
% Test Cases:
%
%       mask1 = [true true true; true false false; true true false];
%       [out1] = myFind(mask1)
%           out1 => [1 2 3 4 6 7]
%
%       mask2 = [true true; true false; false false; true false; true true];
%       [out2] = myFind(mask2)
%           out2 => [1 2 4 5 6 10]
%
%       mask3 = [false false false false false; true false false false false];
%       [out3] = myFind(mask3)
%           out3 => [2]
%