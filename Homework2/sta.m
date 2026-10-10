clc
clear
close all
load Grendel_2011-03-04_13-56-16-t15;
fs=1/(time(4)-time(3));
spike=frate(1,:);
lfp=vv(1,:);
windowSize = 300;
spike (1: windowSize )=0; % discard spikes in first window
nEvs = sum( spike ); % binary vector , we can simply add to find number of events
evIdx = find ( spike ); % gives indexes of spikes ( where a 1 was found )
% For each event
avg=0;
for w = 1: nEvs
% Find the indexes of the time window preceding the event
wId = evIdx (w)-windowSize : evIdx (w) -1;
% Add the stim from this window to the average
avg = avg + lfp ( wId );
end
avg = avg ./ sum( spike );
figure
plot ( avg);
title ( 'Spike triggered average','FontSize',12,'FontWeight','bold','Color','b');
xlabel ('Time , points ','FontSize',12,'FontWeight','bold','Color','b');
ylabel ('Mage , arb ','FontSize',12,'FontWeight','bold','Color','b');
xlim([-100 1000])
