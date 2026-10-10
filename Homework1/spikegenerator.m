delta_t=0.001;
for i=1:5
    RAND=rand(1,5000);
    for j=1:5000
         if R(j)*delta_t>RAND(j)
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








