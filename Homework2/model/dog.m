function [out] = dog(Size)
    
    xs = 1.;
    xc = 0.999999;
    Scale=20;
    ks = 1;
    kc = 1;
    
    i = 1:Size;
    j = 1:Size;
    dog_c = kc/(2*pi*xc^2) * exp(- ((i-Size/2).^2+(j'-Size/2).^2) /(2*xc^2));
    dog_s = ks/(2*pi*xs^2) * exp(- ((i-Size/2).^2+(j'-Size/2).^2) /(2*xs^2));
    
    out = dog_c - dog_s;
    LL=zeros(Scale*Size);
    for i =1:Size
        for k=1:Size
            for j=1:Scale
                for jj=1:Scale
                    LL(Scale*(i-1)+j,Scale*(k-1)+jj)=out(i,k);
                end
            end
            
        end
    end
    imshow(mat2gray(LL)*2);
    title('DOG function')
end
