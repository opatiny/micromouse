%% Encoders various calculations
clear; clc; close all;


%% Variables
cpr = 12; % -, counts per rotation
n = 600; % rpm, maximal motor speed used
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

%% Min delay betewen two counts of an encoder
n = 10

n_nom = n*i

w_nom = n_nom *pi/30; % rad/s
angularStepRad = deg2rad(angularStepDeg);

delta_t = angularStepRad/w_nom % s, time between two transitions of encoder pin

encoderFrequency = 1/delta_t % approx 200kHz

nbClockTics = cpuSpeed/encoderFrequency

%% H bridge 
% counter period
clockCycles = cpuSpeed/hBridgeMaxFreq % 4.8 kHz

%% Nb rotations till overflow
intType = 64;

maxValue = 2.^(intType-1)-1

nbTurns = floor(maxValue./cprWheel)

% 16 -> 91 rotations
% 32 -> approx. 16 millions
% 64 -> 2.56e16


%% Speed precision

dt = 0.01; % s
nCounts = 1;

omegaDegStep = nCounts*angularStepDeg/dt;

% a variation of 1 in the nb of counts corresponds to very big change of
% rpm speed!!
nStep = omegaDegStep * 60 / 360