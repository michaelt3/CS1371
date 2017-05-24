function out = checkImage(fn1, fn2)
im1 = imread(fn1);
im2 = imread(fn2);

[row1, col1, ~] = size(im1);
[row2, col2, ~] = size(im2);

if row1 ~= row2
    out = 'The images have different dimensions.';
elseif col1 ~= col2
    out = 'The images have different dimensions.';
end

if row1 == row2 && col1 == col2
    red1 = im1(:,:,1);
    green1 = im1(:,:,2);
    blue1 = im1(:,:,3);
    red2 = im2(:,:,1);
    green2 = im2(:,:,2);
    blue2 = im2(:,:,3);

    maskBlack = im1(:,:,1)~=im2(:,:,1) | im1(:,:,2)~=im2(:,:,2) | im1(:,:,3)~=im2(:,:,3); 

    red = im1(:,:,1);
    green = im1(:,:,2);
    blue = im1(:,:,3);

    red(maskBlack) = 0;
    green(maskBlack) = 0;
    blue(maskBlack) = 0;

    red(~maskBlack) = 255;
    green(~maskBlack) = 255;
    blue(~maskBlack) = 255;

    if red1 == red2 & green1 == green2 & blue1 == blue2
        out = 'The images are the same.';
    else
        newim = cat(3,red,green,blue);
        [name1, ~] = strtok(fn1, '.');
        [name2, ~] = strtok(fn2, '.');
        
        imwrite(newim, sprintf('%s_vs_%s.png',name1, name2), 'png') 
        out = ['The RBG values are different: see ' sprintf('%s_vs_%s.png',name1, name2)];
    end
end
end
% Inputs  (2): - (char) the name of an image file: Image 1
%              - (char) the name of a second image file: Image 2
%
% Outputs (1): - (char) A sentence comparing the two images
%
% Output Files (1): - (.png) An image highlighting the differences between
%                            the two input images. Not outputted if no
%                            differences exist or image sizes are
%                            different.
%
% Function Description:
%  Given two images, write a function called "checkImage" that determines 
%  if the two images are the same, and if they are different, then how. 
%
%  - If the two images are completely identical, the output should read
%    'The images are the same.' and no output image should be created.
%  - If the two images do not have the same dimensions, the output should
%    read 'The images have different dimensions.' and no output image
%    should be created.
%  - If the two images have the same dimensions, but are not the same
%    image, then there are two things you will need to do:
%    (1) Create an output image that highlights the differences between the
%    two images. This image should be exclusively black and white, where it
%    is white everywhere that the two images have the same RGB values, but
%    black wherever the RGB values of the images differ. This image should
%    be named by the following naming convention:
%    '<imageName1>_vs_<imageName2>.png.'
%    (2) Output the string 'The RBG values are different: see %s.',
%    where you should print the name of your output file into the '%s'.
%
% Notes:
%  - You should only output an image if the files are the same size but
%    differing images.
%
% Hints:
%  - It is not necessary to use iteration for pixel-by-pixel comparisons.
%    This will make your code run very slowly and is inefficient. Taking
%    the extra time to figure out how to use logical masking instead will
%    make your code much simpler to write, run more quickly, and just be
%    better in all ways.
%  - This function should be useful for the rest of your homework.
%
% Test cases:
%
%   out1 = checkImage('apples.png', 'oranges.png');
%       out1 => 'The images have different dimensions.'
%          - No output file created.
%
%   out2 = checkImage('flower1.png', 'flower2.png');
%       out2 => 'The images are the same.'
%          - No output file created.
%
%   out3 = checkImage('oranges.png', 'tangerines.png');
%       out2 => 'The RGB values are different: see oranges_vs_tangerines.png.'
%          - oranges_vs_tangerines.png should look like
%            oranges_vs_tangerines_soln.png