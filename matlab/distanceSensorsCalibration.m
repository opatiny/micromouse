%% Distance sensors calibration
clear; clc; close all;


%% Load data
data = readtable('./data/distanceSensorsCalibration1.csv');
measurements = [data.left, data.front];

n = length(measurements(:,1)); % nb measurements

%% Variables
step = 50; % mm, true distance increase between measurements

nbSensors = 2;
distances = 0:step:(n-1)*step; % mm, true distance from edge of board
offsets = [6 15]; % mm, offsets from edge of the board

distancesMatrix = distances'*ones(1,nbSensors);
offsetsMatrix = ones(n, 1)*offsets;

%% Process data
trueDistances = offsetsMatrix + distancesMatrix;

%% plot
colors = ['r', 'g', 'b', 'y', 'c' ];
figure();
plot(trueDistances(:,1), trueDistances(:,1), '-', 'Color','magenta')
hold on;
for i = 1:nbSensors
    plot(trueDistances(:,i), measurements(:,i), '.', 'MarkerSize', 15, 'Color',colors(i));

end
hold off;
xlabel('True distance [mm]');
ylabel('Measured distances [mm]');
legend('Expected distance', 'Measurement left', 'Measurement right', 'Location','southeast');
grid on;
axis equal;
