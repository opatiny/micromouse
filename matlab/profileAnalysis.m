%% Analyse the movement profile of the motor
clear; clc;

% set(groot,'defaulttextinterpreter','latex');  
% set(groot, 'defaultAxesTickLabelInterpreter','latex');  
% set(groot, 'defaultLegendInterpreter','latex');

% set(0,'defaultTextInterpreter','latex'); %trying to set the default

%% load data
data = readtable('./data/encoders6.csv');
time = (data.time-data.time(1))/1000;
leftEncoder = -data.leftEncoder;
rightEncoder = -data.rightEncoder;
leftMode = data.leftMode;
rightMode = data.rightMode;

%% compute speeds
% degrees/s
leftSpeed = gradient(leftEncoder,time);
rightSpeed = gradient(rightEncoder,time);

% rpm
leftSpeedRpm = degsToRpm(leftSpeed);
rightSpeedRpm = degsToRpm(rightSpeed);


%% plot
figure(1);
plot(time, leftSpeedRpm, '.-'); hold on;
plot(time, rightSpeedRpm, '.-');
hold off;
xlabel('Time [s]');
ylabel('Angular speed [rpm]');
grid on;

