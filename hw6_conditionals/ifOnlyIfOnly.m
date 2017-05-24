function [output1, output2] = ifOnlyIfOnly(input1, input2)

if isnumeric(input1) == true
    output1 = input1 / sum(sum(input2));
    output2 = input2 .* input1;
end

if islogical(input1) == true
    A = find(input1 == true);
    B = find(input1 == false);
    input1(A) = false;
    input1(B) = true;
    output1 = input1;  
    
    if isnumeric(input2) == true
        if mod(input2,2) == 0
            output2 = true;
        end
        if mod(input2,2) == 1
            output2 = false;
        end
    end
    
    if ischar(input2) == true
        if mod(double(input2),2) == 0
            output2 = 'True'
        end
        if mod(double(input2),2) == 1
            output2 = 'False'
        end
    end
end

if ischar(input1) == true
    if length(input1) > length(input2)
        input1 = input1(1:length(input2));
        output1 = [input1 ' ' input2];
        output2 = false;
    end
    if length(input2) > length(input1)
        input2 = input2(1:length(input1));
        output1 = [input1 ' ' input2];
        output2 = false;
    end
if length(input1) == length(input2)
        output1 = [input1 ' ' input2];
        output2 = true;
end
end

% Inputs (2):  - (Varies) Input 1. (see function description)
%              - (Varies) Input 2.
%
% Outputs (2): - (Varies) Output 1.
%              - (Varies) Output 2.
%
%
% Function Description:
%   Write a function that behaves differently depending on the class of the
%   first input. The three following descriptions are for each possible
%   class of data: double, logical, and char.
%
%       Double: If the first input is double class, then your 2nd input is
%       guaranteed to also be a double. The first input will always be a
%       single number, and the 2nd input can be any size. In this case,
%       your first output should be the first input divided by
%       the overall sum of the 2nd input. The second output should be the
%       2nd input dot-multiplied by the first input.
%
%       Logical: If the first input is logical class, then the 2nd input is
%       guaranteed to represent a number and be length 1. However, the 2nd
%       input can vary between double and char class. So it could either be
%       [5] or '5', which are very different (as you should know from your
%       strings knowledge). For your first output in this case, simply
%       output the opposite of the first input. For example, if your first
%       input was [true false false true], then your first output should be
%       [false true true false]. For your second output in this case, check
%       whether the number represented in the 2nd input is even, and output
%       a single true or false, true is the number is even. If the class of
%       that input was double, then simply leave this second output as
%       logical class. If the class of the 2nd input was char (so it was a
%       string), then output a string of 'True' or 'False' instead of just
%       a logical value.
%
%       Char: If the first input is char class (in other words, if the
%       first input is a string), then the second input is always
%       guaranteed to be another string. You will need to find which string
%       is longer, and remove indices from it that go past the length of 
%       the shorter string. Your first output will then be the two strings
%       concatenated together with a space between them, and the second
%       output will be a single true of false: true if the inputted strings
%       were originally the same length, and false if they were not and you
%       had to shorten one. If you have to shorten one of the inputted
%       strings, then the shortened version of that string should be what
%       you use to concatenate them together for your first output.
%
% Hints: 
%   - ischar(), islogical(), and isnumeric() will be three useful functions.
%
% Test Cases:
%
%       [out1, out2] = ifOnlyIfOnly(5,[5 6 7; 4 3 2])
%           => out1 = 0.1852
%              out2 = [25 30 35
%                      20 15 10]
%
%       [out1, out2] = ifOnlyIfOnly('Hello', 'Worldddd')
%           => out1 = 'Hello World'
%              out2 = false  %%logical class%%
%
%       [out1, out2] = ifOnlyIfOnly(true, '22')
%           => out1 = false  %%logical class%% 
%              out2 = 'True'  %%as a string%%