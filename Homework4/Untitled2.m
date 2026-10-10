clear all
close all
sig = 1;
L = 2000;
x = -5:0.01:5;
xx = zeros(1,11);
for i = -5:1:5
w = .4*(1/.4)*(1/(sqrt(2*pi)*sig))*exp((-(x-i).^2)./(2*sig^2));
fa = w(x==0);
spikes = zeros(1,L);
ind = find(fa-rand(1,L)>0);
spikes(ind) = 1;
xx(i+6) = length(ind)/L;
ax = subplot(11,1,i+6);
for j = 1:length(ind)
    plot([ind(j),ind(j)],[0,1],'color','r')
hold on
end
ax.TickLength = [0 0];
ax.YTickLabel = [];
title(['a = ',num2str(i+6)])
axis([1,L,0,1])
end
xlabel('t(ms)','fontsize',14)
figure
xx = xx/0.4;
for i = -5:5
plot(i,xx(i+6),'ko','MarkerSize',10,'MarkerFaceColor','k')
hold on
end
hold on
w = (1/.4)*(1/(sqrt(2*pi)*sig))*exp((-(x-0).^2)./(2*sig^2));
plot(x,w,'color','k','linewidth',2)
title('Firing rate for 11 neuron ','FontSize',16)
xlabel('S_a','fontsize',14)
ylabel('r_a/r_m_a_x','fontsize',14)