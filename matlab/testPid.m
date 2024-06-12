%% Test speed PID regulator
clc; clear; clf;

%% Load data
data = readtable('./data/testPid1.csv');
time = (data.time - data.time(1))/1000; % time in seconds
targetSpeed = data.targetSpeed;
leftSpeed = data.leftSpeed;
leftCommand = data.leftCommand;
rightSpeed = data.rightSpeed;
rightCommand = data.rightCommand;

%% plot
plot(time, targetSpeed);
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
