%% Test odometry
clear; clc; clf;

%% load data
data = readtable('./data/odometry1.csv');

x = data.x;
y = data.y;

%% plot
figure();
plot(x,y, '.-');
xlabel('x [m]');
ylabel('y [m]');
axis equal;


