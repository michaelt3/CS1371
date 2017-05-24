function greenScreen(fn1, fn2, vec)
im1 = imread(fn1);
im2 = imread(fn2);

valR = vec(1);
valG = vec(2);
valB = vec(3);

mask = im1(:,:,1) == valR & im1(:,:,2) == valG & im1(:,:,3) == valB;

red1 = im1(:,:,1);
green1 = im1(:,:,2);
blue1 = im1(:,:,3);

red2 = im2(:,:,1);
green2 = im2(:,:,2);
blue2 = im2(:,:,3);

red1(mask) = red2(mask);
green1(mask) = green2(mask);
blue1(mask) = blue2(mask);

newim = cat(3,red1,green1,blue1);
[name,~] = strtok(fn1, '.');
imwrite(newim,sprintf('%s_new.png',name),'png');
end
% Inputs (3):  - (char) file name for the original image -- Image 1
%              - (char) file name for the image that will be overlayed onto 
%                       the original image -- Image 2
%              - (double) 1x3 vector of an RGB value to replace in Image 1.
%             
%
% Outputs (0): - none
%
% Output Files (1): - (.png) A modified image with the necessary pixels
%                            from Image 2 overlayed onto Image 1.
%
% Function Description:
%   Chroma keying, more commonly known as green screening, is a special
%   effects technique for layering two images together based on a color.
%   Basically, a computer program looks at one image for a specific color,
%   and replaces those pixels with the corresponding pixels from a new
%   image of the same size.
%
%   Now to the fun stuff: 
%   You recently started a job as a webcaster for a new-age Pokemon series,
%   and there's absolutely no way that you can air a show like that without
%   the classic "Who's that Pokemon!?" bit! You also graduated from Georgia
%   Tech with an awesome engineering degree so your weapon of choice is
%   obviously MATLAB. So you set out to write a function that will
%   emulate this green screen functionality.
%
%   The first input is a file name for the original image, which will be
%   the "background" of the modified image. You will need to find all of
%   the pixels in this image that match an RGB value specified by the third
%   input, which has the format of [R, G, B] in a vector. There will be a
%   significant portion of the image that matches this RGB value. All of
%   the pixels that match the specified RGB value are then replaced with
%   corresponding pixels from the second input image. (As in, the images
%   are the same size and you replace those pixels in Image 1 with pixels
%   at the same indices in Image 2.)
%   
%   The modified image should then be outputted to a new image file, which
%   needs a file name of the following format:
%   '<originalImageName>_new.png', where you use the name of Image 1 as
%   your orignalImageName (without its *.png extension, obviously).
%
% Notes:
%   - Masking Masking Masking!
%   - Both images are guaranteed to have the same dimensions.
%
%  Test Cases:
%
%   greenScreen('pokemon1.png', 'pokemon1_view.png', [30 30 30]);
%       'pokemon1_new.png' should look like 'pokemon1_new_soln.png'
%
%   greenScreen('pokemon2.png', 'pokemon2_view.png', [30 30 30]);
%       'pokemon2_new.png' should look like 'pokemon2_new_soln.png'
%
%   greenScreen('pokemon3.png', 'pokemon3_view.png', [30 30 30]);
%       'pokemon3_new.png' should look like 'pokemon3_new_soln.png'