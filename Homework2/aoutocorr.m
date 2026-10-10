clc
clear
close all
load Grendel_2011-03-04_13-56-16-t15;
%% autocorrelation & cross correlation
fs=1/(time(4)-time(3));
spike=frate(1,:);
lfp=vv(1,:);
[r,lag] = xcorr(spike);
figure
subplot(3,1,1)
plot((lag/fs)*1000,r,'linewidth' , 2)
xlim([-200 200])
title('autocorrelation of spikes','FontSize',12,'FontWeight','bold')
xlabel ('time(ms)','FontSize',12,'FontWeight','bold')
ylabel ('autocorrelation','FontSize',12,'FontWeight','bold')
[r,lag] = xcorr(lfp);
subplot(3,1,2)
plot((lag/fs)*1000,r,'linewidth' , 2)
xlim([-2000 2000])
title('autocorrelation of lfp','FontSize',12,'FontWeight','bold')
xlabel ('time(ms)','FontSize',12,'FontWeight','bold')
ylabel ('autocorrelation','FontSize',12,'FontWeight','bold')
% cross correlation 
[r,lag] = xcorr(spike,lfp);
subplot(3,1,3)
plot((lag/fs)*1000,r,'linewidth' , 2)
xlim([-2000 2000])
title('cross-correlation of spikes&lfp','FontSize',12,'FontWeight','bold')
xlabel ('time(ms)','FontSize',12,'FontWeight','bold')
ylabel ('cross-correlation','FontSize',12,'FontWeight','bold')
%% spike triggered average 
 image=imread('sta_pattern.jpg');
 figure
 subplot(1,2,1)
 plot((-lag/fs)*1000,r,'linewidth' , 2)
xlim([-2000 2000])
 title ( 'Spike triggered average','FontSize',12,'FontWeight','bold');
 xlabel ('Time  ','FontSize',12,'FontWeight','bold','Color','b');
 subplot(1,2,2)
 imshow(image)
 title ( 'Spike triggered average sample','FontSize',12,'FontWeight','bold');
 xlabel ('Time ','FontSize',12,'FontWeight','bold');
%% estimation of firing rate 
% close all
% clear all
% load Grendel_2011-03-04_13-56-16-t15;
% lfp = vv(1,:);
% spikes = frate(1,:);
% testLength = 3000;
% st = 10000;
% sig = 17;
% x = -50:49;
% w = 50*(1/(sqrt(2*pi)*sig))*exp((-x.^2)./(2*sig^2));
% Rate = conv(w,spikes);
% ind = find(spikes);
% v2 = zeros(1,201);
% cnt = 0;
% for i = 1:length(ind)
% try
% v = lfp(ind(i)-100:ind(i)+100);
% v2 = v2 + v;
% catch
% cnt = cnt+1;
% end
% end
% v2 = v2/(length(ind)-cnt);
% figure
% plot(1:201,v2)
% xlabel('Time(ms)','fontsize',16)
% ylabel('Spike trrigered averaged','fontsize',16)
% figure
% plot(st:st+testLength,Rate(st:st+testLength)+2)
% xlabel('Time(ms)','fontsize',16)
% ylabel('Rate(Hz)','fontsize',16)
% axis([st,st+testLength,0,max(Rate)])
% L = conv(v2,lfp);
% L = max(Rate)./(1+exp(1-L));
% hold on
% plot(st:st+testLength,L(st:st+testLength))
% legend({'real firing rate','Estimat firingrate'},'fontsize',12)


