function out = estimateExtremum(x,y)
deriv = diff(y) ./ diff(x);

midpoint = diff(x)./2 + x(1:end-1);


xi = interp1(deriv, midpoint, 0);
yi = interp1(x,y,xi);
out = [xi, yi];
end
%
% Inputs  (2): - (double) A vector of x coordinates
%              - (double) A vector of y coordinates
%
% Outputs (1): - (double) A vector of the x and y coordinates of the extremum 
% 
% Function Description:
%   Write a function called "estimateExtremum" that takes in a set of x and
%   y coordinates corresponding to the function y = f(x), and outputs the
%   approximate coordinates of the function's local extremum (maximum or
%   minimum) as a 2x1 vector.
% 
%   Remember from calculus that a local minimum or maximum of a function
%   occurs where the derivative of the function equals zero. So to find the
%   local maximum or minimum of a function, you need to derive it, and find
%   where the derivative equals to zero. Once you have derived a function,
%   even if there's not an exact 0 value in your vector, you can
%   interpolate to find the x-value where the derivative will be 0. Then,
%   once you find the x-value where the derivative is 0, you can
%   interpolate from the original data to find what the local maximum or
%   minimum value will be.
% 
% Notes: 
%   - The function is guaranteed to have its derivative change sign exactly
%     once within the bounds of the inputted coordinates.
%   - The vector of x coordinates is guaranteed to be strictly increasing.
%   - When performing an interpolation with a function's derivative, you
%     will need x-values to correspond to the "y-values" that are the
%     derivative. Use the midpoints between the inputted x-values for this.
%     (Ex: inputted x-values = [2 4 5], midpoint x-values = [3 4.5])
% 
% Test Cases:
%   x1 = 1:0.2:4;
%   y1 = 3.*x1.^4 - 11.*x1.^3 + 33.*x1.^2 - 99.*x1 + 54;
%   extremum1 = estimateExtremum(x1, y1);
%             extremum1 => [2.0317 -51.8306]
%
%   x2 = [1, 1.2, 1.5, 1.7, 2, 2.2, 2.5, 2.7, 3];
%   y2 = [-5, -4.08, -3, -2.48, -2, -1.88, -2, -2.28, -3];
%   extremum2 = estimateExtremum(x2, y2);
%             extremum2 => [2.2500 -1.9000]