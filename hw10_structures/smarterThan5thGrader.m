function out = smarterThan5thGrader(questions,cont,fifthGraders)
helpCounter = 0
studentsUsed = {}
wrongCounter = 0
numCounter = 0
value = 0
 for i = 1:11
    if wrongCounter < 2
        if strcmp(cont.Answers{i},'Ask a 5th Grader') == true
            helpCounter = helpCounter + 1
            studentsUsed = [studentsUsed fifthGraders(i).Name]
            if strcmp(fifthGraders(i).Answer,questions(i).Answer) == true
                value = value + questions(i).Value
                numCounter = numCounter + 1
            else
                wrongCounter = wrongCounter + 1
                if wrongCounter == 2
                    break
                else
                    value = value + questions(i).Value
                    numCounter = numCounter + 1
                end
            end     
        elseif strcmp(cont.Answers{i},questions(i).Answer) == true
            value = value + questions(i).Value
            numCounter = numCounter + 1
        else 
            break
        end
    else
        break
    end
 end
 out.Name = cont.Name
 out.Gender = cont.Gender
 out.Education = cont.Education
 out.NumberQuestionsAnswered = numCounter
 out.Winnings = value
 out.FifthGradersUsed = studentsUsed
end
% Inputs (3):  - (struct) A 1x11 structure array of the questions to be
%                         asked to the contestant. Contains fields "Answer"
%                         and "Value".
%              - (struct) A 1x1 structure of the contestant. Contains
%                         fields "Name", "Gender", "Education", and
%                         "Answers".
%              - (struct) A 1x10 structure array of the fifth graders to
%                         call on for help. Contains fields "Name" and
%                         "Answer".
%
%
% Outputs (1): - (struct) A 1x1 structure that is a report of the game,
%                         with fields as described below.
%
% Function Description:
%   Write a MATLAB function to simulate a round of the gameshow Are You
%   Smarter Than a 5th Grader. This game is simple: a single contestant is
%   asked 10 questions in a row, and if they answer all 10 correctly they
%   get the chance to answer an 11th question. For each question answered
%   correctly they make a certain amount of money, and if they miss a
%   single question along the way then then they are eliminated. The
%   contestant may ask for help on each question from a local 5th grader.
%   Here is what you need to know for your function:
%
%   You have three inputs: 
%     1) A 1x11 structure array of the questions asked. 
%     2) A 1x1 structure of the contestant's data and the answers they will 
%        give to all 11 questions. 
%     3) A 1x10 structure array of the 5th graders who are there to help 
%        with each question. 
%
%       The contestant will be asked the questions in order from the first 
%   index of the array being the first question to the last index being 
%   the last question. Contained within this structure array of questions 
%   are the fields "Answer" and "Value"; you don't actually know what the 
%   questions asked were, all you need to do is compare the contestant's 
%   answer to each question to the answer given in the structure array of 
%   questions. 
%
%       The structure of the contestant will contain a field called 
%   "Answers". Inside of this will be a 1x11 cell array of the contestant's 
%   answers to each question. If the string at index 1 of the contestant's
%   answers is the same as the string contained in the Answer field of the
%   first index of the questions structure array, then the contestant has
%   answered the first question correctly and may move on to the second
%   question.
%
%       A contestant is also allowed to call on help from local 5th graders 
%   for each question. The third input to your function will be a 1x10
%   structure array representing local 5th graders, with each index
%   corresponding to one of the first 10 questions (the contestant is not
%   allowed to call for help on the 11th question). If a contestant calls
%   for help on a specific question, then their "answer" to that question
%   will be the string: 'Ask a 5th Grader'. For example, a contestant might
%   answer 'Ask a 5th Grader' for the 7th question in the game. In this
%   case, the 7th index of the 5th-graders structure array will be used.
%   This structure array contains the fields "Name" and "Answer", where the
%   Name field is the name of each 5th grader at each index and the Answer
%   field of each index is the answer that this 5th grader provides to
%   their specific question if asked.
%
%       The game is played by a contestant answering questions in order. If
%   they answer a question correctly then they earn the winnings for that
%   question, which is the number stored in the "Value" field for each
%   index of the questions structure array. If they do not answer a
%   question correctly, then they are eliminated and may not answer any
%   more questions. A contestant may call for help from a 5th grader for
%   any question besides the 11th final question, but they are only allowed
%   to call for help twice. A contestant must use the answer provided by
%   the fifth grader if they call for help, but will be forgiven once for
%   an incorrect answer provided by a 5th grader. Once eliminated, a
%   contestant will take all the winnings they have earned for the
%   questions answered correctly.
%
%       You have one output: A 1x1 structure containing a report of how the 
%   contestant did. The fields of the report should be as follows:
%
%       Name
%       Gender
%       Education
%       NumberQuestionsAnswered
%       Winnings
%       FifthGradersUsed
%
%       The first three fields of this report output will come directly 
%   from your inputted contestant structure. Then "NumberQuestionsAnswered"
%   will be the numer of questions that the contestant answered correctly 
%   over the course of the game, "Winnings" will contain a number of how 
%   much the contestant won, and "FifthGradersUsed" needs to contain a cell 
%   array of which 5th graders were used. If no help was used, then this 
%   field should contain an empty cell array. Otherwise it should contain a 
%   cell array of the names of the 5th graders who helped, and in the order 
%   that they helped.
%
% Game Rules (for this homework):
%   - Winnings are earned on a per question basis, and awarded for correct
%     answers.
%   - The contestant may call for the help of a 5th grader up to 2 times.
%   - When calling for help, the contestant must always use the answer
%     provided by the 5th grader.
%   - The contestant may be forgiven one time for a 5th grader answering
%     incorrectly. In this case they will still earn the winnings for the
%     question. This counts as one of the 2 allowed calls for help.
%   - No help is allowed on the 11th final question.
%   - The contestant is eliminated for an incorrect answer that they
%     provide themselves, even if they were still allowed to call for help.
%
% Notes:
%   - The contestant is guaranteed to not try to call for help on the 11th
%     question.
%   - The contestant is not guaranteed to obey the rule that they are only
%     allowed to call for help twice. If they try to call for help a third
%     time they should be eliminated for answering that question
%     incorrectly.
%   - Notice what's going on with the 5th graders: the contestant can call
%     for help twice, and can be saved once if a fifth grader is incorrect.
%     If they call on a 5th grader for help and the 5th grader
%     answers the question incorrectly then one of two things happens:
%     1) either the contestant has already asked for help from another 5th
%     grader who was also incorrect, in which case the game is over and the
%     contestant has lost. Or 2) Your code somehow needs to store that the
%     5th grader is incorrect, but the contestant still gets the winnings
%     and still advances to the next question.
%   - The 5th grader who answers incorrectly for the second time must still
%     be included in the cell array in the field "FifthGradersUsed"
%
% Test Cases
%
%   load('smarterThan_testCases.mat') %%% DON'T PUT THIS IN YOUR FUNCTION
%
%       report1 = smarterThan5thGrader(questions,cont_Emily,fifthGraders);
%           report1 should be the same as report1_soln
%
%       report2 = smarterThan5thGrader(questions,cont_Jacob,fifthGraders);
%           report2 should be the same as report2_soln
%           
%       report3 = smarterThan5thGrader(questions,cont_John,fifthGraders);
%           report3 should be the same as report3_soln