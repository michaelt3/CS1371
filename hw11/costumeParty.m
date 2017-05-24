function [out1,out2] = costumeParty(costumeItems, budget)
    finalList = {}; 
    [A , B] = findCheapest(costumeItems,budget,finalList);
    out1 = A;
    out2 = B;
end

function [items, leftover] = findCheapest(costumeItems,budget,finalList)
    [minPrice, index] = min(cell2mat(costumeItems(:,2)))
    if budget < minPrice || length(costumeItems) == 0;
        items = finalList;
        leftover = budget;
    else
        budget = budget - minPrice;
        finalList = [finalList,; costumeItems(index,1);];
        costumeItems(index,:) = [];
        [items, leftover] = findCheapest(costumeItems,budget,finalList);
    end
end

    
% Inputs  (2): - (cell)   a cell array containing items and their prices
%              - (double) your budget for Halloween costume items
%
% Outputs (2): - (cell)   a cell array containing the items you bought
%              - (double) the amount of money you have left over
%
% Function Description:
%   You have been invited to a wacky Halloween costume party, and you want
%   dress to impress, but you are a student on a budget. Write a function
%   called "costumeParty" that will find the wackiest costume you can
%   afford. Given a cell array of costume items and their prices, your
%   function must recursively add the cheapest item to your costume until
%   you can no longer afford any of the items. Your function must also
%   compute how much money you have left over after your shopping spree.
%   
%   The first column of the input cell array contains item names, and the
%   second column contains prices. The output cell array must be vertical,
%   ordered by price with the first row containing the name of the cheapest
%   item you bought and the last row containing the name of the most
%   expensive.
%
% Notes:
%   - You MUST use recursion to solve this problem. Submissions not using
%     recursion will receive 0 credit.
%   - You CANNOT use the sort() function. Submissions using the sort()
%     function will receive 0 credit.
%   - No two items will have the same price.
%
% Hints:
%   - If you are having trouble computing the second output, consider what
%     the value should be when you reach the terminating condition.
%   - You are not guaranteed to run out of money before you have bought
%     everything in the cell array. Thusly, there are 2 possible terminating
%     conditions for this problem.
%
% Test Cases:
%
%   load costumeItems.mat;
%   
%   [costume1, leftover1] = costumeParty(costumeItems, 5);
%     costume1 => {'Fingerless Gloves'
%                  'Vampire Fangs'
%                  'Lizard Leggings'
%                  'Cowboy Boots'
%                  'Feather Boa'      }
%     leftover1 => 0.47
%
%   [costume2, leftover2] = costumeParty(costumeItems, 25);
%     costume1 => {'Fingerless Gloves'
%                  'Vampire Fangs'
%                  'Lizard Leggings'
%                  'Cowboy Boots'
%                  'Feather Boa'
%                  'Mermaid Tail'
%                  'Ghostface Mask'
%                  'Indoor Sunglasses'
%                  'Sushi Chef Headband'
%                  'Adult-sized Teletubby Onesie'
%                  'Ash Ketchum's Baseball Cap'
%                  'Assorted Glow Sticks'        }
%     leftover1 => 1.52
