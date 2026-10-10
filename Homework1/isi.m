
for i=1:109836
    for j=i+1:109836
       if spikes(i)==spikes(j)
           ISI(i)=j-i;
           break
       end 
    end
end
Isi=sort(ISI,'descend')
plot(Isi)
title('interspike interval','FontSize',12,'FontWeight','bold','Color','b')
xlabel ('interspike interval_{mili second}','FontSize',12,'FontWeight','bold','Color','b')
