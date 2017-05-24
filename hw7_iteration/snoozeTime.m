function out = snoozeTime(sleep, alarm, snooze, class)

[sleepH,sleepM] = strtok(sleep,':');
sleepM(1) = '';
sleepH = str2num(sleepH);
sleepM = str2num(sleepM);

[alarmH,alarmM] = strtok(alarm,':');
alarmM(1) = '';
alarmH = str2num(alarmH);
alarmM = str2num(alarmM);

[classH,classM] = strtok(class,':');
classM(1) = '';
classH = str2num(classH);
classM = str2num(classM);

if sleepM > alarmM
    hours = alarmH - sleepH - 1;
    mins = 60 - sleepM + alarmM;
    total1 = hours * 60 + mins;
end

if sleepM < alarmM
    hours = alarmH - sleepH;
    mins = alarmM - sleepM;
    total1 = hours * 60 + mins;
end
%snooze starts here

if alarmM > classM
    hours2 = classH - alarmH - 1;
    mins2 = 60 - alarmM + classM;
    total2 = hours2 * 60 + mins2 - 20;
end

if classM > alarmM
    hours2 = classH - alarmH;
    mins2 = classM - alarmM;
    total2 = hours2 * 60 + mins2 - 20;
end

c = 0;
while total2 >= snooze
    total2 = total2 - snooze;
    total1 = total1 + snooze;
    c = c + 1;
end
out = c;
if total1 > 480
    out = 0;
end

% Inputs (4):  - (char) The time at which you fall asleep
%              - (char) The time for which your alarm is set
%              - (double) The length of your clock's snooze function (mins)
%              - (char) The time of your first class
%
% Outputs (1): - (double) An integer of how many times you can "snooze"
%
% Function Description:
%   It's been another late night studying for midterms and coding matlab,
%   but, alas, it is finally time to hit the sack (hooray!).  In
%   preparation for your big test day tomorrow, one of the last things you
%   want to do before falling asleep is to determine how many times you can
%   hit the snooze button in the morning.  You want at least 8 hours of
%   sleep, if possible (but no more in case you want to do some last minute
%   studying in the morning). However, you must wake up at least 20 minutes
%   before your first class starts, and if this means less than 8 hours of
%   sleep then you'll just have to be sleep deprived.  So how many times
%   can you snooze? Take into account the time you begin to sleep (after
%   midnight, of course), the time your alarm is set, the length of your
%   clock's snooze function, and the time of your first class to
%   iteratively determine how many times you can Keep the Dream Alive!
%
% Notes:
%   - All times will be written on a 24 hour scale. So a time 1:40 pm would
%     be a string of '13:40'.
%   - You must "wake up" at least 20 minutes before your first class. If
%     hitting snooze again would put you past that, then you cannot hit
%     snooze again.
%   - It is guaranteed that the time your alarm is set for will always be
%     at least 20 minutes before your first class starts.
%   - Time spent snoozing counts as "sleeping". Your function should stop
%     hitting snooze at 8 hours past your bedtime (if applicable). Your
%     function should always return 0 if your "alarm time" (the 2nd input)
%     is more than 8 hours after your "bedtime" (the 1st input).
%
% Hints:
%   - Don't forget that time is not measured in 100's (but 60's)
%
% Test Cases:
%
%   [numberOfSnoozes1] = snoozeTime('3:25', '9:05', 10, '10:00');
%       numberOfSnoozes1 = 3;
%       
%   [numberOfSnoozes2] = snoozeTime('0:00', '6:30', 7, '8:00');
%       numberOfSnoozes2 = 10;
%
%   [numberOfSnoozes3] = snoozeTime('1:05', '9:20', 5, '10:30');
%       numberOfSnoozes3 = 0;