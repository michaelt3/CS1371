function out = volunteer(name)
if length(name) == 1
    out = name;
else 
    if name{1}(1) > name{2}(1)
        name{2} = name{1};
        name(1) = [];
        out = volunteer(name);
    else
        name(1) = [];
        out = volunteer(name);
    end
end


% Inputs (1):  - (cell) A 1xN cell array of names
%
% Outputs (1): - (char) The name of the final tribute
%
% Function Description:
%   You live in one of the districts of Panem and the most terrible time 
%   of year has come: the Reaping.  Whether you're in a lower numbered 
%   district where everyone wants to be a hero, or a higher numbered 
%   district where everyone has a savior complex, it's guaranteed that all 
%   citizens (listed in the input cell array) will volunteer. To keep the 
%   chaos under control, citizens are given the opportunity to volunteer in 
%   alphabetical order, which means that the person with the last name in 
%   alphabetical order will be attending the Hunger Games! It is your job 
%   to recursively figure out who will be attending in the form of an
%   output.
%
% Notes:
%   - You *must* use recursion in this problem. Submissions not using
%     recursion will receive 0 credit.
%   - Use of the function sort() is not allowed. Submissions using sort
%     will receive 0 credit.
%   - It is guaranteed that the first letter of each name will be
%     different (this means you would only have to compare the first
%     letter of each name).
%
% Hints:
%   - Remember that ASCII values can be compared numerically.
%
%   
%               MAY THE ODDS BE EVER IN YOUR FAVOR!
%
%  Test Cases:
%
%   Dist11 = volunteer({'Chaff', 'Seeder', 'Rue', 'Thresh'})
%       Dist11 => 'Thresh'
%
%   Dist12 = volunteer({'Peeta', 'Katniss', 'Gale', 'Haymitch'})
%       Dist12 => 'Peeta'
%
%   Dist3 = volunteer({'Mags', 'Finnick', 'Annie'})
%       Dist3 => 'Mags'
