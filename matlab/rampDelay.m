%% Analyse impact of ramp profile
% vary time step in trapeze profile
clear; clc; close all;

%% load and process data

files = ['2', '4', '6'];
nbZeros = 5;

figure(1);
hold on;

for i=1:length(files)
data = readtable(strcat('./data/encoders',files(i),'.csv'));
startIndex = find(abs(diff(data.leftEncoder))>0,1) - nbZeros;
time = (data.time(startIndex:end) - data.time(startIndex))/1000;
leftEncoder = -data.leftEncoder(startIndex:end);

%% compute speed
leftSpeed = gradient(leftEncoder,time); % degrees/s
startIndex = find(leftSpeed>0, 1);
leftSpeedRpm = degsToRpm(leftSpeed); % rpm
 
plot(time,leftSpeedRpm, '.-');

end

hold off;
xlabel('Time [s]');
ylabel('Angular speed [rpm]');
grid on;
legend('1 ms', '5 ms', '10 ms');
title('Influence of ramp delay on the trapezoidal profile. Increasing the delay reduces the acceleration.')



