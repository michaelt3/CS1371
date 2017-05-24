function zeroVec = vectorVortex (row, column, vector)
A = vector;
zeroVec = zeros(row, column);

top = column;
bottom = column;
left = row - 2;
right = row - 2;
topVec = A(1:column);
bottomVec = A((top + right + 1):((top+right) + bottom));
rightVec = A((top + 1):(top + right));
leftVec = A((top + right + bottom + 1):(top + right + bottom + left));
all = top + bottom + right+ left;

innerTop = column - 4;
innerBottom = column - 4;
innerRight = row - 6;
innerLeft = row - 6;

innerTopVec = A((all + 1):(all + innerTop));
innerRightVec = A((all + innerTop + 1):(all + innerTop + innerRight));
innerBottomVec = A((all + innerTop + innerRight + 1):(all + innerTop + innerRight + innerBottom));
innerLeftVec = A((all + innerTop + innerRight + innerBottom + 1):(all + innerTop + innerRight + innerBottom + innerLeft));

zeroVec(1,:) = topVec;
zeroVec((2:(row - 1)),end) = rightVec';
zeroVec(row,:) = fliplr(bottomVec);
zeroVec((2:(row -1)), 1) = fliplr(leftVec)';

zeroVec(3,(3:column-2)) = innerTopVec;
zeroVec(row-2,(3:column-2)) = fliplr(innerBottomVec);
zeroVec((4:row-3),3) = fliplr(innerLeftVec)';
zeroVec((4:row-3),end - 2) = innerRightVec;
end
% Inputs  (3): - (double) The number, n, of rows of the array
%              - (double) The number, m, of columns of the array
%              - (double) A vector of numbers
%
% Outputs (1): - (double) The vortex array
%
% Function Description:
%   Write a function called vectorVortex that creates a "vortex" of an
%   input vector. Starting with the top left corner of a n x m array, the
%   vector should create a clockwise border around the array. Then, create
%   an inner clockwise border such that a layer of zeros exists between the
%   outside and inside border. The example below illustrates this. Notice
%   that.
%
%   For example:
%      Given a vector, [1 2 3 4 5 6 7 8 9 10 11 12 ... 30 31 32], and the
%      dimensions 7 x 7:
%
%           out = vectorVortex(7,7,1:32)
%              out => [ 1     2     3     4     5     6     7
%                      24     0     0     0     0     0     8
%                      23     0    25    26    27     0     9
%                      22     0    32     0    28     0    10
%                      21     0    31    30    29     0    11
%                      20     0     0     0     0     0    12
%                      19    18    17    16    15    14    13]
%
% Notes: 
%   - The zeros function may be helpful.
%   - The vector you need will always be the necessary length.
%   - The dimensions of the array will always be large enough to fit the
%     vortex (the inner and outer borders).
%
% Test Cases:
%
%       out1 = vectorVortex(7,9,2:2:80)
%           out1 =>    [ 2     4     6     8    10    12    14    16    18
%                       56     0     0     0     0     0     0     0    20
%                       54     0    58    60    62    64    66     0    22
%                       52     0    80     0     0     0    68     0    24
%                       50     0    78    76    74    72    70     0    26
%                       48     0     0     0     0     0     0     0    28
%                       46    44    42    40    38    36    34    32    30]
%
%       out2 = vectorVortex(6,6,1:24)
%           out2 => [ 1     2     3     4     5     6
%                    20     0     0     0     0     7
%                    19     0    21    22     0     8
%                    18     0    24    23     0     9
%                    17     0     0     0     0    10
%                    16    15    14    13    12    11]
%