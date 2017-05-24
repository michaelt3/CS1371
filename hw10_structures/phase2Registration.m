function out = phase2Registration(class, change, registrar)
for i = 1:length(change{2})
    add = change{2}(i);
    for k = 1:11
        if registrar(k).CRN == add
            class = [class registrar(k)];
        end
    end
end

for i = 1:length(change{4})
    drop = change{4}(i);
    for k = 1:length(class)
        if class(k).CRN == drop
            class(k) = [];
            break
        end
    end
end
out = class;
end
    
% Inputs (3): -(struct) A structure array containing your current schedule
%             -(cell) A cell array containing the CRN's of classes to add/drop
%             -(struct) A structure array representing GT's registrar
%
% Ouputs (1): -(struct) A structure array representing your new schedule
%
% Function Description:
%     It's that time again for Phase II Registration! As you learned from
%     last semester, Phase II Registration can be a time of stress as you
%     try to decide which classes to take and try to snag that last
%     available seat. In order to save yourself the heartache of having an
%     8am class every morning next semester, you decided to write a MATLAB
%     function that will make your registration process easier.
%
%     You already have a structure array of the classes that you registered
%     for during Phase I. Unfortunately, you didn't get all of the classes
%     that you wanted and you had to register for other classes as place
%     holders. The first input is a 1x4 or 1x5 structure array of the
%     classes that you are already enrolled in. 
%
%     Class structure format:
%
%         class1(1) =>
%             title: 'Biological Principles';
%               CRN: 85588;
%      courseNumber: 1510;
%              days: 'MWF';
%              time: '11:05am - 11:55am';
%        instructor: 'Jones';
%          location: 'Clough Undergraduate Learning Center';
% 
%      The second input is a 2x2 cell array containing the CRN's of class
%      that you would like to add and drop. The first row contains the
%      titles 'Add' and 'Drop' in that order. The second row contains a
%      vector (type double) of CRN's. The CRN's in the first column
%      correspond to the classes to be added and the CRN's in the second
%      column correspond to the classes to be dropped.
%
%      The last input represents the Georgia Tech registrar. It is a 1xN
%      structure array that contains all of the classes that are of
%      interest to you. The fields are the same as the class structure
%      (i.e. title, CRN, courseNumber, etc...).
% 
%      Your function should take these inputs and output a new structure
%      array of classes after you drop/add classes from the original
%      structure array. The classes should be appended to the end of the
%      structure array in the order that they appear in the cell array.
%
% Test Cases:
%
%    load('phase2Registration_testCaseInputs.mat');
% 
%    out1 = phase2Registration(class1, change1, registrar)
%       out1 => 1x4 structure array identical to out1_soln
%
%    out2 = phase2Registration(class2, change2, registrar)
%       out2 => 1x5 structure array identical to out2_soln
%
%    out3 = phase2Registration(class3, change3, registrar)
%       out3 => 1x5 structure array identical to out3_soln