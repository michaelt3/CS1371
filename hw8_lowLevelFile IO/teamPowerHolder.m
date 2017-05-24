function out = teamPowerHolder(fn)
fh = fopen(fn,'r')
test1 = 'do'
test2 = 'you'
test3 = 'want'

line = fgetl(fh)
indexSpace = find(line == ' ')
name = line(1:indexSpace(1)-2)
out = ''

while ischar(line)
    while ~isempty(line)
        [word, line] = strtok(line,' ')
        if strcmpi(word,test1) == true
            [word, line] = strtok(line,' ');
            if strcmpi(word,test2) == true
                [word, line] = strtok(line,' ');
                if strcmpi(word,test3) == true
                    out = name;
                end
            end
        end         
    end
    if strcmpi(out,name)
        break
    end
    line = fgetl(fh)
    if isempty(line)
        line = fgetl(fh)
        indexSpace = find(line == ' ')
        name = line(1:indexSpace(1)-2)
    end
end
fclose(fh);
end

% Inputs  (1): - (char) Filename of a .txt file containing an email
%                       correspondence between any number of team members
% Outputs (1): - (char) The name of the person who is leading the team.
%
% Function Description:
% Write a function, teamPowerHolder, that takes in a .txt file of an email
% correspondence between a team for a group project and outputs the name of
% the person who is leading the team. For this problem, the leader of the
% team will be the first person to ask a question starting with "do you
% want ... ?" (Ex: "Do you want to do the data analysis, and I'll write the
% report?") Ignore capitalization.
%
% Guarantees:
%   - Someone will always ask a question starting with "do you want", and
%     maybe multiple people. The first one is the one who's leading the
%     group.
%   - Between each speaker there will be exactly one blank line.
%
% Hints:
%   - There are some emoticons in the conversations, so using strtok() up
%     to the colon won't work to pull out the name of who's speaking. Think
%     about the empty lines.
%   - Do NOT use fclose all or fclose('all'), just close files you open.