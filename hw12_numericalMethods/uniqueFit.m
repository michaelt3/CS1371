function uniqueFit(x, y)
axis square

n = length(y);
rows = ceil((n - 1) / 2);
low = min(x);
high = max(x);


for i = 1:n-1
    subplot(rows,2,i)
    plot(x,y,'rx')
    hold on
    coeff = polyfit(x,y,i);
    xi = linspace(low,high);
    yi = polyval(coeff,xi);
    plot(xi,yi)
    title(sprintf('Order %d Fit', i))
end
%
% Inputs  (2): - (double) x-data
%              - (double) y-data 
%
% Outputs (0): - None
%
% Output Plots (1): Plot of the different subplots leading to a unique fit
%
% Function Description:
%   Write a function called "uniqueFit" that takes in x and y data and
%   creates a plot of all of the polynomial curve fits up to and including
%   the "unique" fit. Each fit will be its own subplot, with two
%   subplots per row. The "unique" fit is when the order of the fit is
%   one less than the number of points you are fitting the polynomial to.
%
% Specifics:
%   - Plot all the original points in each subplot with red "x"s.
%   - Plot all polynomial fits as black lines.
%   - Use 100 linearly spaced points between the smallest and largest x 
%     value for new x values when you are plotting the polynomial fit
%     curves.
%   - The title of the fitted plots should read 'Order __ Fit', where the
%     blank is the ordinal number of the fit. Example, a first order fit
%     should read 'Order 1 Fit', while second order fit will read 'Order 2
%     Fit' and so on.
%   - x-values are not guaranteed to be in any particular order, but the
%     1st x-value will correspond to the 1st y-value and so on.
%   - Use "axis square" for your axes. If your plots' data is all the same
%     as that pictured in the solution image, and you did "axis square",
%     then you will receive credit for your plot even if it looks slightly
%     different than the solution image.
%
% Notes:
%   - You may assume that you are to begin with a 1st order fit, i.e. that
%     the input vector is a length of at least 2. Note that even though
%     only one plot will exist when the input vector is of length 2, you
%     must still adhere to the rule that there are to be enough space for
%     two subplots per row.
%   - You may assume that the input vectors are the same size.
%   - If your plot looks different than the solution plot image, try
%     resizing the figure window. Matlab will automatically adjust your
%     plot when you resize the figure window. The solution plots had their
%     figure windows resized to make them easier to see before they were
%     saved to *.png files.
%
% Test Cases:
%
%   uniqueFit(1:5,[5 1 15 9 8])
%       => should look like uniqueFit_testCase1_plotSolution.png
%
%   uniqueFit([1 6 2 4 9 8 5 3], [0.5 0.9 1.5 2.0 0.1 0.1 1.3 0.2])
%       => should look like uniqueFit_testCase2_plotSolution.png
%
%   uniqueFit([0.2 0.5 1.2 1.6 2.6 9.6],[1 3 1 6 7 0.1])
%       => should look like uniqueFit_testCase3_plotSolution.png