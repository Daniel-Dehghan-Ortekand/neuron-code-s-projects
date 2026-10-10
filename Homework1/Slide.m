function out = Slide(x,h)
n=length(x);
m=length(h);
l=m+n-1;
X=zeros(1,l);
out=zeros(1,l);
X(1:n)=x;
for i=1:l
    for j=1:m
        if i>=j
            out(i)=out(i)+(X(i-j+1)*h(m-j+1));
        end
    end
end
end
