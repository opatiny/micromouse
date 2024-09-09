%% Test speed PID regulator
clc; clear; clf;

%% select dataset using number
num = 8;

%% Kp, Kd and Ki for the different data sets
pidParams = [0.02,0,0.01;
             0.02,0.001,0;
             0.02,0,0.001;
             0.02,0.002,0
             0.02,0.002,0
             0.015,0.003,0
             0.06,0.001,0
             0.03,0.003,0];

%% Load data
data = readtable(['./data/testPid' num2str(num) '.csv']);
time = data.time - data.time(1); % time in seconds
targetSpeed = data.targetSpeed;
leftSpeed = data.leftSpeed;
leftCommand = data.leftCommand;
rightSpeed = data.rightSpeed;
rightCommand = data.rightCommand;

%% plot
plot(time, targetSpeed,'.-');
hold on;
plot(time,leftSpeed, '.-');
plot(time, leftCommand, '.-');
plot(time, rightSpeed, '.-');
plot(time, rightCommand, '.-');
hold off;
grid on;
xlabel('Time [s]');
ylabel('Speed [rpm], command [-]');
legend('Target speed', 'Left speed', 'Left command', 'Right speed', 'Right command');
title(['Kp = ' num2str(pidParams(num,1)) ', Ki = ' num2str(pidParams(num,2))...
       ', Kd = ' num2str(pidParams(num,3))]);