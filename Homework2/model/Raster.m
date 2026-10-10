% initial setting
clear variables
loop = 10;   % loop times
calc_time = 0.001;
last_time = 2000;
% Surface Area
A       = 2*pi*30^2*10^(-8); % [cm^2]

Size = 12;       % DOG function Size
                 % dog = dog(Size); % generate DOG function
last_step = last_time / calc_time;
t=1;
buf = 0;
in=zeros(last_time, Size, Size);
I_ext=zeros(1,last_step);

tau = 10001; % ここを変更予定 STA time [ms]

before_input = zeros(tau, Size, Size);
spike_C=0;
KO=zeros(tau, Size, Size);

% generate I_ext
for i = 1:last_step
    if mod(i,10) ==0
        I_ext(i) = (rand()*6-3)*10^(1)*A;
        buf = I_ext(i);
    else
        I_ext (i) = buf;
    end
end


% main loop
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

% firing timing & raster plot
fire = zeros(loop,last_step-1);
figure;
hold on
for i = 1:loop
    for j = 1:last_step-1
        if X(i,j)<-50 && X(i,j+1)>=-50
            fire(i,j) = 1;
            plot(j*calc_time,1*i,'k*');
        else
            fire(i,j) = 0;
        end
    end
end
ylabel('trial number')
xlabel('time [ms]')
title('raster plot')
hold off
sprintf('fire count : %d',sum(sum(fire)))