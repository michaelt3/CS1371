function final = sumFib(num)
   total = 0;
   for i = 1:num
       total = numberCandy(i) + total;
   end
   final = total
end

function out = numberCandy(num)
    if num == 1
        out = 1;
    elseif num == 2
        out = 1;
    else
        out = numberCandy(num-1) + numberCandy(num-2);
    end
end
% Inputs (1):  - (double) An integer of the number of houses visited.
%
% Outputs (1): - (double) The number of pieces of candy you will have.
%
% Function Description:
%   Instead of trick-or-treating through the rough-and-tumble hoods of
%   Atlanta, you have opted for the safer and much more contrived hoods of
%   Mathland. In Mathland, none of the houses giving out candy want to be
%   outdone by any of the houses before them, so each house gives you as
%   much candy as the previous two houses combined. The first two houses
%   each give you one piece of candy. You want to write a function that
%   takes an input of the number of houses visited and outputs the total
%   pieces of candy you have recieved (spoiler: it's a lot).
%
%   You may have noticed that this is just the sum of the first n Fibonacci
%   numbers, where n is the number of houses you have visited.
%
% Notes:
%   - You *must* use recursion to solve this problem. Submissions not using
%     recursion will receive 0 credit.
%   - You may want to have one function that adds the Fibonacci numbers and
%     a helper function that calcuates the nth Fibonacci number.
%
%
% Test Cases:
%   out1 = sumFib(3);
%   out1 = 4;
%
%   out2 = sumFib(10);
%   out2 = 143;
%
%   out3 = sumFib(28);
%   out3 = 832039