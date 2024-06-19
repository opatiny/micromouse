%% Compare different delays in drive straight function
clc; clear; clf;

%% Kp, Kd and Ki
pidParams = [0.02,0.002,0];

%% Define data and variables
delays = [10, 5, 2, 1];

target = 200; % rpm

%% plot
yline(target);
hold on;

for i = 1:length(delays)
    delay = delays(i);
    [time, speed] = extractData(['controllerDelayImpact' num2str(delay) 'ms.csv']);
    plot(time, speed,'.-');
end
hold off;
grid on;
xlabel('Time [s]');
ylabel('Speed [rpm]');
legend('target', '10 ms', '5 ms', '2 ms', '1 ms');
title(['Impact of task delay on step response: Kp = ' num2str(pidParams(1)) ', Ki = ' num2str(pidParams(2))...
       ', Kd = ' num2str(pidParams(3))]);
xlim([0,2]);

function [time, speed] = extractData(fileName)
data = readtable(['./data/' fileName]);
time = (data.time - data.time(1))/1000; % time in seconds
speed = data.leftSpeed;
end