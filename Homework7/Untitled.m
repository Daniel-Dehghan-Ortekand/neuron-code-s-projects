clc;
clear;
close all;
x=-10:0.1:10;
% return
y=cos(0.6*(x+10));
plot(x,y,'linewidth',2,'color','k')
xlabel('s')
ylabel('h')
set(gca,'fontsize',14)
