% clc
% clear
% close all
load Grendel_2011-03-04_13-56-16-t15;
n=0;
for i=1:1189890
    if spike(i)==1
        n=n+1;
    end 
    
end 
%step 200
% for j=1:5950
%     q_rs=
% end 
% q_rs=avg*n;
% d=q_rs;
 s=shiftdim(spike,300);
%  q_rs=spike.*lfp;
%  c_T=q_rs/n;
%  plot(c_T)
%  xlim([0 400])
% r0=r.*s;
[r,lag] = xcorr(s,lfp);
bar((lag/fs)*1000,r)
xlim([-2000 2000])
