function [A, B, C] = personalityTest(type, pVec, subType)
[str1, str2] = strtok(pVec,' ');
[str2, str3] = strtok(str2,' ');
[str3, str4] = strtok(str3,' ');
[str4, str5] = strtok(str4,' ');
[str5, str6] = strtok(str5,' ');
[str6, str7] = strtok(str6,' ');
[str7, str8] = strtok(str7,' ');
[str8, str9] = strtok(str8,' ');
[str9, str10] = strtok(str9,' ');
str10 = str10(2:end);

dominant = double(type(1)) >= 65 && double(type(1)) <= 90;
recessive = double(type(1)) >= 97 & double(type(1)) <= 122;

if dominant == true
    out1 = [type '_' subType(1)];
    if strcmpi(type,str1)
        out2 = str6;
        out3 = [str2 ' ' str10];
    elseif strcmpi(type,str2)
        out2 = str7;
        out3 = [str3 ' ' str1];
    elseif strcmpi(type,str3)
        out2 = str8;
        out3 = [str4 ' ' str2];
    elseif strcmpi(type,str4)
        out2 = str9;
        out3 = [str5 ' ' str3];
    elseif strcmpi(type,str5)
        out2 = str10;
        out3 = [str6 ' ' str4];
    elseif strcmpi(type,str6)
        out2 = str1;
        out3 = [str7 ' ' str5];
    elseif strcmpi(type,str7)
        out2 = str2;
        out3 = [str8 ' ' str6];
    elseif strcmpi(type,str8)
        out2 = str3;
        out3 = [str9 ' ' str7];
    elseif strcmpi(type,str9)
        out2 = str4;
        out3 = [str10 ' ' str8];
    elseif strcmpi(type,str10)
        out2 = str5;    
        out3 = [str1 ' ' str9];
    end
end

if recessive == true
    out2 = [upper(type(1)) type(2:end)];
    if strcmpi(type,str1)
        out1 = [str6 '_' subType(1)];
        out3 = [str7 ' ' str5];
    elseif strcmpi(type,str2)
        out1 = [str7 '_' subType(1)];
        out3 = [str8 ' ' str6];
    elseif strcmpi(type,str3)
        out1 = [str8 '_' subType(1)];
        out3 = [str9 ' ' str7];
    elseif strcmpi(type,str4)
        out1 = [str9 '_' subType(1)];
        out3 = [str10 ' ' str8];
    elseif strcmpi(type,str5)
        out1 = [str10 '_' subType(1)];  
        out3 = [str1 ' ' str9];
    elseif strcmpi(type,str6)
        out1 = [str1 '_' subType(1)]; 
        out3 = [str2 ' ' str10];
    elseif strcmpi(type,str7)
        out1 = [str2 '_' subType(1)];
        out3 = [str3 ' ' str1];
    elseif strcmpi(type,str8)
        out1 = [str3 '_' subType(1)];
        out3 = [str4 ' ' str2];
    elseif strcmpi(type,str9)
        out1 = [str4 '_' subType(1)];
        out3 = [str5 ' ' str3];
    elseif strcmpi(type,str10)
        out1 = [str5 '_' subType(1)];
        out3 = [str6 ' ' str4];
    end
end
A = out1
B = out2
C = out3

% Inputs (3): - (string) A string containing your personality type.
%             - (string) A string containing all possible personality
%                        types, in order from 1 to 10, separated by spaces.
%             - (string) A string containing the personality sub-type.
%
% Outputs (3): - (string) A string containing the dominant personality type
%                         and subType
%              - (string) A string containing the recessive personality
%                         type
%              - (string) A string containing the two "wing" personality
%                         types
%
% Function Description:
%   The Enneagram personality test tells you your dominant personality
%   type, your two "wing" personality types, and your recessive personality
%   type. Your dominant personality type is the personality type that best
%   describes you. Your wing personality types are the two personality
%   types that you also have a few characteristics of. Your recessive
%   personality type is the personality type that you least resemble.
%
%   You took the Enneagram personality test, but it only gave you either
%   your dominant or recessive personality type. You wanted to know your
%   dominant, recessive, and wing personality types! Luckily, you can write
%   a MatLab function to figure out all of your personality types!
%
%   The Enneagram personality test is based on the following circle:
%
%                               1
%                          10        2
%
%                       9               3
%
%                       8               4
%
%                          7         5
%                               6        
%
%   where each number is a personality number. Imagine you are standing at
%   one of the numbers, your dominant personality type, and looking into
%   the circle. The wing personalities are the two personality types
%   surrounding the dominant personality type. So, if your dominant
%   personality type was personality type 3, then your wing personality
%   types would be types 4 and 2. Your right wing personality is the number
%   to the right (counterclockwise on the circle) of your dominant
%   personality type (2 in this case) and your left wing personality type
%   is the number to the left (clockwise on the circle) of your dominant
%   personality type (4 in this case). Your recessive personality type is
%   the personality type opposite of your dominant personality type on the
%   circle. So, if your dominant personality type was 3, your recessive
%   personality type would be 8.
%
%   Write a MatLab function that takes an input of a dominant or recessive
%   personality type and outputs the other personality types. If the
%   inputed personality type starts with a lower case letter , then it is
%   your recessive personality type. If it starts with an uppercase, then
%   it is your dominant personality type.
%
%   You also know your personality subType from a different personality
%   test. To be thorough in your code you wanted to add it as well. Your
%   subType can be either 'alone', 'smallGroup', or 'largerGroup' (those
%   will be the exact input strings). If it is alone add '_a' to the end of
%   your dominant personality type. If it is smallGroup add '_s' to the end
%   of your dominant personality type. If it is large group add '_l' to the
%   the end of your dominant personality type.
%
% Notes:
%   - All outputs have to be capitalized.
%   - There will always be ten personality types in the form 'type Type2
%     Type3', but you do not know the names or order of the personality types.
%   - The ten personality types will always be capitalized.
%   - Your third output is the two wing personalities, these will be in
%     the order: [leftWing rightWing]
%  
% Test Cases:
%       type = 'helper';
%       pVec = ['Reformer Helper Achiever Individualist Dreamer Investigator ...
%                 Loyalist Enthusiast Challenger Peacemaker'];
%       subType = 'alone';
%       [dom1, rec1, wings1] = personalityTest(type,pVec,subType);
%           dom1 => 'Loyalist_a'
%           rec1 => 'Helper'
%           wings1 => 'Enthusiast Investigator'
%
%       type2 = 'Dreamer';
%       pVec2 = ['Achiever Individualist Dreamer Investigator Loyalist ...
%                 Enthusiast Challenger Peacemaker Reformer Helper'];
%       subType2 = 'smallGroup';
%       [dom2, rec2, wings2] = personalityTest(type2,pVec2,subType2);
%           dom2 => 'Dreamer_s'
%           rec2 => 'Peacemaker'
%           wings2 => 'Investigator Individualist'
%
%       type3 = 'Challenger';
%       pVec3 = ['Peacemaker Reformer Helper Achiever Individualist Dreamer ... 
%                 Investigator Loyalist Enthusiast Challenger'];
%       subType3 = 'largeGroup';
%       [dom3, rec3, wings3] = personalityTest(type3,pVec3,subType3);
%           dom3 => 'Challenger_d'
%           rec3 => 'Individualist'
%           wings3 => 'Peacemaker Enthusiast'
%
%