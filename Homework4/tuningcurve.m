clc
clear
sig = 1;
x = -5:0.01:5;
clr = {'r','b',[1 0.5 0],'g','k','c','m',[0.8 0.5 0.2]... 
    ,[0.9 0.9 0],[0.5 0.5 0.5],[0.1 0.2 0.8]};
for i = -5:1:5
w = (1/.4)*(1/(sqrt(2*pi)*sig))*exp((-(x-i).^2)./(2*sig^2));
plot(x,w,'color','black','linewidth',2)
hold on
end
title('tuning curve for 11 neuron ','FontSize',12)
xlabel('S','fontsize',14)
ylabel('f_a(s)','fontsize',14)
