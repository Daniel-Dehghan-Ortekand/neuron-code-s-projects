function [out] = linaro_hhmodel(I_ext, calc_time, last_time)

    NEQN    = 4;
    % model parameters
    MEM_S      = 2*pi*30^2;   % Surface area [um^2]
    ngates     = 4;
    nstates    = 8;
    DK         = 18;          % potassium channels   [channels/um^2]
    DNa        = 60;          % sodium channels      [channels/um^2]
    K_channel  = DK*MEM_S;    % [channels]
    Na_channel = DNa*MEM_S;   % [channels]
    dt         = calc_time;   % Step size


    last_step  = (last_time / calc_time);
    y = [0.0529; 0.5961; 0.3177; -65.0]; 
    % init    m;      h;      n;     V;

    [alpha, beta, ~] = hh_equation(y, 0, 0, 0);
    am    = alpha(1);
    ah    = alpha(2);
    an    = alpha(3);
    
    bm    = beta(1);
    bh    = beta(2);
    bn    = beta(3);

    % steady-state
    n_inf = an/(an+bn);
    m_inf = am/(am+bm);
    h_inf = ah/(ah+bh);
    
    % Time constant
    tau_n = 1.0/(an+bn);
    tau_m = 1.0/(am+bm);
    tau_h = 1.0/(ah+bh);
    
    % malloc
    x     = zeros(nstates-1,1);
    mu_x  = zeros(nstates-1,1);
    tau_y = zeros(ngates,1);
    mu_y  = zeros(ngates,1);
    z     = zeros(ngates,1);
   
    
    
    for i=1:ngates
        tau_y(i) = tau_n/(i+1);
        mu_y(i)  = exp(-dt/tau_y(i));
    end
    
    % Variances Potassium
    var_y = [
        (1.0/K_channel) * 4*n_inf^7 * (1-n_inf);
        (1.0/K_channel) * 6*n_inf^6 * (1-n_inf)^2;
        (1.0/K_channel) * 4*n_inf^5 * (1-n_inf)^3;
        (1.0/K_channel) * 1*n_inf^4 * (1-n_inf)^4;
        ];
    
    % Time constant of Sodium
    tau_x = [
        tau_h;
        tau_m;
        tau_m/2.0;
        tau_m/3.0;
        tau_m*tau_h/(tau_m+  tau_h);
        tau_m*tau_h/(tau_m+2*tau_h);
        tau_m*tau_h/(tau_m+3*tau_h)
        ];

    % Variance of Sodium
    var_x = [
        (1.0/Na_channel) * 1 * m_inf^6 * h_inf   * (1-h_inf);
        (1.0/Na_channel) * 3 * m_inf^5 * h_inf^2 * (1-m_inf);
        (1.0/Na_channel) * 3 * m_inf^4 * h_inf^2 * (1-m_inf)^2;
        (1.0/Na_channel) * 1 * m_inf^3 * h_inf^2 * (1-m_inf)^3;
        (1.0/Na_channel) * 3 * m_inf^5 * h_inf   * (1-m_inf)   *(1-h_inf);
        (1.0/Na_channel) * 3 * m_inf^4 * h_inf   * (1-m_inf)^2 *(1-h_inf);
        (1.0/Na_channel) * 1 * m_inf^3 * h_inf   * (1-m_inf)^3 *(1-h_inf);
        ];


    for i=1:nstates-1
        mu_x(i) = exp(-dt/tau_x(i));
    end
    [~,~, dy] = hh_equation(y, 0, 0, 0);
    
    % malloc
    noise_y = zeros(ngates,1);
    noise_x = zeros(nstates-1,1);
    out =zeros(last_step,1);
    
    % time loop
    for calc_count = 1:last_step
        % gaussian noise
        gauss=sqrt(-2*log(rand()))*cos(2*pi*rand());
        
        for i = 1: NEQN
            y(i) = y(i) + calc_time * dy(i);
        end
        
        % generate channel noise
        for i = 1:ngates
            noise_y(i) = sqrt(var_y(i))*sqrt((1-mu_y(i)^2))*gauss;
        end
        for i = 1:(nstates-1)
            noise_x(i) = sqrt(var_x(i))*sqrt((1-mu_x(i)^2))*gauss;
        end
        
        % sum noise
        X = 0.0;
        Z = 0.0;
        for i=1:ngates
            z(i) = z(i)*mu_y(i) + noise_y(i);
            Z = Z + z(i);
        end

        for i=1:nstates-1
            x(i) = x(i)*mu_x(i) + noise_x(i);
            X = X + x(i);
        end

        [~,~, dy] = hh_equation(y, I_ext(calc_count), Z, X);
        
        out(calc_count) = y(4); 
    end
end

