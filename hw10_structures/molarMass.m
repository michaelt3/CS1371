function out = molarMass(str, table)
weight = 0;

while ~isempty(str)
    [A, str] = strtok(str, ',');
    test1 = isstrprop(A,'alpha');
    test2 = isstrprop(A,'digit');
    ele = A(test1);
    num = str2num(A(test2));
    for i = 1:10
        if table(i).Symbol == ele
            if isempty(num)
                weight = weight + table(i).AtomicWeight;
                break
            else
                weight = weight + table(i).AtomicWeight * num;
                break
            end
        end
    end
end
out = weight;
end
% Inputs  (2): - (char) A string representing a chemical formula
%			   - (struct) A structure array of elements and relevant info
%
% Outputs (1): - (double) The molar mass of the chemical compound.
%
% Function Description:
%   Write a function that takes in an input string of a chemical compound,
%   with commas delimiting each element, and outputs the molecular weight
%   of the compound. You will also be given an input of a "periodic table"
%   structure array. This structure array will not contain all of the
%   elements from the periodic table, but it is guaranteed to contain all
%   of the elements used in the inputted chemical formula. Each structure
%   in this array will contain the following fields:
%
%     Name
%     Symbol
%     AtomicNumber
%     AtomicWeight
%
%	The inputted chemical formula will look something like 'H2,O' (water)
%	or 'C6,H12,O6' (glucose). Notice that there are commas between each
%	element that composes the molecular formula. 'H' is the molecular
%	symbol for Hydrogen, and 'O' is the symbol for Oxygen. We can tell from
%	the '2' in the input string that there will be 2 Hydrogen atoms in a
%	water molecule, and from the lack of number after Oxygen that there is
%	only a single Oxygen atom in a water molecule. The molecular weight of
%	water will thus be 2*(Hydrogen's weight) + (Oxygen's weight), which
%	evaluates to 18.015.
%
%   Use string operations and the inputted structure array to add up the
%   molecular weight of the inputted chemical formula.
%
% Notes:
%   - The input string will never have brackets [] or parentheses () in it.
%   - The input string will never contain elements that do not appear in
%     the input structure array.
%   - Elements in the input string are distinguished by commas for your
%     convenience.
%   - Elements are allowed to repeat in a chemical formula.
%
% Hints:
%   - There is a way to capture all of the values of a particular field
%     in a structure array and store it in a numerical or cell array.
%
% Test Cases:
%
%   load('periodicTable.mat'); % this contains the variable "table"
%   
%   mass1 = molarMass('O2', table)
%     mass1 => 31.998
%   
%   mass2 = molarMass('Na,Cl', table)
%     mass2 => 58.4398
%
%   mass3 = molarMass('H2,S,O4', table)
%     mass3 => 98.072
%
%   mass4 = molarMass('C6,H12,O6', table)
%     mass4 => 180.156
%
%   mass5 = molarMass('C,H2,Br,C,H2,Br', table)
%     mass5 => 187.862