function [out] = decodeStr (str, num)
out = '';
k = 1;
A = str == ' ';
if any(A)
    while length(str) > 0;
        [word,str] = strtok(str,' ') ;
        if mod(k,num) == 0
            out = [out ' ' word];
        end
        k = k + 1;
    end
    out(1) = '';
else
    while length(str) >= num
        out = [out str(num)];
        str(1:num) = '';
    end
end

% Inputs (2):  - (string) A coded message
%              - (double) A number indicating which word/character to pull
%                         from the string (ex: 4 -> keep every fourth
%                         word/charater)
%
% Outputs (1): - (string) The decoded message
%              
%
%
% Function Description:
%   As an aspiring secret agent, your first training mission (should you
%   choose to accept it) is learning to recognize and decode secret
%   messages. You will start off simple, by writing a matlab function to
%   decode only two differing types of secret message. The first kind of
%   secret message is a sentence, with words in it separated by spaces,
%   where the secret message is simply every Nth word in the sentence, and
%   where N is your "code factor". For example: if a certain sentence has a
%   code factor of 4, the secret message is every 4th word in the sentence.
%   The second kind of secret message you will decode is a string of
%   characters, without any spaces. For this case, the secret message
%   contained is every Nth character. Your matlab function should be able
%   to recognize and decode both types of secret message. These
%   instructions will self-destruct in 15 seconds.
%
%   To summarize: if your input string has spaces in it, you should pull
%   out every Nth word (where N is the 2nd input) and concatenate then into
%   your output, and if your input string does not have spaces in it, you
%   should pull out every Nth character and concatenate those into your
%   output.
%   
%
% Notes: 
%   - Whether or not your input has spaces in it will determine if you pull
%     out every Nth word or every Nth character.
%   - Do not worry about changing punctuation or capitalization.
%   - There can be more than one space between words (but only spaces).
%   - Your decoded message should NOT end with a space.
%
% Test Cases:
%
%       str = ['I want to go  to the   track meet and eat a Jimmy Johns ' ...
%              'gourmet sandwich  on the first  with    Wednesday Adams.'];
%       [out1] = decodeStr(str,4)
%           => out1 = 'go meet Jimmy on Wednesday'
%
%       [out2] = decodeStr('www.harttoregerill.com/op',3)
%           => out2 = 'waterloo'