clear all
close all
sig = 1;
L = 2000;
s = -5:0.01:5;
r_a = zeros(1,11);
r_max = 0.4;
Wmat = zeros(11,length(s));
for i = -5:1:5
w = .4*(1/.4)*(1/(sqrt(2*pi)*sig))*exp((-(s-i).^2)./(2*sig^2));
Wmat(i+6,:) = w;
fa = w(s==0);
spikes = zeros(1,L);
ind = find(fa-rand(1,L)>0);
spikes(ind) = 1;
r_a(i+6) = length(ind)/L;
end
w2 = (1/(sqrt(2*pi)*sig))*exp((-(s+2).^2)./(2*sig^2));
X1 = sum(r_a'.*log(Wmat))+log(.2);
X2 = 2.12*sum(r_a'.*log(Wmat))+w2;
p_s_a = exp(X1);
p_s_a2 = exp(X2);
p_s_a = p_s_a*20;
p_s_a2 = p_s_a2*20;
figure
plot(s,p_s_a,'k','linewidth',2)
hold on
plot(s,p_s_a2,'-.k','linewidth',2)
title('p(s|r) for p(s):constant & p(s):gaussian','FontSize',16)
legend({'p(s):constant','p(s):gaussian'},'fontsize',12)
xlabel('S','fontsize',14)
ylabel('p(s|r)','fontsize',14)