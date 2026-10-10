clc 
clear 
syms x
expr = -(x*((x-1)^2))/2;
F = int(expr)
F