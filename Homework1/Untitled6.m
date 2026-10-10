w=rectwin(50);
R1=conv(w,spikes);
% subplot(5,1,3)
plot (R1)
title ('chart of firing rate with delta_t=100 mili seconds with sliding window','FontSize',12,'FontWeight','bold','Color','b')
xlabel ('time_{mili second}','FontSize',12,'FontWeight','bold','Color','b')
ylabel ('firing rate ','FontSize',12,'FontWeight','bold','Color','b')
 figure