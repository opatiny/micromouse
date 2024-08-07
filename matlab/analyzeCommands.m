%% Analyse commands sent to the motors
clear; clc; clf;

%% load data
data = readtable('./data/analyseCommands1.csv');

time = (data.time - data.time(1))/1000000;
command = data.command;
target = data.target;

%% plot
plot(time, target, 'b-'); hold on;
plot(time, command, 'r.-', 'MarkerSize', 10);
hold off;
xlabel('time [s]');
ylabel('PWM command [-]');
legend('target command', 'current command', 'Location', 'southeast')
grid on;


