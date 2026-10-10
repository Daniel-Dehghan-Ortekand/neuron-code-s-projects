load Grendel_2011-03-04_13-56-16-t15;
fs=1/(time(4)-time(3));
spike=frate(1,:);
lfp=vv(1,:);
%T=300;
n=1189890;
%  qrs=zeros(n);
new_lfp=shiftdim(lfp,-300);
for i=1:n
    if spike(i)==1
        qrs(i)=spike(i).*new_lfp(i);
    end 
end 
plot(qrs)
