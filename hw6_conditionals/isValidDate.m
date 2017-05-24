function out = isValidDate(str)
[month, day] = strtok(str, ' ');
month = month(1:3);
day(1) = [];
[day, year] = strtok(day, ',');
year(1:2) = [];
day = str2num(day);
year = str2num(year);

if month == 'Sep' | month == 'Apr' | month == 'Jun' | month == 'Nov';
    test1 = day <= 30 & day > 0 & mod(day,1) == 0 & year > 0 & mod(year,1) == 0; 
    out = test1;
end

if month == 'Jan' | month == 'Mar' | month == 'May' | month == 'Jul' | month == 'Aug' | month == 'Oct' | month == 'Dec';
    test2 = day <= 31 & day > 0 & mod(day,1) == 0 & year > 0 & mod(year,1) == 0;
    out = test2;
end

if month == 'Feb';
    if mod(year,400) == 0;
        test3 = day <= 29 & day > 0 & mod(day,1) == 0 & year > 0 & mod(year,1) == 0;
        out = test3;
    elseif mod(year,4) == 0 && mod(year,100) ~= 0 ;
       test3 = day <= 29 & day > 0 & mod(day,1) == 0 & year > 0 & mod(year,1) == 0;
       out = test3;
    else
        test3 = day <= 28 & day > 0 & mod(day,1) == 0 & year > 0 & mod(year,1) == 0;
        out = test3;
    end
end
%
% Inputs (1):  - (char) a string representing a date
%
% Outputs (1): - (logical) a logical representing the validity of the date
%
% Function Description:
%   Write a function called "isValidDate" that determines whether or not a
%   date is valid. The input date will always be in the format '<month>
%   <day>, <year>' (for example, 'January 1, 2014').
%
%   Here are the rules that your function must use to check date validity:
%     1) The year must be a positive integer
%     2) The month must be spelled correctly and have the first letter
%        capitalized.
%     3) The day must be an integer in the allowable range for that month
%       (As in: 'February 31, 2014' would not be valid.)
%
%   If any of these three rules are violated, your function should output
%   false.
%   
%
%   Here is a rhyme help you to remember how many days are in each month:
%     "Thirty days have September, April, June, and November. All the rest
%      have thirty-one, except for February, which is dumb."
%   February has 28 days in a non-leap year and 29 days in a leap year.
%
%   Your function should also account for leap years. Here are two easy
%   rules to determine if a year is a leap year:
%     1) If the year is divisible by 400, it is a leap year
%     2) If the year is not divisible by 400, it must be divisible by 4 but
%        not by 100 to be a leap year
%
% Notes:
%   - The day and year are NOT guaranteed to be positive or integer-valued.
%   - There will never be a suffix on the day of the month.
%
% Hints:
%   - You may find the strtok() function useful.
%   - Especially with this function, the test cases below are helpful but
%     not a guarantee that you will get the question correct. If you want to
%     be thorough you should check your code with many of your own test
%     cases.
%
% Test Cases:
%
%       valid1 = isValidDate('September 30, 2014')
%           => valid1 = true
% 
%       valid2 = isValidDate('September 31, 2014')
%           => valid2 = false
% 
%       valid3 = isValidDate('February 29, 2012')
%           => valid3 = true
% 
%       valid4 = isValidDate('December 29.9, -1005.7')
%           => valid4 = false