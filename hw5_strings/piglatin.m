function out = piglatin(nouns)
[firstWord,secondWord] = strtok(nouns,' ');

vowel1 = firstWord == 'a'|firstWord == 'e'|firstWord == 'i'|firstWord == 'o'|firstWord == 'u';
firstVowel1 = find(vowel1 == true);
firstVowel1 = firstVowel1(1);
consonant1 = firstWord(1:firstVowel1-1);
firstWord(1:firstVowel1-1) = [];
firstWord = [firstWord '-' lower(consonant1) 'ay'];

secondWord(1) = [];
vowel2 = secondWord == 'a'|secondWord == 'e'|secondWord == 'i'|secondWord == 'o'|secondWord == 'u';
firstVowel2 = find(vowel2 == true);
firstVowel2 = firstVowel2(1);
consonant2 = secondWord(1:firstVowel2-1);
secondWord(1:firstVowel2-1) = [];
secondWord = [secondWord '-' lower(consonant2) 'ay'];

out = sprintf('My most favorite thing in the world is %s, but I hate %s!',firstWord,secondWord);
% Inputs  (1): - (char) A string of two nouns separated by a space.
%                
% Outputs (1): - (char) A cryptic sentence to confuse your 2nd grade
%                       teacher.
%
% Function Description:
%   Let's imagine for a second that you're 7 years old again, and have just
%   discovered the wonders of pig-latin and using it to confuse your
%   teachers. So naturally (since this is CS 1371), you're going to write a
%   matlab function to do this for you!
%
%   Write a matlab function that takes in a string of two random nouns,
%   separated by a space. These two nouns are the answers to two questions
%   that your teacher has asked you: the first is your favorite thing in
%   the world, and your second is your least favorite thing in the world.
%   (Because those are the kinds of things teachers ask you in 2nd grade,
%   after all.) So your function will need to convert the inputted words to
%   pig latin, and then print them into a sentence that you can then read
%   to your teacher.
%   
%   An explanation of pig latin: a word in pig latin has its first sound
%   removed (ex: "taco" becomes "aco" when you remove the T sound), and
%   then this first sound is used with 'ay' after it, and hyphenated to the
%   end of the word-without-its-first-sound.
%
%   example table:     Original Word | Pig Latined Word
%                     ----------------------------------
%                      Matlab        | Atlab-May
%                      Computer      | Omputer-Cay
%                      Transfer      | Ansfer-Tray
%                      Through       | Ough-Thray
%
%   Notice that it is not always a matter of taking the first letter off of
%   the original word, but taking all the letters up to the first vowel.
%
%   Then, once you have figured out the whole pig-latin thing, it's time to
%   actually answer the question your teacher asked you. To do this, simply
%   print the two words into a string as such:
%
%       'My most favorite thing in the world is _____, but I hate _____!'
%
%   Where the underscores represent where you should put the pig-latin-ed
%   words. Make the pig-latin-ed words all lowercase, and do not use any
%   spaces in them.
%
% Example:
%
%       input: 'Cliffs Totalitarianism'
%
%       output: 'My most favorite thing in the world is iffs-clay, but I
%                hate otalitarianism-tay!'
%
% Notes:
%   - There are no spaces between the hyphen and words in the pig latin
%     phrase.
%   - The input words will always be seperated by a single space.
%   - The letter Y will always be considered a consonant for this problem
%     (even if that is not gramatically correct).
%   - Always use the first vowel rule, even if the word is something like
%     "physics". This should become "ics-physay". (Notice that Y was treated
%     as a consonant)
%   - You may assume your inputted words will not start with a vowel.
%
% Hints:
%   - strtok() will be useful.
%
%
% Test Cases:
%
%       edited1 = piglatin('pictures frames')
%           edited1 => 'My most favorite thing in the world is ictures-pay,
%                       but I hate ames-fray!'
%
%       edited2 = piglatin('raspberry blackberries')
%           edited2 => 'My most favorite thing in the world is
%                       aspberry-ray, but I hate ackberries-blay!'
%
%       edited3 = piglatin('Physics september')
%           edited3 => 'My most favorite thing in the world is ics-physay,
%                       but I hate eptember-say!'