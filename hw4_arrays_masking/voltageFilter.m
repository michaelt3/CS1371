function [meanVolts , needFix] = voltageFilter(volts1, volts2, volts3)

testDef = volts1 == volts2 & volts2 == volts3;

testRandNoise = volts1 < 1; 
volts1(testRandNoise == 1) = 0;               %Mask for where defective in volts1
volts2(testRandNoise == 1) = 0;               %Mask for where defective in volts2
volts3(testRandNoise == 1) = 0;               %Mask for where defective in volts3

randSpike1 = volts1 > (3 .* mean(mean(volts1))); 
randSpike2 = volts2 > (3 .* mean(mean(volts2)));
randSpike3 = volts3 > (3 .* mean(mean(volts3)));

volts1(volts1 > (3 .* mean(mean(volts1)))) = 0;
volts2(volts2 > (3 .* mean(mean(volts2)))) = 0;
volts3(volts3 > (3 .* mean(mean(volts3)))) = 0;

meanVolts = (volts1 + volts2 + volts3) ./ 3;

dummyMeanVolts = meanVolts;
dummyMeanVolts(dummyMeanVolts == 0) = [];

avgVolts = mean(mean(dummyMeanVolts));
meanVolts(testDef) = avgVolts;
meanVolts(randSpike1) = avgVolts;
meanVolts(randSpike2) = avgVolts;
meanVolts(randSpike3) = avgVolts;

needFix = zeros(size(volts1));
needFix(testDef == 1) = 2;
needFix(randSpike1 == 1 | randSpike2 == 1 | randSpike3 == 1) = 1;
end


% Inputs  (3): - (double) An array of voltage readings from an array of
%                         electrical sensors at time = 1 second.
%              - (double) The voltages of the same array of sensors, but at
%                         time = 2 seconds.
%              - (double) The voltages of the same array of sensors, but at
%                         time = 3 seconds.
%
% Outputs (2): - (double) An array of filtered and averaged voltage data.
%              - (double) An array telling you what to fix: 0's where
%                         sensors are fine, 1's where a sensor encounted a
%                         "random spike", and 2's where a sensor is
%                         defective.
%
% Function Description:
%   Imagine you are an engineer using an array of piezo-electric sensors to
%   convert strain in a material to voltage signals, and thus study this
%   material's response to external loads. If none of that last sentence
%   made sense, then don't worry, I'll walk you through the function you
%   need to write:
% 
%   Your inputs will be three arrays of the same size, where each array
%   represents voltage readings from your array of sensors (so the top left
%   index of the array is the voltage reading of the top-left sensor). The
%   reason there are three input arrays is because each array is the
%   voltage readings at a different point in time. **The main  goal of the
%   function is to output an array of the mean-voltage with respect to time
%   at each location (as in: an array that is the average of the three input
%   arrays).** In doing this, you will need to filter reasonable voltage
%   readings from values that are too small to matter, and values that are
%   too large to be realistic. There are also two other things your function
%   needs to do: (1) find where a sensor gave the exact same voltage
%   reading for all three points in time (i.e. if the top left value for
%   all three inputs is the exact same). This means that the sensor is
%   defective and will need to be replaced. (2) Output an array to help you
%   fix what needs to be fixed. In real life this array could be used to
%   help you go replace defective sensors and re-calibrate sensors that
%   recorded voltages that are way too high.
% 
%   List of things your function needs to do:
%
%       -Find any locations in the size of the array that have the exact
%        same value for all three inputs. (example: if the top left corner
%        of all three inputs is the same exact value, then the top left
%        corner would be one of these locations)
%
%       -Filter out "random noise". "Random noise" simply means that the
%        voltage reading from a specific sensor is really really small. So
%        these will be any values in your inputs that are less than 1. (None
%        of these locations will coincide with the exact-same-value
%        locations described in last bullet point.) Set these locations to
%        0. A sensor experiencing "random noise" will experience random
%        noise at all points in time, so these locations will be consistent
%        from input to input.
%
%       -Filter out "random spikes". To do this, you will have to find the
%        average value of all three input arrays independently, and find
%        locations in the input arrays where the value there is more than 3
%        times that array's average. Set these locations to 0 in each
%        array. Also: Save these locations as you will need them later,
%        even if there was only a random spike in one of the inputted
%        arrays.
%
%       -Now that your data has been filtered, it's time to average the
%        three input arrays together to find the mean-voltage of every
%        sensor. (An array that is the average of the three inputs.) This
%        is the main point of the function.
%
%       -Once you do that, you can find the overall average voltage. As in:
%        find an array that is the average of the three inputted arrays, as
%        described in the last bullet point, and then find the average
%        value of this average-array. You will need to exclude 0's from
%        this average calculation. You will use this overall average value
%        to replace the mean-voltage reading from locations with defective
%        sensors or that encountered "random spikes". You will then have
%        your first output.
%
%       -Finally, you will need an array of what to fix. This should be an
%        array of 0's, 1's, and 2's. Remember how you had to find locations
%        of defective sensors that had the exact same value for all three
%        inputs? Those will be 2's in this array. Remember how you had to
%        find locations that encountered "random spikes" of really really
%        high voltages? Those will be 1's in this array. Besides that,
%        the rest of this array will be 0's. This is your second output.
%
% Example (with vectors instead of arrays):
%
%   volts1 = [.23 .45 27 29 25 29 .76 .45];
%   volts2 = [.19 .39 29 30 25 100000 .5 .1];
%   volts3 = [.87 .24 28 31 25 25 .37 .4];
%
%   The value of 100000 in volts2 would be an example of a "random spike".
%   The first two values and last two values in each vector are examples of
%   "random noise". The location in the vectors with the value of 25 for
%   all three is an example of a "defective sensor". The two outputs of
%   this function would be:
%
%   out1 = [0 0 28.0000 30.0000 25.2500 25.2500 0 0]
%   out2 = [0 0 0 0 2 1 0 0]
%
% Notes:
%   - You may assume that all "random noise" voltage readings will be
%     different (i.e. you don't need to worry about these sensors being
%     defective).