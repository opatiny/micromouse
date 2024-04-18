%% Analyse distance sensors measurements
clear; clc; close all;

%% Variables
nbSensors = 2;
distance = 250; % mm, true distance
offsets = [6 15]; % mm, Offsets from edge of the bord

%% Load data
data = readtable('./data/distanceSensorsConstant1.csv');
time = data.time;
measurements = [data.left, data.front];


trueDistances = offsets + distance;

%% plot

colors = ['r', 'g', 'b', 'y', 'c' ]
figure();
hold on;
for i = 1:nbSensors
plot(time, measurements(:,i), '.', 'MarkerSize', 10, 'Color',colors(i))
yline(trueDistances(i),colors(i))
end
hold off;
xlabel('Time [s]');
ylabel('Measured distances [mm]');
legend('Measurement left', 'True distance left', 'Measurement right', 'True distance right');
grid on;
