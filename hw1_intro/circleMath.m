function [area, perim] = circleMath(diam)

r = diam ./ 2;          %sets value for radius using diameter
area = pi .* (r .^ 2);  %sets value for area
perim = pi .* diam;     %sets value for perim

end