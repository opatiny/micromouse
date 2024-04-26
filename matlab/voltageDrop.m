%% Battery voltage when motor on
clear; clc; close all;

%% load data
% speed 200
% movement length: 1s

data = readtable('./data/batteryVoltage5.csv');
time = data.time/1000;
voltage = data.voltage/1000;
leftMode = data.leftMode;

%% find start and end of profile
indices = ischange(leftMode);
profileLimitsTime = time(indices);


%% smooth data with moving average
smoothed = smoothdata(voltage, 'movmean', 50);

%% plot
figure();
plot(time, voltage, '.-', 'MarkerSize', 10);hold on;
xline(profileLimitsTime, 'g');
plot(time, smoothed, 'r-');
hold off;
xlabel('Time [s]');
ylabel('Voltage [V]');
grid on;