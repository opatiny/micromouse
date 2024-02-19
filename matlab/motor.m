%% Motors
clear; clc; close all;

%% Maximum motor speed
% max desired speed and accel
vmax = 2; % m/s -> typically 1.5-2 m/s

% in 2009 in japan, source : https://micromouseonline.com/micromouse-book/navigation/
nbCells = 65;
T = 5; % s, time to run the maze
cellLength = 0.18; % m
vm = nbCells * cellLength/T % m/s, average speed


r = 0.022; % m , wheel radius

p = 2*r*pi; % perimeter

% max motor speed required -> nominal speed should be less
n = vmax/p*60 % rpm
omega = vmax/r

% max acceleration -> the acceleration that we'd like to reach
amax = 10; % m/s^2, wiki: max accel up to 2g
alpha = amax/r

%% Total inertia relative to the motors
% variables
M = 0.3; % kg , total robot mass
Jmot = 1e-7; % kgm^2 -> rotor inertia, approx 1gcm^2 (estimation random maxon motor)
Jred = 0; % no gearbox
i = 1; % - , gearbox reduction
eta = 1; % gearbox efficiency
eta_floor = 0.8; % - , floor efficiency

% wheel inertia estimation
m_wheel = 0.025; % kg
Jwheel = 1/2 * m_wheel * r^2;

Jrtot = Jmot + Jred + 1/(eta*i^2)*(Jwheel + M*r^2/(2*eta_floor))

%% Maximum torque
M_mot = Jrtot * alpha

%% Maximal acceleration depending on friction coefficient