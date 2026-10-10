close all
clear all
load Grendel_2011-03-04_13-56-16-t15;
lfp = vv(1,:);
spikes = frate(1,:);
testLength = 3000;
st = 10000;
sig = 17;
x = -50:49;
w = 50*(1/(sqrt(2*pi)*sig))*exp((-x.^2)./(2*sig^2));
Rate = conv(w,spikes);
figure(1)
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
% plot(-100:-1,v2)
plot(1:201,v2)
xlabel('Time(ms)','fontsize',16)
ylabel('Spike trrigered averaged','fontsize',16)
figure(2)
plot(st:st+testLength,Rate(st:st+testLength)+2)
xlabel('Time(ms)','fontsize',16)
ylabel('Rate(Hz)','fontsize',16)
axis([st,st+testLength,0,max(Rate)])
L = conv(v2,lfp);
L = max(Rate)./(1+exp(1-L));
hold on
plot(st:st+testLength,L(st:st+testLength))
legend({'real firing rate','Estimat firingrate'},'fontsize',12)