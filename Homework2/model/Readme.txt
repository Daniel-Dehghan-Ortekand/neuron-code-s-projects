Visiome Platform Model Distribution
===================================

% Title:
%   The STA with MATLAB
% Creator:
%   Jun KITAGAWA     (kitagawa@nil.ist.aichi-pu.ac.jp)
%   Ren MAKINO       (makino@nil.ist.aichi-pu.ac.jp)
%   Yoshimi KAMIYAMA (kamiyama@ist.aichi-pu.ac.jp)
% Reference Paper:
%   Linaro, D., Storace, M. and Giugliano, M. (2011)
%   Accurate and Fast Simulation of Channel Noise 
%   in Conductance-Based Model Neurons by Diffusion Approximation
%   PLoS Computational Biology, 7, 1-17.
-------------------------------------------------------------


We recommend you to watch the following videos.
URL: https://youtu.be/CcHae_pVEa0


This package contains the following files:

 Readme.txt
  This file.
 STA.m
  Calculate STA(of random stimulus) using "linaro_hhmodel.m" and "hh_equation.m".
 STA2.m
  Calculate STA(of random image) using "linaro_hhmodel.m" and "hh_equation.m".
 linaro_hhmodel.m
  linaro model (2011) written in MATLAB language.
 hh_equation.m
  MATLAB script file for running the models.
 dog.m
  MATLAB script file for running the models.
 Raster.m
  Matlab script file for raster plotting.

HOW TO RUN
----------

0) This package is running with MATLAB system.

1) Put STA.m, linaro_hhmodel.m and hh_equation.m in the same directory.

2) Change current directory to the working directory, run MATLAB by "matlab" command.

3) Execute the script on the "Command Window" as follows.

  >> STA

For further information, please contact:

Jun KITAGAWA     (kitagawa@nil.ist.aichi-pu.ac.jp)
Ren MAKINO       (makino@nil.ist.aichi-pu.ac.jp)
Yoshimi KAMIYAMA (kamiyama@ist.aichi-pu.ac.jp)

School of Information Science and Technology
Aichi Prefectural University
Nagakute, Aichi, 480-1198, Japan
