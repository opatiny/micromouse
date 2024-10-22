%% Motors
clear; clc; close all;

%% Generic variables
g = 9.81; % kg*m/s^2

%% Maximum motor speed
% max desired speed and accel
vmax = 1.5; % m/s -> typically 1.5-2 m/s

% in 2009 in japan, source : https://micromouseonline.com/micromouse-book/navigation/
nbCells = 65;
T = 5; % s, time to run the maze
cellLength = 0.18; % m
vm = nbCells * cellLength/T % m/s, average speed

d = 0.032; % m , wheel diameter
r = d/2;

p = 2*r*pi; % perimeter

% max motor speed required -> nominal speed should be less
n = vmax/p*60 % rpm
omega = vmax/r

% max acceleration -> the acceleration that we'd like to reach
amax = 0.5*9.81; % m/s^2, https://micromouseonline.com/micromouse-book/robot-dynamics/acceleration/
alpha = amax/r

%% Total inertia relative to the motors
% variables
M = 0.15; % kg , total robot mass
Jmot = 1e-7; % kgm^2 -> rotor inertia, approx 1gcm^2 (estimation random maxon motor)
Jred = 0; % no gearbox
i = 1; % - , gearbox reduction
eta = 0.9; % gearbox efficiency
% wheel inertia estimation
m_wheel = 0.003; % kg

Jwheel = 1/2 * m_wheel * r^2; % approximate as full cylinder

Jrtot = Jmot + Jred + 1/(eta*i^2)*(Jwheel + M*r^2/2)

%% Maximum torque
Tfr = 0; % friction torque
T_mot = Jrtot * alpha - Tfr

%% Maximal mechanical power
Pmec = omega * T_mot
% Pel = U*I 

%% Maximal acceleration depending on friction coefficient
% if the acceleration is bigger the wheels will slip
mu0 = 0:0.1:1; % -
N = 4; % -, total number of wheels (points touching the floor)
M_mot_max = r*mu0*M*g/N
alpha_max = M_mot_max/(eta*i*Jrtot); % rad/s^2
a_max = alpha_max*r % m/s^2

Pmax_fr = omega*M_mot_max

% distance to reach max speed
deltax = 0.5; % m
vf = sqrt(2*a_max*deltax)

n_nom = 840; % rpm, nominal motor speed

vlim = n_nom*2*pi*r/60

figure();
plot(mu0,alpha_max);
xlabel('Friction coefficient [-]');
ylabel('Max. angular acceleration [rad/s^2]');
grid on;

%% Distance for given v and a

a = 1.5; % m/s^2
v = 1.05; % m/s^2

% vf^2-vi^2 = 2*a*delta x

deltax = v/a/2
