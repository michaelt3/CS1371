function total = inventory(fn1, fn2)

fn3 = [strtok(fn1, '_') '_restockingData.txt'];
fn4 = 'additionalData.txt';

fh1 = fopen(fn1, 'r');
fh2 = fopen(fn2, 'r');
fh3 = fopen(fn3, 'w');
fh4 = fopen(fn4, 'w');

fprintf(fh3,'Inventory Data:\n\n');

fgetl(fh1)
fgetl(fh1)
inven = fgetl(fh1);

fgetl(fh2);
fgetl(fh2);
price = fgetl(fh2);

total = 0;

while ischar(inven)
    index = find(inven == '#');
    remaining = str2num(inven(index(1)+1:index(1) + 2));
    need = str2num(inven(index(2)+1:end));
    buy = need - remaining;
    fprintf(fh4, [inven(1:index(1)) '%d' inven(index(2)-1:index(2)) '%d' '\n'], need, buy);
    
    index = find(price == '$');
    cost = str2num(price(index+1:end));
    
    total = total + buy * cost;
    fprintf(fh3, '%s\n', inven);
    inven = fgetl(fh1);
    price = fgetl(fh2);
end

fprintf(fh3, '\n\nRestocking Data:\n');
fh4 = fopen(fn4, 'r');
line = fgetl(fh4);
while ischar(line)
   fprintf(fh3,'\n%s',line);
   line = fgetl(fh4);
end
    
fclose(fh1);
fclose(fh2);
fclose(fh3);
fclose(fh4);

end
% Inputs  (2): - (char) The name of a .txt file containing inventory data
%                       for a restaurant.
%              - (char) The name of .txt file containg the price the store
%                       must pay for each item.
% 
% Outputs (1): - (double) A number: the total cost of restocking the
%                         restaurant.
%
% Output files  (1): A .txt file containing inventory restocking data.
% 
% Function Description:
%   Imagine that you're working some tedious part time job at a restaurant
%   for the summer, and your entire job consists of maintaining the store's
%   inventory. In order to make your life easier, you want to write MATLAB
%   code to do your job for you!
%
%   Write a function called "inventory" that takes in two txt files: one
%   txt file of inventory data after a day of sales, and a second txt file
%   of how much it costs to restock 1 of each item. You will need to use
%   these two txt files to find how many of each item you should buy to
%   completely restock the store, and then you will need to output the
%   total price to restock to full inventoy. You will also need to create
%   and output another txt file of inventory restocking data.
%
%   The format for these txt files will be as follows:
%
%   Input 1: <businessName>_inventoryData.txt
%       (the dashes are merely to indicate the start and end of the file,
%       and are not actually part of the file)
%       ---------------------------------
%       Inventory Data:
%       
%       Chips #40 #100
%       Lettuce #80 #90
%       Cheese #22 #60
%       ---------------------------------
%       
%       Notes:
%       - For this file, the name of the item comes first. The first number
%         is the number of this item are remaining in inventory at the end of
%         a day, and the second number is how many of that item you need for
%         full inventory.
%       - The naming convention for this file is:
%         <businessName>_inventoryData.txt
%      
%
%   Input 2: <businessName>_prices.txt
%       ---------------------------------
%       Prices:
%
%       Chips $2
%       Lettuce $2
%       Cheese $6
%       ---------------------------------
%
%       Notes:
%       - For this file, the items will be in the same order as in the first
%         input txt file. Then there will be a price after it, which will
%         always be a whole dollar amount.
%       - The naming convention for this file is:
%         <businessName>_prices.txt
%
%
%   Output: <businessName>_restockingData.txt
%       ---------------------------------
%       Inventory Data:
%       
%       Chips #40 #100
%       Lettuce #80 #90
%       Cheese #22 #60
%
%
%       Restocking Data:
%
%       Chips #100 #60
%       Lettuce #90 #10
%       Cheese #60 #38
%       ---------------------------------
%
%       Notes:
%       - For this file you will need to include the original inventory data,
%         and then put two empty lines before getting to the restocking data.
%         For the restocking data the order of the items should be the same
%         as it is in the two inputted files. Then the first number after
%         each item is the inventory amount after you restock the inventory
%         that day (so it should always be the same as each full inventory
%         amount). then thesecond number is how many of each item you had to
%         buy to restock.
%       - The naming convention for your output file is:
%         <businessName>_restockingData.txt
%   
%   Besides the three txt files described above, you will also need to
%   output a double of the total price spent to restock the entire store.
%
% Notes: 
%   - All inventory numbers will have a # in front of them 
%   - All the prices will have a $ in front of them and will always be a
%     full dollar amount.
%   - When creating the new output every item should be seperated by a space
%       Ex. 'Chips #5 #2'
%   - There will always be 5 items to stock.
%   - If your output file is not EXACTLY the same as the solution txt file,
%     then you will receive 0 credit for it.