 function [posRoot , negRoot] = findZeroVelocity(A, B, C, D)
 posRoot = (-(2*B) + sqrt((2*B)^2 - 4*(3*A)*C)) / (2*(3*A));
 negRoot = (-(2*B) - sqrt((2*B)^2 - 4*(3*A)*C)) / (2*(3*A));
 end
%
% Inputs  (4): - (double) The first coefficient of a cubic polynomial, A.
%              - (double) The corresponding 2nd coefficient, B.
%              - (double) The corresponding 3rd coefficient, C.
%              - (double) The corresponding 4th coefficient, D.
%
% Outputs (2): - (double) The "positive root" for when velocity is 0.
%              - (double) the "negative root" for when velocity is 0.
%
%
% Function Description:
%   Imagine that you are an engineer finishing your degree at Georgia Tech,
%   and for your capstone-design course you need to find when the velocity
%   of certain component in your design is equal to 0. Using experimental
%   and curve fitting techniques that you will actually learn in later
%   classes, you have found that this component's position function with
%   respect to time is simply a cubic polynomial. For example, the position
%   function with respect to time might be something like this:
%
%           f(t) = 3t^3 + 4t^2 + 2t + 3.
%
%   If it was, then the "coefficients" of this polynomial would be 3, 4, 2,
%   and 3 (in that order). From calculus it is known that Velocity is the
%   derivative of Position. The derivative of a cubic polynomial with
%   coefficients of A, B, C, and D is shown below:
%
%           cubic function: f(t) = At^3 + Bt^2 + Ct + D
%
%           its derivative: f'(t) = (3*A)t^2 + (2*B)t + C
%
%   Using this knowledge, write a function that takes in the coefficients
%   A, B, C, and D of a cubic function for Position, and outputs the
%   "positive root" and "negative root" for when Velocity is zero.
%