function out = textStretch(phrase1 , word1 , letter1 , factor1)

A = strfind(phrase1, word1);
B = ones(1,factor1 - 1);
C = zeros(1,(10-factor1));
D = [B C];
E = logical(D);
F = sprintf('%c%c%c%c%c%c%c%c%c%c',letter1,letter1,letter1,letter1,letter1,letter1,letter1,letter1,letter1,letter1);
test = strfind(word1, letter1);
word = [word1(1:test) F(1:factor1-1) word1(test+1:end)];
out = [phrase1(1:A-1) word phrase1(A + length(word1):end)];
end

% Inputs  (4): - (char) A string representing a phrase
%              - (char) A string representing a word
%              - (char) A character representing a letter
%              - (double) A stretch factor
%
% Outputs (1): - (char) A string representing the phrase that has been
%                       infused with flirtation/elation/annoyance/sarcasm
%
% Function Description:
%   It's often hard to express emotions such as flirtation, elation, 
%   annoyance, and especially sarcasm through written means of 
%   communication, such as texting, tweeting, or instant messaging. In
%   an attempt to circumvent this limitation, word lengthening has become a
%   common phenomenon in informal written language, especially in teens.
%
%   Given a phrase, a word, a letter, and a stretch factor, write a 
%   function that identifies the letter in the word in the phrase and
%   stretches it by the factor and returns the same phrase, but with the
%   modified word infused with emotion. For example, run some of the test
%   cases below with the given solution file.
%
% Notes: 
%   - the letter given is guaranteed to appear only once in the given word
%   - the string representing the word is guaranteed to appear only once in
%     the phrase. For example, if the string was 'bag', any word with 'bag',
%     such as 'baggage' or 'eyebag' will not appear in the phrase.
%
% Hints:
%   - the ones() function might be useful
%   - the strfind() functions might be useful
%   - remember concatenation concepts
%
% Test Cases:
%
%       phrase1 = 'this homework is so hard';
%       word1 = 'so';
%       letter1 = 'o';
%       factor1 = 5;
%       out1 = textStretch(phrase1,word1,letter1,factor1)
%           out1 => 'this homework is sooooo hard'
%
%       phrase2 = 'hey I need help with my homework';
%       word2 = 'hey';
%       letter2 = 'y';
%       factor2 = 3;
%       out2 = textStretch(phrase2,word2,letter2,factor2)
%           out2 => 'heyyy I need help with my homework'
%
%       phrase3 = 'shut the front door';
%       word3 = 'front';
%       letter3 = 'f';
%       factor3 = 4;
%       out3 = textStretch(phrase3,word3,letter3,factor3)
%           out3 => 'shut the ffffront door'
%
% Note: IF THE FORMAT OF YOUR OUTPUT STRING IS NOT EXACTLY RIGHT THEN
%       YOU WILL RECEIVE ZERO CREDIT FOR THIS PROBLEM. So make sure you
%       have no typos, that you include all the correct punctuation, and
%       that you don't have an extra space character on the end that you
%       can't see.