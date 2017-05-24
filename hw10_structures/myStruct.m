function out = myStruct(ca)
p = 1;
test = length(ca{2});
 
for i = 1:length(ca)/2 
fn = ca{p};
    for k = 1:test
        if length(ca{p+1}) == 1 
            for k = 1:test
                sa(k).(fn) =  ca{p+1}{1};   
            end               
        else
            insert = ca{p+1}{k};
            sa(k).(fn) = insert;
        end
    end
p = p + 2;
end
out = sa;
end
% Inputs  (1): - (cell) A 1xN cell array containing fieldnames and data
%
% Outputs (1): - (struct) The contents of the cell array in structure form.
%
% Function Description:
%   Write a function that creates a structure from a given cell array. The
%   cell array will be formatted as such:
%
%   inCellArr = { <field 1 name> , {cell array of field 1 contents},
%   <field 2 name>, {cell array of field 2 contents}, <field 3 name>, {
%   cell array of field 3 contents}, <field 4 name>, ... }
%
%   You should take this cell array and create a structure array with
%   fields given by the strings in the oddly-numbered indices, and with
%   field contents given by the field content cell arrays in the subsequent
%   evenly-numbered indices. Each element in the field content cells should
%   be stored individually in the corresponding index of the structure
%   (i.e. if the field content cell arrays are 1xN, then your output
%   structure should be 1xN). The field content cell arays will all be the
%   same size, with the singular exception of a 1x1 cell. In this case,
%   that single element should be assigned to that field name for every
%   index of the structure (i.e. if your structure is 1xN, then all N
%   elements for this field will be the same piece of data, which was the
%   contents of the singular cell).
%
% Guarantees:
%   - The input cell array will always have an even length.
%   - The contents cell array for the first field is guaranteed to be a
%       1xN cell, and define the size of your output structure.
%   - The field content cell arrays will always be the same size, with the
%       exception of possibly being a 1x1 cell.
%
% Notes:
%   - You may NOT USE THE STRUCT() FUNCTION. The point of this problem is
%       for you to thoroughly learn how it works by coding it yourself. Any
%       submission that uses the struct() function will receive 0 credit.
%   - You must always assign the contents of a 1x1 contents cell array into
%       each index of the output structure, not the 1x1 cell.
% 
% Test Cases:
%
%   load('myStruct_testCaseSolns.mat')
%
%   struct1 = myStruct({'Alias', {'Elastigirl', 'Frozone', ...
%     'Mr. Incredible'},'Location', {'Unknown', 'Known', 'Terminated'}})
%
%       => struct1 should be equal to struct1_soln, which you may load from
%          myStruct_testCaseSolns.mat
%
%   struct2 = myStruct({'Superhero', {'Thunderhead', 'Stratogale',...
%     'Metaman', 'Dynaguy', 'Splashdown'}, 'Death', {'missile jet', ...
%     'jet turbine', 'express elevator', 'takeoff', 'vortex'}, 'Cause', ...
%     {'CAPES!'}})
%
%       => struct2 should be equal to struct2_soln, which you may load from
%          myStruct_testCaseSolns.mat