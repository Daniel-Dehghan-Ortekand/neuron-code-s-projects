% fs=1KHz; time demansion is m_second 
clc
close
%% 
t=1:109836;
subplot(5,1,1)
plot(t,spikes,'k')
title('chart of spikes','FontSize',16)
xlabel ('time (ms)','FontSize',16)
ylabel ('spike','FontSize',16)
% figure
%
w=rectwin(100);
R=conv(w,spikes);
subplot(5,1,2)
plot (R,'k')
title ('chart of firing rate with delta_t=100 (ms) without sliding window'...
    ,'FontSize',12)
xlabel ('time (ms)','FontSize',16)
ylabel ('firing rate ','FontSize',16)
% figure
%
w=rectwin(50);
R1=conv(w,spikes);
subplot(5,1,3)
plot (R1)
title ('chart of firing rate with delta_t=100 mili seconds with sliding window','FontSize',12,'FontWeight','bold','Color','b')
xlabel ('time_{mili second}','FontSize',12,'FontWeight','bold','Color','b')
ylabel ('firing rate ','FontSize',12,'FontWeight','bold','Color','b')
% figure
%
t1=0:109934;
w=gausswin(100);
r1=conv(w,spikes);
subplot(5,1,4)
plot(r1)
title ('chart of firing rate with gaussian window','FontSize',12,'FontWeight','bold','Color','b')
xlabel ('time_{mili second}','FontSize',12,'FontWeight','bold','Color','b')
ylabel ('firing rate ','FontSize',12,'FontWeight','bold','Color','b')
% figure
%
w=gausswin(200);
r1=conv(w,spikes);
subplot(5,1,5)
plot(r1)
title ('chart of firing rate with gaussian window','FontSize',12,'FontWeight','bold','Color','b')
xlabel ('time_{mili second}','FontSize',12,'FontWeight','bold','Color','b')
ylabel ('firing rate ','FontSize',12,'FontWeight','bold','Color','b')
 figure
%for little data 
spikes1=spikes(1:5000);
t=1:5000;
subplot(5,1,1)
plot(t,spikes1)
title('chart of spikes','FontSize',12,'FontWeight','bold','Color','b')
xlabel ('time_{mili second}','FontSize',12,'FontWeight','bold','Color','b')
ylabel ('spike','FontSize',12,'FontWeight','bold','Color','b')
axis([1,1000,0,2])
% figure
%
w=rectwin(100);
R=conv(w,spikes1);
subplot(5,1,2)
plot (R)
title ('chart of firing rate with delta_t=100 mili seconds with sliding window','FontSize',12,'FontWeight','bold','Color','b')
xlabel ('time_{mili second}','FontSize',12,'FontWeight','bold','Color','b')
ylabel ('firing rate ','FontSize',12,'FontWeight','bold','Color','b')
% figure
%
w=rectwin(50);
R=conv(w,spikes1);
subplot(5,1,3)
plot (R)
title ('chart of firing rate with delta_t=100 mili seconds without sliding window','FontSize',12,'FontWeight','bold','Color','b')
xlabel ('time_{mili second}','FontSize',12,'FontWeight','bold','Color','b')
ylabel ('firing rate ','FontSize',12,'FontWeight','bold','Color','b')
% figure
%
w=gausswin(100);
r1=conv(w,spikes1);
subplot(5,1,4)
plot(r1)
title ('chart of firing rate with gaussian window','FontSize',12,'FontWeight','bold','Color','b')
xlabel ('time_{mili second}','FontSize',12,'FontWeight','bold','Color','b')
ylabel ('firing rate ','FontSize',12,'FontWeight','bold','Color','b')
% figure
%
w=gausswin(200);
r1=conv(w,spikes1);
subplot(5,1,5)
plot(r1)
title ('chart of firing rate with gaussian window','FontSize',12,'FontWeight','bold','Color','b')
xlabel ('time_{mili second}','FontSize',12,'FontWeight','bold','Color','b')
ylabel ('firing rate ','FontSize',12,'FontWeight','bold','Color','b')

%% fano factor
% using the variable length eindow and calculate fanofactor 
for i=1:100
%     w=rectwin(i*10);
%     sig=spikes*w;
    sig=spikes(1:i);
    avg=mean(sig);
    VAR=var(sig);
    ff(i)=VAR/avg;
end 
plot(ff,'b*')
title('FanoFactor','FontSize',12,'FontWeight','bold','Color','b')
xlabel ('time_{mili second}','FontSize',12,'FontWeight','bold','Color','b')
ylabel ('FanoFactor=var/mean','FontSize',12,'FontWeight','bold','Color','b')
%% isi
for i=1:109836
    for j=i+1:109836
       if spikes(i)==spikes(j)
           ISI(i)=j-i;
           break
       end 
    end
end
Isi=sort(ISI,'descend')
plot(Isi)
title('interspike interval','FontSize',12,'FontWeight','bold','Color','b')
xlabel ('interspike interval_{mili second}','FontSize',12,'FontWeight','bold','Color','b')
%% produce spike train 
delta_t=0.001;
for i=1:5
    RAND=rand(1,5000);
    for j=1:5000
         if r1(j)*delta_t>RAND(j)
             spike_train(j)=1;
         end 
    end 
    plot(spike_train)
    title('chart of spikes','FontSize',12,'FontWeight','bold','Color','b')
    xlabel ('time_{mili second}','FontSize',12,'FontWeight','bold','Color','b')
    ylabel ('spike','FontSize',12,'FontWeight','bold','Color','b')
    axis([1,5000,0,2])
     figure
end 
% for the bigger distance
  Rand=rand(1,109935)
  for j=1:100000
         if R1(j)*delta_t>Rand(j)
             spike_train_big(j)=1;
         end 
    end 
for i=1:98000
    for j=i+1:98000
       if spike_train_big(i)==spike_train_big(j)
           ISI(i)=j-i;
           break
       end 
    end
end
Isi=sort(ISI,'descend')
plot(Isi)
title('interspike interval','FontSize',12,'FontWeight','bold','Color','b')
xlabel ('interspike interval_{mili second}','FontSize',12,'FontWeight','bold','Color','b')  



