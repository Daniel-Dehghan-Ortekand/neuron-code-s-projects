clc 
clear
close all
 pd1 = makedist('Normal','mu',0,'sigma',0.1) ;
 pd2 = makedist('Normal','mu',0,'sigma',0.1342) ;
 x1 = -0.9: 0.01 : 0.9 ;
 y1 = pdf(pd1,x1) ;
x2 = -0.9 : 0.01 : 0.9 ;
 y2 = pdf(pd2,x2) ;
 y=y1-y2;
 plot(x1,y1,x2,y2,x1,y,'LineWidth',2)
 figure;
 plot(x1,y,'LineWidth',2,'color','k')
  set(gca,'fontsize',14)
 xlabel('Cortical distance')
 ylabel('K')
 title('cortical locations corresponding to the indices a and a`','FontSize',14)
 
  ffd = fft(y);
  mffd = abs(ffd);
  figure;
  plot(mffd(1:181),'LineWidth',2,'color','k')
  set(gca,'fontsize',14)
 xlabel('k (1/mm)')
 ylabel('F(K)')
 title('Fourier transform of K','FontSize',14)
  xlim([0 20])
  z=cos(2.5*pi*x1);
  figure
  plot(x1,y,'LineWidth',2,'color','k')
   hold on
% figure
  plot(x1,z,'-.','LineWidth',2,'color','k')
  hold off
 xlabel('Cortical distance')
 ylabel('K,e')
  set(gca,'fontsize',14)
