function [accepted] = GTadmissions(vec1, vs, fam)
GPA = vec1(1) >= 3.85;
SAT = vec1(2) >= 2000;
ACT = vec1(3) >= 29;
test1 = GPA == true & SAT == true & ACT == true;
test2 = vs == true;
test3 = fam == true & GPA == true & SAT == true;
test4 = fam == true & GPA == true & ACT == true;
test5 = fam == true & SAT == true & ACT == true;
accepted = any(test1 | test2 | test3 | test4 | test5);
end
% Inputs  (3): - (double) A 1x3 vector of an applicant's GPA, SAT score, and
%                         ACT score (in that order)
%              - (logical) True/false: whether or not the applicant was
%                          either a valedictorian or salutatorian
%              - (logical) True/false: whether of not the applicant has
%                          family at GT
%
% Outputs (1): - (logical) True/False: whether or not the applicant is
%                          accepted
%
%
% Function Description:
%   You have a lot of friends who are totally jealous that you go to
%   Georgia Tech, and that they don't, so they all want to either come here
%   as a freshmen or transfer in from whatever inferior college they
%   decided to actually attend. Since you're a nice and caring friend, you
%   decide to show off your new GT-learned matlab ability by writing a
%   function to try and predict whether or not they'll all get in!
%
%   Write a function, called GTadmissions, that takes three inputs of data
%   that would be used by the admissions office, and returns a single
%   logical output (where true corresponds to a student being accepted and
%   false respectively corresponds to rejected). The three inputs will as
%   such: (1) a 1x3 vector of numbers, representing a student's GPA, SAT
%   score, and ACT score (in that order); (2) a single true/false logical
%   value, where true means that this student was either valedictorian or
%   salutatorian of their high school; (3) a single true/false logical
%   value, where true means that this student has family who have attended
%   GT.
%
%   - An applicant will always be accepted to Georgia Tech if they meet the
%   minimum requirements for acceptance: GPA higher than or equal to 3.85,
%   SAT score higher than or equal to 2000, and ACT score higher than or
%   equal to 29.
%   - An applicant will also always be accepted if they were
%   valedictorian/salutatorian of their school, even if they do not meet
%   the minimum requirements described above.
%   - An applicant may be accepted for only meeting 2 of the 3 minimum
%   acceptance requirements described above if they have had family attend
%   GT.
%
% An Example Test Case:
%
%              accepted = GTasmissions([3.84 2001 30], false, true)
%
%   The applicant in this example test case only meets 2 of the minimum
%   requirements for acceptance (SAT score > 2000, and ACT score > 29), and
%   they were not the valedictorian or salutatorian of their high school
%   (as shown by the "false" in the second input). However, this student
%   does have family who has attended GT (as shown by the "true" in the
%   third input), and so they will still be accepted to Georgia Tech
%   despite only meeting 2 of 3 minimum requirements and not being
%   valedictorian or salutatorian. Thus, the value of "accepted" should be
%   true.
%   
%
% Notes:
%   - This problem could be much helped by clever use of the "and" and
%     "or" operators ("&" and "|" respectively).
%   - Logical data prints to the command window as either a 1 or a 0, so if
%     you're expecting a "true" and you see a "1", then you're good. If
%     you're expecting a true and you see a "0" though, then something's
%     wrong.
% Test Cases:
%
%       [accepted1] = GTadmissions([3.9 2000 28], false, true)
%           => accepted1 = 1
%              %must be Logical class
%
%       [accepted2] = GTadmissions([3.5 1900 28], true, false)
%           => accepted2 = 1
%              %must be Logical class
%
%       [accepted3] = GTadmissions([4.0 2400 36], false, false)
%           => accepted3 = 1
%              %must be Logical class
%