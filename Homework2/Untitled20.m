clc
clear
load Grendel_2011-03-04_13-56-16-t15;
fs=1/(time(4)-time(3));
spike=frate(1,:);
lfp=vv(1,:);
% qrs=conv(spike,lfp);
% n=0;
% for i=1:1189890
%     if spike(i)==1
%         n=n+1;
%     end 
%     
% end 
% r=n/(length(time)/fs);
% c=qrs/r;
% figure;
% plot(c)
% % r_est=c.*spike;
% % figure;
% % plot(r_est)
a=0;
avg=0;
for i=1:length(time)
    if spike(i)==1
%         new_lfp=[lfp(i-10),lfp(i-9),lfp(i-8),lfp(i-7),lfp(i-6),lfp(i-5),lfp(i-4),lfp(i-3),lfp(i-2),lfp(i-1),lfp(i),lfp(i+1),lfp(i+2),lfp(i+3),lfp(i+4),lfp(i+5),lfp(i+6),lfp(i+7),lfp(i+8),lfp(i+9),lfp(i+10)];
         new_lfp=lfp(i-(10):i+(20));
avg=avg+new_lfp;
        a=a+1;
    end 
end 
sta=avg/a;
plot(sta)