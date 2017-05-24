function out = pickSong(fn,str)
min1 = str2num(str(1));
sec1 = str2num(str(end-1:end));
secLeft1 = min1*60 + sec1;
oldDist = 1000000;

fh = fopen(fn, 'r');
line = fgetl(fh);

while ischar(line)
    min2 = str2num(line(end-3));
    sec2 = str2num(line(end-1:end));
    secLeft2 = min2*60 + sec2;
    newDist = abs(secLeft1 - secLeft2);
    
    if newDist < oldDist
        index1 = find(line == '.') + 2;
        index2 = find(line == '-') - 2;
        songName = line(index1:index2);
        if length(index2) == 2
            songName = line(index1:index2(2));
        end
        if length(index2) == 3
            songName = line(index1:index2(3));
        end
        oldDist = newDist;
    end
        
    line = fgetl(fh);
end
out = songName;
fclose(fh);
end

% Inputs (2):  - (char) filename of the text file containing the tracklist
%                (char) string indicating the remaining time
%
% Outputs (1): - (char) A string indicating the song that is closest to the
%                       input time. 
%
% Function Description:
%   Imagine you are a MATLAB-loving DJ. You look at the time and see that
%   you have X amount of time left in your DJ set. You will take the
%   tracklist of an album and will play the song closest to that amount of
%   time.
%
%    The tracklist will be a text file each line containing the title of
%    the song and the track length as follows:
%
%       6. Shake It Off - 3:39
%
%   The function you create will have two inputs, a string indicating
%   the file containing the tracklist and another string indicating time
%   left formatted as minute:seconds. Your function should output the title
%   of the song that is chosen as a string.
%
% Notes:
%   - Be careful with songs that may have '-' or ':' in their titles.
%   - Songs CAN be longer than the time remaining. You just need the song
%     with the closest track length.
%   - If two or more tracks are the closest to the remaining time, output 
%     the track that is listed the earliest.
%
% Test Cases
%
%   song1 = pickSong('Funeral.txt', '3:13')
%       song1 => 'Neighborhood #2 (Laika)'
%
%   song2 = pickSong('Funeral.txt', '5:01')
%       song2 => 'Rebellion (Lies)'
%
%   song3 = pickSong('Resistance.txt', '3:57')
%       song3 => 'Exogenesis: Symphony Part 2 (Cross-Pollination)'
