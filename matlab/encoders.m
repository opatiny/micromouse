%% Encoders various calculations
clear; clc; close all;


%% Variables
cpr = 12; % -, counts per rotation
n_nom_gb = 1100; % rpm, motor nominal speed after gearbox
i_exact = 29.861; % -, gearbox ratio
i = 30; % -
r = 0.016; % m, wheel radius

cpuSpeed = 240e6; % Hz
hBridgeMaxFreq = 50e3; % kHz

%% Compute steps

cprWheel = cpr*i

p = 2*pi*r % approx 10cm, wheel perimeter

distanceStep = p/cprWheel*1000 % approx 0.3 mm
angularStepDeg = 360/cprWheel % 1 degree

%% Min delay betewen two counts

n_nom = n_nom_gb*i

w_nom = n_nom *pi/30; % rad/s
angularStepRad = deg2rad(angularStepDeg);

delta_t = angularStepRad/w_nom % s

encoderFrequency = 1/delta_t % approx 200kHz

nbClockTics = cpuSpeed/encoderFrequency

%% H bridge 
% counter period
clockCycles = cpuSpeed/hBridgeMaxFreq % 4.8 kHz