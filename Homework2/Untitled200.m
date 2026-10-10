load Grendel_2011-03-04_13-56-16-t15;
lfp = vv(1,:);
spikes = frate(1,:);
figure(1)
[auto_Spikes,lg] = xcov(spikes,10000,'coef');
plot(lg,auto_Spikes)
xlabel('Time(ms)','fontsize',16)
ylabel('Auto Correlation of spikes','fontsize',16)
figure(2)
[auto_lfp,lg] = xcov(lfp,10000,'coef');
plot(lg,auto_lfp)
xlabel('Time(ms)','fontsize',16)
ylabel('Auto Correlation ofStimulus','fontsize',16)
figure(3)
[Spikes_lfp,lg] = xcov(spikes,lfp,10000,'coef');
plot(lg,Spikes_lfp)
hold on
plot([0 0],[-.1 .2],'linewidth',2,'color','r')
xlabel('Time(ms)','fontsize',16)
ylabel('Cross Correlation of spikes and stimulus','fontsize',16)
ind = find(spikes);
v2 = zeros(1,201);
cnt = 0;
for i = 1:length(ind)
try
v = lfp(ind(i)-100:ind(i)+100);
v2 = v2 + v;
catch
cnt = cnt+1;
end
end
v2 = v2/(length(ind)-cnt);
hold on
plot(-10:10,v2)
xlabel('Time(ms)','fontsize',16)
legend({'Cross Correlation of spikes andstimulus','Spike trrigeredaverage'},'fontsize',12)