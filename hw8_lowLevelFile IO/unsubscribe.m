function unsubscribe (fn1, fn2)
fn3 = [strtok(fn1, '.') '_updated.txt'];
fn4 = [strtok(fn2, '.') '_messages.txt'];

fh1 = fopen(fn1, 'r');
fh2 = fopen(fn2, 'r');
fh3 = fopen(fn3, 'w');
fh4 = fopen(fn4, 'w');

line1 = fgetl(fh1);
line2 = fgetl(fh2);

A = 0;

while ischar(line1)
    if isempty(line1)
        break
    end
    line1(find(line1 == ',')) = '';
    line1(find(line1 == ';')) = '';
    if line1(end) == ' '
       line1(end) = '';
    end
    
    [test1,rest] = strtok(line1, '@');
    test1(end) = '';
     
    while ischar(line2)
        line2(find(line2 == ',')) = '';
        line2(find(line2 == ';')) = '';
        if line2(end) == ' '
           line2(end) = '';
        end
        [B,rest] = strtok(line2,' ');
        [C,rest] = strtok(rest,' ');
        test2 = [line2(1) C];
        if strcmpi(test1,test2) == true
            A = A + 1;
            [name,rest] = strtok(line2,' ');
            name = [upper(name(1)) name(2:end)];
            name = [name(1) lower(name(2:end))];
            line2 = fgetl(fh2);
        else
            line2 = fgetl(fh2);
        end
    end
    if A == 0
        fprintf(fh3,[lower(line1) '\n']);
    end
    if A > 0
        A = find(fn1 == '.');
        fprintf(fh4,[name ', you have been unsubscribed from the ' fn1(1:A-13) 'mailing list.\n']);
    end
    name = '';
    fh2 = fopen(fn2, 'r');
    line1 = fgetl(fh1);
    line2 = fgetl(fh2);
    A = 0;
end

fclose(fh1);
fclose(fh2);
fclose(fh3);
fclose(fh4);

end

% Inputs (2):  - (char) the name of a .txt file consisting of a list of
%                       email addresses
% 			   - (char) the name of a .txt file consisting of a list of
% 		                names to be unsubscribed
%
% Outputs (0)
%
% Output Files (2): - A .txt file consisting of an updated list of email 
%                     addresses
% 				    - A .txt file consisting of a list of customized
%                     messages to send
%
% Function Description:
%   You are the newly elected secretary of an organization. This means you 
%   have to manage the member mailing list. Unfortunately, the previous 
%   managers of the mailing list have been terribly disorganized. The 
%   formatting and capitalization are not consistent, but worst of all, the
%   list is out of date! You have received numerous emails from previous
%   members that want to be unsubscribed from the list, and you have
%   collected their names. You don't want to manually go through and delete
%   email addresses from the mailing list, so you decide to write a MATLAB 
%   function to do it for you!
%
%   Write a function called "unsubscribe" that will update a mailing list 
%   to remove the email addresses of members that have chosen to 
%   unsubscribe. It must also clean up the formatting and capitalization of
%   the list. In addition to an updated mailing list, you must also create 
%   a file containing customized messages to send to ex-members of the 
%   mailing list. The two input file names will be 
%   '<organization name> Mailing List.txt' and 
%   'Unsubscribe from <organization name>.txt'. The two files you output 
%   must be named '<organization name> Mailing List_updated.txt' and
%   'Unsubscribe from <organization name>_messages.txt'.
%
%   Let's go through an example:
%   
%   You have two .txt files. You are given the file names. They are
%   'Looney Tunes Mailing List.txt' and
%   'Unsubscribe from Looney Tunes.txt'.
%
%     'Looney Tunes Mailing List.txt' looks like this:
%     ---------------------------------beginning of file (not part of file)
%     BBunny3@Gatech.edu; 
%     ppig3@gatech.edu,
%     Dduck3@Gatech.edu;
%     TDEVIL3@GATECH.EDU 
%     MmArTiAn3@GaTeCh.EdU 
%  
%     ---------------------------------------end of file (not part of file)
%     Note:
%       - There is one email address per line
%       - Each email address is in the format
%         '<first initial><last name><number>@gatech.edu'
%       - There may be commas, semicolons, and/or spaces at the end of each
%         line
%       - The capitalization of the letters in the email addresses is
%         random and inconsistent
%       - There may be empty lines at the bottom of the file, but not at
%         the top
%  
%     'Unsubscribe from Looney Tunes.txt' looks like this:
%     ---------------------------------beginning of file (not part of file)
%     porky pig, 
%     Daffy Duck;
%  
%  
%     ---------------------------------------end of file (not part of file)
%     Note:
%       - There is one name per line
%       - There may be commas, semicolons, and/or spaces at the end of each
%         line
%       - The capitalization of the letters in the names is random and
%         inconsistent
%       - There may be empty lines at the bottom of the file, but not at
%         the top
%  
%   You must now create two new files called
%   'Looney Tunes Mailing List_updated.txt' and
%   'Unsubscribe from Looney Tunes_messages.txt'.
%
%     'Looney Tunes Mailing List_updated.txt' should look like this:
%     ---------------------------------beginning of file (not part of file)
%     bbunny3@gatech.edu
%     tdevil3@gatech.edu
%     mmartian3@gatech.edu
%  
%     ---------------------------------------end of file (not part of file)
%     Note:
%       - There are no commas, semicolons, or spaces at the end of each
%         line
%       - The letters in the email addresses are all lowercase
%       - There is a single empty line at the bottom of the file
%       - The email addresses are listed in the same order as in the
%         original mailing list
%
%     'Unsubscribe from Looney Tunes_messages.txt' should look like this:
%     ---------------------------------beginning of file (not part of file)
%     Porky, you have been unsubscribed from the Looney Tunes mailing list.
%     Daffy, you have been unsubscribed from the Looney Tunes mailing list.
%
%     ---------------------------------------end of file (not part of file)
%     Note:
%       - There are no commas, semicolons, or spaces at the end of each
%         line
%       - Each line is in the format '<first name>, you have been
%         unsubscribed from the <organization name> mailing list.'
%       - The names are capitalized in the standard way; the first letter
%         is uppercase; the rest are lowercase
%       - There is a single empty line at the bottom of the file
%       - The names are listed in the same order as in the unsubscribe list
%
%   That's all, folks! Be sure to review the provided test cases in great
%   detail. Your output files must match the solution files CHARACTER FOR
%   CHARACTER.
%
% Notes:
%   - No two members will have the same first initial and last name
%   - All members are guaranteed to have only 1 first name and 1 last name
%   - All files will have the .txt extension in the file name
%
% Hints:
%   - Don't forget to close all of your files
%
