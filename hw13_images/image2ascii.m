function image2ascii(image,str)
im = imread(image);
im = double(im);
gray = (im(:,:,1) + im(:,:,2) + im(:,:,3))/3;
im = cat(3, gray, gray, gray);
im = uint8(im);

[r, c, ~] = size(im);

fh = fopen([image(1:end-4) '.txt'], 'w');

for i = 1:(r/8)
    for j = 1:(c/4)
        matrix = im((i*8-7):(i*8),(j*4-3):(j*4), :);
        avgMat = round(sum(sum(matrix))/32);
        if avgMat >= 0 & avgMat <= 31
            val = str(1);
        elseif avgMat >= 32 & avgMat <= 63
            val = str(2);
        elseif avgMat >= 64 & avgMat <= 95
            val = str(3);
        elseif avgMat >= 96 & avgMat <= 127
            val = str(4);
        elseif avgMat >= 128 & avgMat <= 159
            val = str(5);
        elseif avgMat >= 160 & avgMat <= 191
            val = str(6);
        elseif avgMat >= 192 & avgMat <= 223
            val = str(7);
        elseif avgMat >= 224 & avgMat <= 255
            val = str(8);
        end
        if j == (c/4)
            val = [val '\n'];
        end
        fprintf(fh, val)
    end
end
fclose(fh);
end
% Inputs  (2): - (char) the file name of an image to analyze
%			   - (char) a string of characters to use to make ASCII art
%
% Outputs (0)
%
% Output Files (1): - a .txt file that resembles the original image
%
% Function Description:
%   ASCII art, or using ASCII characters to create images or pictures has
%   been around since the time of typewriters, but reached peak popularity
%   on online bulletin boards in the 1970s and 1980s. ACSII art styles can
%   be divided into two big categories: line art and grayscale. We will be
%   dealing with grayscale ASCII art, in which characters are selected
%   based on their apparent intensity when viewed from a distance.
%
%   Write a function called "image2ascii" that takes in the file name of an
%   image as well as a set of characters to use and outputs a .txt file of
%   grayscale ASCII art generated from the input image using the input
%   characters. Here is the procedure for generating the art:
%
%   1) Convert the input image to grayscale by averaging the values of the
%      red, blue, and green layers. Do not truncate the values!
%   2) For each 8x4 block in the grayscale image, compute the average
%      intensity (I) of all 32 pixels and round it to the nearest integer.
%   3) Map these values to characters using the following scheme:
%        0 <= I <=  31 : input_string(1)
%       32 <= I <=  63 : input_string(2)
%       64 <= I <=  95 : input_string(3)
%       96 <= I <= 127 : input_string(4)
%      128 <= I <= 159 : input_string(5)
%      160 <= I <= 191 : input_string(6)
%      192 <= I <= 223 : input_string(7)
%      224 <= I <= 255 : input_string(8)
%   4) Print these characters to a .txt file with the same filename as the
%      input image. There should be a newline character at the end of each
%      line.
%
% Notes:
%   - The input image will always be evenly divisible into 8x4 blocks
%   - The input string will always have 8 characters
%
% Hints:
%   - Do *not* use the built-in function rgb2gray. Submissions using
%     rgb2gray will receive 0 credit.
%   - If you want to admire your handiwork, you will have to open the .txt
%     file in a text editor and use a fixed width font (e.g. Courier New)
%     with a very small size (e.g. 4-8). Additionally, you may need to
%     tweak the word wrap settings or change the window size. Opening it in
%     MATLAB should work as well.
%   - To check your output against the solution output, select both .txt
%     files in the MATLAB Current Folder panel, right click, and select
%     "Compare Selected Files/Folders"
%   
% Test Cases:
%
%   image2ascii('abe.jpg', '@8XYv:. ');
%     => output file named 'abe.txt' identical to 'abe_soln.txt'
%
%   image2ascii('buzz.jpg', 'BbUuZz. ');
%     => output file named 'buzz.txt' identical to 'buzz_soln.txt'
%
%   image2ascii('wreck.jpg', '@8XYv:. ');
%     => output file named 'wreck.txt' identical to 'wreck_soln.txt'