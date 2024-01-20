%% Motors
clear; clc; close all;

%% Variables
% max desired speed and accel
vmax = 2; % m/s -> typically 1.5-2 m/s
% in 2009 in japan, source : https://micromouseonline.com/micromouse-book/navigation/
nbCells = 65;
t = 5; % s
cellLength = 0.18; % m
vm = nbCells* cellLength/t % m/s, average speed
% amax = 

d = 0.03; % m , wheel diameter

p = d*pi % perimeter

n = vmax/p*60 % rpm