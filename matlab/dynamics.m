%% Robot dynamics
% compute max robot linear and angular speeds

clear; clc; close all;

%% variables
d = 0.032; % m , wheel diameter
maxWheelSpeed = 550; % rpm
wheelBase = 0.1; % m

%% max linear speed
r = d/2;
p = 2*r*pi; % perimeter

v_max = p*maxWheelSpeed/60 % m/s

%% max angular speed of the robot
r = wheelBase/2;

omega_max = v_max/r % rad/sec

omega_max_degSec = omega_max*180/pi

% max rotational speed of the robot
n_max = omega_max * 30/pi % rpm