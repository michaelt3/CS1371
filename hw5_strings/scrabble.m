function total = scrabble(word,points)
letterPoints = [points 0];
word = lower(word);
word = double(word-96);
doubleWord = word;
test = word == -63;
word(word == -63) = [];
doublePointLetter = find(word == -61) - 1;
word(word == -61) = 27;
letterPoints = letterPoints(word);
letterPoints(doublePointLetter) = letterPoints(doublePointLetter) * 2;
if any(doubleWord(doubleWord == -63))
    total = 2 * sum(letterPoints);
    if sum(test) == 2
        total = 4 * sum(letterPoints);
    end
    if sum(test) == 3
        total = 8 * sum(letterPoints);
    end
        
else 
    total = sum(letterPoints);
end
% Inputs  (2): - (char) A string of the word played in scrabble, with score
%                       multiplier symbols.
%              - (double) A 1x26 vector of letter point values.
%
% Outputs (1): - (double) The score that the word earned.
%
% Function Description:
%   Write a function called "scrabble" that takes inputs of the word
%   played in scrabble and a vector of all letter point values in scrabble,
%   and outputs the score that the word would earn. In the string of the
%   word played, there will be multiplier symbols that correspond to
%   "double word score" and "double letter score" spaces.
%
%   The score multiplier symbols, which are a pound symbol (#) and an
%   exclamation point (!), indicate that the letter immediately preceding
%   the symbol in the input string was played on either a "double word
%   score" space or a "double letter score" space. An exclamation point
%   means a "double word score", whereas a pound symbol mean a "double
%   letter score space". What this means for you is that any letter with a
%   pound symbol after it needs to be counted twice, and that the entire
%   word's score needs to be multiplied by 2 for every exclamation point in
%   the string.
%
%   Example: If you input was 'Hel#lo!', then the first 'l' was played on a
%            double letter score space, and the final 'o' was played on a
%            double word score space. The output score would be 18.
%
%   The 2nd input will always be the same, and it is a 1x26 vector of the
%   letter point values in the alphabet. For example, the 8th index of this
%   vector is the number 8, which is how many points the letter J is worth
%   in scrabble (and J is the 8th letter in the alphabet).
%
%   All you have to do is add up the points of all the letters played in
%   the word, account for any score multiplers, and then output your the
%   score.
%
% Notes: 
%   - Any multiplication done to the final score by "double word" spaces
%     should be done after the "double letter" spaces have been added into
%     the score.
%   - "Double word" space multiplication should compound on itself. As in,
%     if there are three "double word" spaces in the word, then the score
%     should be doubled three times (or multiplied by 8).
%   - Your input is allowed to have both upper and lowercase letters. This
%     does not effect how many points each letter is worth.
%
% Hints:
%   - sum() and strfind() could be useful.