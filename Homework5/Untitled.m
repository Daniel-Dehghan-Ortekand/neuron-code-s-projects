pd1 = makedist('Normal','mu',0,'sigma',2.8) ;
x1 = -10 : 0.01 : 10 ;
y1 = pdf(pd1,x1) ;

%% 
pd2 = makedist('Normal','mu',0,'sigma',2.8) ;
x= -10 : 0.01 : 10 ;
y = cdf(pd2,x) ;
subplot(2,1,1)
plot(x1,y1,'LineWidth',2,'color','k')
xlabel('S')
ylabel('p(r)')
title('Pdf for S stimulant','FontSize',14)
set(gca,'fontname','times new roman','fontsize',14)
subplot(2,1,2)
plot(x,y,'LineWidth',2,'color','k')
xlabel('S')
ylabel('f(s)')
title('Cdf for S stimulant','FontSize',14)
set(gca,'fontsize',14)
