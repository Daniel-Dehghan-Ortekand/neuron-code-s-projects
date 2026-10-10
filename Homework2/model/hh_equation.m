% hh_equation.m
function [alpha,beta,dy]=hh_equation(y, I_ext, s_Z, s_X)


A       = 2*pi*30^2*10^(-8);    % Surface area [cm^2]
% maximum conductances [mS]
GK_max  = 36.0*A;   % potassium conductance
GNa_max = 120.0*A;  % sodium conductance
GL_max  = 0.3*A;    % leakage conductance
% reversal potentials [mV]
ENa     = 50.0;     % sodium
EK      = -77.0;    % potassium
EL	    = -54.3;    % leak
% membrane capacitance 
Cm      = 1.0*power(10,0)*A;

% state variables
m = y(1);           % sodium current activation activariable
h = y(2);           % sodium current inactivation variable
n = y(3);           % potassium current activation variable
V = y(4);           % membrane potential (mV)

% for m parameter
if ( V ~= -40.0 )
    am = -0.1*(V+40)/(exp(-0.1*(V+40))-1);
else
    am = 1.0*10.0;
end
bm = 4*exp(-(V+65)/18);

% for h parameter
ah = 0.07*exp(-(V+65)/20);
bh = 1.0/(exp(-0.1*(V+35))+1);

% for n parameter
if ( V ~= -55.0 )
    an = -0.01*(V+55.0)/(exp(-0.1*(V+55.0))-1.0);
else
    an= 0.01*10.0;
end
bn= 0.125*exp(-(V+65.0)/80);

%   /* for v (voltage) */
INa = GNa_max * ((m^3 * h) + s_X) * (V - ENa);
IK  = GK_max  * ((n^4) + s_Z) * (V - EK);
IL  = GL_max  * (V - EL);

dy = [am*(1.0 - m) - bm*m;
    ah*(1.0 - h) - bh*h;
    an*(1.0 - n) - bn*n;
    (I_ext - (INa + IK + IL) ) / Cm];

alpha = [am; ah; an];
beta = [bm; bh; bn];
end