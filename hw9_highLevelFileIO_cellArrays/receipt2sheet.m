function receipt2sheet(fn1)
fn2 = [strtok(fn1, '.') 'Sheet'];

fh1 = fopen(fn1, 'r');
line = fgetl(fh1);
out = {};
A = [{'Item'} {'Quantity'} {'Unit Price'} {'Total Price'}];

while ischar(line)
    if line(2) == '-'
       line(2) = ' '; 
    end
    B = strsplit(line, '-');
    origUnit = B{2};
    origUnit(1) = '';
    origUnit(end) = '';
    [units, rest] = strtok(B{2}, ' ');
    item = B{1};
    item(end) = '';
    if item(2) == ' '
       item(2) = '-'; 
    end
    units = str2double(units);
    price = B{3};
    price(find(price == '$')) = '';
    price(find(price == ',')) = '';
    price = str2double(price);
    unitPrice = price / units;
    unitPrice = str2double(sprintf('%.2f', unitPrice));

    out = [out; {item origUnit unitPrice price};];
    line = fgetl(fh1);

end
out = [A; out];
xlswrite(fn2, out)
end
% Inputs (1):  - (char) The name of the text file to be read
%
% Outputs (0)
%
% Output Files (1): An excel file meeting the following description.
%
% Function Description:
%   Since we are all broke college kids we need to save all the money we
%   can! That doesn't always mean buying the cheapest stuff though; it's
%   all about the cheapest unit price. To help you keep track of your
%   spending, you have decided to write a Matlab function: your function
%   will take in a text file of a receipt, and print it to an excel file
%   along with the unit price of each item.
%
%   An example input txt file is shown below:
%
%   ---------------------------------- (not part of file)
%   Bananas - .5 lbs - $2.35
%   Grapes - .25 lbs - $4.29
%   Tortilla Chips - 2 units - $4.98
%   Notebook Paper - 5 units - $4.95
%   Water Bottle - 2 units - $19.98
%   Desk Lamp - 1 units - $26.95
%   ---------------------------------- (not part of file)
%
%   Notes:
%       - The item name comes first, and may be multiple words.
%       - There is always a ' - ' between important parts of information.
%       - The price is the price of all of the units. So for notebook
%         paper, the price of buying 5 units is $4.98.
%
%   The excel sheet that you output should have columns for 'Item',
%   'Quanitity', 'Unit Price', and 'Total Price' in that order. It should
%   headers for each column. You may open one of the solution excel files
%   included in this homework to see one.
%   The item, quantity and total price columns will contain exactly the
%   same as the values in the text file. The only value you will have to
%   calculate is the unit price. This price should be rounded to 2 decimal
%   places and you should only display 2 decimal places in your excel
%   sheet.
%
%   The name of the excel sheet should be the name of the receipt with
%   'sheet' appended. For example, if the name of the receipt file was
%   'bathAndBeyond.txt' the outputted Excel file would be named
%   'bathAndBeyondSheet.xls'.
%
% Notes:
%   - The unit price is always the unit price of the given units
%   - Even though the solution Excel files have '_soln' appended to them,
%       your file name shoud be exactly as described above.
%   - Write everything to your excel file as strings rather than numbers.
%   - The inputted name of a txt file is guaranteed to not have any periods
%       before the '.txt' extension.
%
% Hints:
%   - You may want to use strsplit() to delimit the text file.
%   - You can use '%.2f' instead of the typical '%d' within the sprintf
%       function to print a number to 2 decimal places. You should print
%       your prices into a string before writing to excel.
%   - Matlab's built in file-comparison tool can be weird for excel files,
%       but you may check your files by using xlsread() to read in both
%       files and then using isequaln() to compare the 'raw' outputs.
