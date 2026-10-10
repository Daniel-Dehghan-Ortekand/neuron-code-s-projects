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
