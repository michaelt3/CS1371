  function cost = balloons(volBedroom, r, p)
  volBalloon = ((4/3) * pi * (r^3)) .* 12;
  packsNeeded = ceil(volBedroom / volBalloon);
  salesTax = (p .* packsNeeded) .* .08;
  cost = (p .* packsNeeded) + salesTax;
  end
% Inputs  (3): - (double) The volume of your roommate's bedroom
%              - (double) The average radius of an inflated balloon
%              - (double) The price for a single 12-pack of balloons
%
% Outputs (1): - (double) The total cost of the prank
%
%
% Function Description:
%   Let's say your roommate decided to go home for labor day but you're
%   staying on campus, and that it's your turn in the perpetual roommate
%   prank-war that you and he/she are having. So you decide to fill his/her
%   bedroom with balloons! Whether or not you hypothetically follow through
%   on this hypothetical prank is one thing, but you at least need to
%   calculate how much it would cost you.
%
%   Write a function that takes 3 inputs: the volume of your roommate's
%   bedroom, the average radius of an inflated balloon, and the price of a
%   12-pack of balloons; and outputs the total cost of the prank. Assume
%   that balloons are sold in packs of 12, and use the price given as the
%   total price of one 12-pack of balloons (before tax). Also assume an 8%
%   sales tax.
%
% Notes:
%   - You may assume the balloons will all be spherical. The volume formula
%     of a sphere is as follows: volume = (4/3)*pi*(radius^3)
%   - Ignore the empty space that will actually exist between balloons.
%   - Round up when finding the number of packs of balloons needed; you
%     can only buy things in whole numbers after all.
%   - Remember to include an 8% sales tax.