%% initial setting
clear variables

loop = 20;   % loop times
calc_time = 0.001;
last_time = 30000;
A       = 2*pi*30^2*10^(-8); % [cm^2]

Size = 12;       % DOG function Size
dog = dog(Size); % generate DOG function
last_step = last_time / calc_time;
t=1;
buf = 0;
in=zeros(last_time, Size, Size);
I_ext=zeros(1,last_step);
Scale=20;
tau = 10001;

before_input = zeros(tau, Size, Size);
spike_C=0;
KO=zeros(tau, Size, Size);
J=zeros(Scale*Size);


%% generate stimuli from random image
for i = 1:last_step
    LL = randi(256, Size);
    if mod(i,1000) ==0
        in(t,:,:)=LL;
        t=fix(t+1);
        I_ext(i) = sum(sum(dog.*LL)*10*A*10^4);
        buf = I_ext(i);
    else
        I_ext (i) = buf;
    end
end
disp('generate stimuli')
plot(I_ext);
%% main loop 


for i = 1:loop
    X(i,:,:) = linaro_hhmodel(I_ext, calc_time, last_time);    
end

for i = 1:loop
    figure

    plot((1:last_step).*calc_time,X(i,:))
    xlabel('Time [ms]')
    ylabel('Membrane Potential [mV]')
    fig = sprintf('loop %d', i);
    title(fig)
end
disp('plot Membran Potential')
%% firing timing
fire = zeros(loop,last_step-1);
for i = 1:loop
    for j = 1:last_step-1
        if X(i,j)<-50 && X(i,j+1)>=-50
            fire(i,j) = 1;
        else
            fire(i,j) = 0;
        end
    end
end
sprintf('fire count : %d',sum(sum(fire)))


%% calclate STA
spike_C=0;
for t=1:loop
    for i = 1:last_step-1
        k=1;
        if (fire(t,i)~=0 && i>tau )
            for mae = i-tau:i-1
                if(mae/1000>=1)
                    before_input(k, :, :) = in(floor(mae/1000), :, :);
                    k=fix(k+1);
                end
            end
            spike_C = fix(spike_C + 1);
            KO=KO+before_input;
        end
    end
end
KO=KO./spike_C;
M=zeros(Size);
kai=1;
for k=1:500:tau
    for i=1:Size
        for t=1:Size
            M(i,t)=KO(k,i,t);
        end
    end
    
    figure 
    mesh(M)
    fig = sprintf('%0.1f [ms] before', (tau-k)/1000);
    pause(1);
    title(fig);
    pause(1);
    
    %     J = imresize(M,10);
    for i =1:Size
        for k=1:Size
            for j=1:Scale
                for jj=1:Scale
                    J(Scale*(i-1)+j,Scale*(k-1)+jj)=M(i,k);
                end
            end
            
        end
    end
    figure
    imshow(mat2gray(J)*2)
    pause(1);
    title(fig);
    %     figure
    %     mesh(J)
    pause(1);
end

disp('plot STA(2D)')