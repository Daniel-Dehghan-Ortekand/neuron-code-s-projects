close all
clear all
load spikesvec
sig = 17;
x = -50:49;
w = (1/(sqrt(2*pi)*sig))*exp((-x.^2)./(2*sig^2));
w = 1000*w./sum(w);
delta_T = 10^-3;
Rate = conv(w,spikes);
Rate2 = Rate;
Rate = Rate*delta_T;
rn = rand(size(Rate));
spk = zeros(size(rn));
df = Rate - rn;
spk(df>0) = 1;
try
for i = 1:length(spk)
w = spk(i:i+10);
if sum(w)>1
ind = find(w);
ind = ind+i-1;
for k = 2:length(ind)
dist = ind(k)-ind(1);
distSgm = 1./(1+exp(-0.4*(dist-5)));
rn = rand(1);
if distSgm < rn
spk(ind(k))=0;
end
end
end
end
catch
end
ind = find(spk);
d = zeros(1,length(ind)-1);
for i = 1:length(d)
d(i) = ind(i+1)-ind(i);
end
L = unique(d);
L = sort(L);
y = zeros(size(L));
for j = 1:length(L)
y(j) = length(find(d==L(j)));
end
figure
ax = axes;
bar(L,y)
axis([-10 length(unique(d))+5 0 100])
x = 0:length(unique(d));
p = 120*exp(-0.05*x);
hold on
plot(x,p,'linewidth',3,'color','r')
legend({"histogram(ISI)",'60*exp(-0.03*x)'},...
'fontsize',16)
xlabel('Time Intervals (ms)','fontsize',16)
ax.FontSize = 16;
figure
ax2 = axes;
x = 0:0.1:10;
y = 1./(1+exp(-0.4*(x-5)));
plot(x,y)
xlabel('Time Intervals (ms)','fontsize',16)
ax2.FontSize = 16;
ylabel('Probability factor','fontsize',16)