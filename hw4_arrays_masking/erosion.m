function new = erosion(topsoil, bedrock, factor)
leftover = (topsoil - bedrock) - factor;
final = bedrock + leftover;
negative = final < bedrock;
final(negative) = bedrock(negative);
new = final;
end

% Inputs  (3): - (double) An MxN array representing the heights of the
%                         topsoil in a particular area
%              - (double) An MxN array representing the heights of the
%                         bedrock in the same area underneath the topsoil 
%              - (double) An erosion factor
% Outputs (1): - (double) An MxN array representing the new heights of the
%                         topsoil with the applied erosion factor
%
% Function Description:
%   Write a function that takes in arrays representing the heights of
%   topsoil and bedrock of the same area and an erosion factor, and outputs
%   the new heights of topsoil with the applied erosion factor. Assume
%   that the topography is uniformly eroded by subtracting the erosion
%   factor from each element of the topsoil array. Since topsoil erodes 
%   much more easily than bedrock, the erosion factor can completely erode
%   the topsoil but should not affect the bedrock.
%   For example, for a particular spot that has a topsoil of 34, bedrock of
%   10, and erosion factor of 26, the new height should be 10 and not 8.
%
% Notes: 
%   - Topsoil and bedrock arrays are guaranteed the same size
%
% Hints:
%   - Logical indexing might be useful
%
% Test Cases:
%
%       topsoil1 = [20 30 40; 41 21 32;40 25 20];
%       bedrock1 = [10 9 11; 12 15 13; 11 9 13];
%       factor1 = 8;
% 
%       out1 = erosion(topsoil1, bedrock1, factor1)
%           out1 => [12 22 32
%                    33 15 24
%                    32 17 13]
%
%       topsoil2 = [100 107 95; 105 106 90; 115 103 82];
%       bedrock2 = [50 50 50; 50 50 50; 50 50 50];
%       factor2 = 54;
%
%       out2 = erosion(topsoil2, bedrock2, factor2)
%           out2 => [50 53 50
%                    51 52 50
%                    61 50 50]