close all
clear all
load spikesvec
spikes1=spikes(1:5000);
t=1:5000;
subplot(5,1,1)
plot(t,spikes1,'k')
title('spikes','FontSize',12)
xlabel ('time (ms)','FontSize',12)
ylabel ('spike','FontSize',12)
% figure
%
w=rectwin(100);
R=conv(w,spikes1);
subplot(5,1,2)
plot (R,'k')
title ('firing rate with delta_t=100 (ms) without sliding window','FontSize',12)
xlabel ('time (ms)','FontSize',12)
ylabel ('firing rate ','FontSize',12)
axis([1,5000,0,7])
% figure
%
w=rectwin(50);
R=conv(w,spikes1);
subplot(5,1,3)
plot (R,'k')
title ('firing rate with delta_t=100 (ms) with sliding window','FontSize',12)
xlabel ('time (ms)','FontSize',12)
ylabel ('firing rate ','FontSize',12)
axis([1,5000,0,7])
% figure
%
w=gausswin(100);
r1=conv(w,spikes1);
subplot(5,1,4)
plot(r1,'k')
title ('firing rate with gaussian window','FontSize',12)
xlabel ('time (ms)','FontSize',12)
ylabel ('firing rate ','FontSize',12)
axis([1,5000,0,7])
% figure
%
w=gausswin(200);
r1=conv(w,spikes1);
subplot(5,1,5)
plot(r1,'k')
title ('firing rate with soft gaussian window','FontSize',12)
xlabel ('time (ms)','FontSize',12)
ylabel ('firing rate ','FontSize',12)
axis([1,5000,0,7])
%% 
figure
delta_t=0.001;
plot(r1,'k')
hold on
for i=1:5
    RAND=rand(1,5000);
    for j=1:5000
         if r1(j)*delta_t>RAND(j)
             spike_train(j)=1;
         end 
    end 
    subplot(5,1,i)
    plot(spike_train,'r')
    hold on 
    plot(r1,'k')
    hold off
    title('chart of spikes','FontSize',12)
    xlabel ('time (ms)','FontSize',12)
    ylabel ('spike','FontSize',12)
     axis([1,5000,0,7])
%      figure
end 
% % for the bigger distance
%   Rand=rand(1,5199)
%   for j=1:100000
%          if r1(j)*delta_t>Rand(j)
%              spike_train_big(j)=1;
%          end 
%     end 
% for i=1:98000
%     for j=i+1:98000
%        if spike_train_big(i)==spike_train_big(j)
%            ISI(i)=j-i;
%            break
%        end 
%     end
% end
% Isi=sort(ISI,'descend')
% plot(Isi)
% title('interspike interval','FontSize',12,'FontWeight','bold','Color','b')
% xlabel ('interspike interval_{mili second}','FontSize',12,'FontWeight','bold','Color','b')
