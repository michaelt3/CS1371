function [out1 , out2] = CFRecruiter (str, vec, log)
out1 = '';
out2 = 0;

for i = 1:length(vec)
    [name,str] = strtok(str, ',');
    if vec(i) > 2.5 & log(i) == true
        out1 = [out1 ',' name];
        out2 = out2 + ((vec(i) - 2.5) * 4);
    end       
end
if out1(2) == ' ';
    out1(2) = '';
end
if out1(1) == ' '
    out1(1) = '';
end
if out1(1) == ','
    out1(1) = '';
end
% Inputs (3):  - (char) A string of strudent names, separated by comma-space.
%              - (double) A vector of GPAs, corresponding to the students
%                         in the first input.
%              - (logical) A logical vector of whether or not each student
%                          stays to talk.
%
% Outputs (2): - (char) A string of possible candidates to hire.
%              - (double) The total time spent the recruiter spends talking
%                         to students.
%
% Function Description:
%   Imagaine you are a recruiter at the Career Fair for a big-name company:
%   a bunch of students are waiting in the line to talk with you, and you
%   don't have time to talk to everybody. You're not even going to bother
%   talking to students whose GPA doesn't meet the minimum to work for your
%   company (which is a GPA above a 2.5, not inclusive), and there are some
%   students who don't even stay to talk, they just hand in their resume
%   and leave!
%
%   Write a function that takes in a string of names separated by a
%   comma-space (', '), a vector of these students GPAs, and a logical
%   vector of whether or not they stick around to talk. Output a string of
%   the names of possible candidates for your company (students with GPAs
%   higher than your minimum who stayed there to talk), and output the
%   number of minutes spent talking to these students. The time you spend
%   talking to each student will vary, but it will generally follow the
%   formula:
%
%           Time in minutes = (GPA - 2.5) * 4;
%
% Notes: 
%   - Do not round/ceil/floor the output time.
%   - In the string, names are seperated by ', ', so the string would look
%     like 'Jack, Emily, Sam Lin, Will Brown'. Your output should be
%     exactly the same format as the input, but with fewer names.
%   - It is guaranteed there will be at least one name in your output string.
%   - Use strtok wisely, and deal with ' ' and ',' carefully. Your output
%     needs to be exactly the same as the output from CFRecruiter_soln.p
% 
% Test Cases:
% 
%       [Names, Time] = CFRecruiter('Jack, Rose, Tom', [3.9, 2.3, 3.3],...
%                                   [false true true])
%           => Name = 'Tom'
%              Time = 3.2000
%
%       [Names, Time] = CFRecruiter('Gatech, George Burdell, Barnes Noble',... 
%                                   [4.0, 2.5, 3.6], [true true true])
%           => Name  = 'Gatech, Barnes Noble'
%              Time  = 10.4000