function extrapCalc (x, y, color, bound)
n = 1;

for i = 1:5
xi = x(1:length(x) * (i/5));
yt = y(1:length(x) * (i/5));
yi = interp1(xi,yt,x,'linear','extrap');
subplot(3,1,1)
title('Interp1: Linear');
xlabel('x values')
ylabel('y values')
hold on
axis(bound)
plot(x,yi,color(n))
n = n + 1;
end

n = 1;
for i = 1:5
xi = x(1:length(x) * (i/5));
yt = y(1:length(x) * (i/5));
yi = interp1(xi,yt,x,'cubic','extrap');
subplot(3,1,2)
title('Interp1: Cubic');
xlabel('x values')
ylabel('y values')
hold on
axis(bound)
plot(x,yi,color(n))
n = n + 1;
end

n = 1;
for i = 1:5
xi = x(1:length(x) * (i/5));
yt = y(1:length(x) * (i/5));
yi = spline(xi,yt,x);
subplot(3,1,3)
title('Spline')
xlabel('x values')
ylabel('y values')
hold on
axis(bound)
plot(x,yi,color(n))
n = n + 1;
end
end
% Inputs  (4): - (double) A vector of x values
%              - (double) A vector of y values
%              - (char)   A string of colors
%              - (double) A vector of bounds for the axes
%
% Outputs (0):
%
% Output Plots (1): A 3x1 subplot of different extrapolation methods.
%
% Function Description:
%   Given a vector of x-valus, a vector of corresponding y-values, a
%	string of colors, and a vector describing bounds for the axes, write a
%	function called extrapCalc that extrapolates from the data using 3
%	different extrapolation methods. Your function should output 3 subplots
%	in one column. The first subplot should be titled 'Interp1: Linear' and
%	will use the function interp1 with the  method 'linear' to perform the
%	extrapolations. The second subplot should be titled 'Interp1: Cubic'
%	and will use the function interp1 with the  method 'cubic' to perform
%	the extrapolations. The third subplot should be titled 'Spline' and
%	will use spline() to perform the extrapolations.
%
%   For each method, you should perform 4 extrapolations (all of which you
%   plot), and then you should plot the originally given data. This will
%   give a total of 5 curves plotted on each subplot. The 4 extrapolations
%   you perform will all use the inputted x-values as the "new X" values
%   for extrapolation, and will only treat part of the inputted data as the
%   "original" data. The first extrapolation you perform should use the
%   first 1/5th of the data as the "original data". The second extrapolation
%   should use the first 2/5ths of the data as the "original data", etc. So
%   that you are using more and more of the original data with each
%   extrapolation, with the extrapolated curves become more and more like
%   the originally inputted data. For your "5th extrapolation" you would
%   use the first 5/5ths of the given data as your "original data" (which
%   is just using all of it), and then use the originally inputted x-values
%   as your "new x" values: but this is effectively the exact same simply
%   plotting the original data. So that's what you should do for your
%   funciton.
%   
%   You should plot your extrapolations in the following order:
%       1) The extraplation performed using first 1/5th of data.
%       2) The extraplation performed using first 2/5ths of data.
%       3) The extraplation performed using first 3/5ths of data.
%       4) The extraplation performed using first 4/5ths of data.
%       5) The original data that you were given.
%
%   And the color of your plotted lines should follow the order of the
%   colors given in the input string.  This means that the first plotted
%   line should be graphed in the first color given in the color string and
%   so on. You are guaranteed that the color string will contain exactly 5
%   characters. Additionally, the axes should be set to the range given as
%   an input. The vector for the bounds of the axes will be given in the
%   form [xMin, xMax, yMin, yMax]. Label the y-axis 'y values' and the
%   x-axis 'x values'.
%
% Notes:
%   - You are guaranteed that the inputted vector lengths will be the
%     same and will be divisible by 5.
%
% Test Cases:
% 	x1 = linspace(0, 4*pi);
%   y1 = sin(x1);
%   x2 = linspace(0, 20, 50);
%   y2 = 5.*cos(x2);
%
%   extrapCalc(x1,y1,'yrbgk', [0, 14, -2, 2]);
%       => output graph should look like extrapCalc1.png
%
%   extrapCalc(x2,y2,'rgbmk', [0, 20, -8, 8]);
%       => output graph should look like extrapCalc2.png