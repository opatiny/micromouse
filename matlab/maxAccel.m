%% Compute robot maximal acceleration
clc; clear; clf;

%% Load data
data = readtable('./data/maxAccel1.csv');
time = (data.time - data.time(1))/1000; % time in seconds
targetSpeed = data.targetSpeed;
leftSpeed = data.leftSpeed;
leftCommand = data.leftCommand;
rightSpeed = data.rightSpeed;
rightCommand = data.rightCommand;


%% compute acceleration

finalIndex = 46;

p = pi*0.032;

dt = time(finalIndex) - time(1)
meanRpm = (leftSpeed(finalIndex) + rightSpeed(finalIndex))/2

finalLinSpeed = meanRpm*p/60 % m/s

a = finalLinSpeed/dt % m/s^2

nbG = a/9.81 % approx 0.7g

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