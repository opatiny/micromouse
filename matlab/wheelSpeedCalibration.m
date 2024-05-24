%% Relationship between motor speed command and wheel speed in rpm
clc; clear; clf;

%% load data
data = readtable('./data/wheelSpeedCalibration2.csv');

left = data.leftSpeedRpm;
right = data.rightSpeedRpm;
command = data.motorCommand;

%% plot data
ms = 10;

plot(command, left, '.', 'MarkerSize', ms);
hold on;
plot(command, right, '.', 'MarkerSize', ms);
hold off;
xlabel('Motor command [-]');
ylabel('Wheel speed [rpm]');
legend('left', 'right', 'Location','southeast');
grid on;