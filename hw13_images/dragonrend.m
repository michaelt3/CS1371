function dragonrend(fn)
im = imread(fn);

mask = im(:,:,1) == 200 & im(:,:,2) == 200 & im(:,:,3) == 200;

red = im(:,:,1);
green = im(:,:,2);
blue = im(:,:,3);

red(mask) = im(2,2,1);
green(mask) = im(2,2,2);
blue(mask) = im(2,2,3);

newim = cat(3,red,green,blue);

[name, ~] = strtok(fn, '.');
imwrite(newim, sprintf('%s_dragonrended.png',name), 'png');
end
% Inputs (1):  - (char) A string that is the filename of the input image.
%
% Outputs (0)
%
% Output files (1): - (.png) The "dragonrended" image.
%
% Function Description:
%   The dragons from Tamriel have found a way to cross the barrier between
%   fiction and reality, and have fled to Earth to avoid the Dragonborn.
%   Until the Dovahkiin too can pass through the barrier between fiction
%   and reality, we'll have to battle the dragons with technology to
%   simulate shouts. Luckily, dragons are suceptible to the dragonrend
%   shout when it's coded into a *.m file:
%
%   Write a function called dragonrend that will take in an image of an
%   earthly scene with a dragon flying overhead, and "pull the dragon to
%   the ground" by removing it from the image. The images have already been
%   edited to help isolate the dragon, and all you need to do is: (1) find
%   the dragon in the image. It will always have the constant RGB value of
%   [200 200 200], and is the only place in the image with this RGB value.
%   (2) Find the RBG value for the shade of blue that the sky has in the
%   image. This shade of blue will always be present in second pixel from
%   the left and second pixel from the top. I.e. it will be index (2,2,:)
%   of the input image. (3) Replace the dragon with the same shade of blue
%   as the sky. Simply replace all pixels of the dragon with the shade of
%   blue that was present in the top left corner of the image.
%
%   You should output a new image file of the editted image, and the naming
%   convention for this file should be:
%   '<name of input file>_dragonrended.png'
% 
% Hints:
%   - It may be helpful to take a look a the solution images first to get an
%     idea of what it should look like beforehand.
%   - Masking may be useful.
%
% Test cases:
%
%    dragonrend('Unknown - Object on the Grass.png')
%       => output image should match 
%           'Unknown - Object on the Grass_dragonrended_soln.png'
%
%    dragonrend('Raphael - Madonna del Prato.png')
%       => output image should match
%           'Raphael - Madonna del Prato_dragonrended_soln.png'