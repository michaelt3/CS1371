function [P, V, A] = topGearAnalyst (coeff, time)
acceleration = coeff .* (length(coeff)-1:-1:0);
acceleration(end) = [];

position = coeff ./ (length(coeff):-1:1);
position(end+1) = 0;

P = polyval(position,time);
V = polyval(coeff,time);
A = polyval(acceleration,time);

end
%
% Inputs  (2): - (double) A vector of coefficients of a car's velocity
%                         function.
%              - (double) A time, t, to evaluate position, velocity, and
%                         acceleration at.
%
% Outputs (3): - (double) The car's position at the inputted time.
%              - (double) The car's velocity at the inputted time.
%              - (double) The car's acceleration at the inputted time.
% 
% Function Description:
%   So The Stig needs someone to do his analyzing for him, and since
%   Jeremy, James, and Richard are always too busy pulling pranks on each
%   other to actually hire somebody, it's your job to do this for them.
%
%   Write a matlab function that takes in a vector of coefficients
%   representing a polynomial of a car's velocity, and a time. Your
%   function should calculate the coefficients for the car's acceleration
%   and position, and then output the position, velocity, and acceleration
%   evaluated at the inputted time.
%
%   Remember from calculus that Acceleration is simply the derivative of
%   Velocity, and that Position is the integral of Velocity. Also remember 
%   that you always need an integration constant when you integrate, you 
%   should just use 0 for this value.
%
%   For your reference, here are the rules of how to integrate and derive a
%   single term of a polynomial:
%
%       Integral of f(t): (1/n)*t^(n+1) % t raised to the n+1 power, and divided by n
%
%       f(t) = t^n  % t raised to the n-th power.
%
%       f'(t) = n*t^(n-1) % Derivative: n multipled by t raised to the (n-1) power.
% 
% Notes: 
%   - Use 0 for the constant of integration.
% 
% Test Cases:
%
%       [P1, V1, A1] = topGearAnalyst([1 3 4], 10)
%           => P1 = 523.3333
%              V1 = 134
%              A1 = 23
%
%       [P2, V2, A2] = topGearAnalyst([6 0 -50], 6)
%           => P2 = 132
%              V2 = 166
%              A2 = 72