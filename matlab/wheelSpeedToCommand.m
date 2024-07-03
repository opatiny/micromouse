%% Function to convert speed in rpm to command (forward kinematics)
% we want to compare the matlab results and the cpp ones
clc; clear; clf;

%% variables
datasetNb = 6;

speeds = -700:700;

%% load data
data = readtable(['./data/wheelSpeedCalibration' num2str(datasetNb) '.csv']);

left = data.leftSpeedRpm;
right = data.rightSpeedRpm;
command = data.motorCommand;

%% load cpp polynoms
polynoms = readtable(['./data/polynoms' num2str(datasetNb) '.csv']);
pNegLeft = polynoms.pNegLeft
pPosLeft = polynoms.pPosLeft
pNegRight = polynoms.pNegRight
pPosRight = polynoms.pPosRight

cppLeftFit = getCommands(pNegLeft, pPosLeft, speeds);
cppRightFit = getCommands(pNegRight, pPosRight, speeds);

%% Compute regressions for commands
degree = 4;
speedLim = 550; % rpm

[pNegLeft, pPosLeft,~] = findBestCommandFit(left, command, degree, speedLim)
[pNegRight, pPosRight,~] = findBestCommandFit(right, command, degree, speedLim)

matlabLeftFit = getCommands(pNegLeft, pPosLeft, speeds);
matlabRightFit = getCommands(pNegRight, pPosRight, speeds);

%% plot command VS speed
ms = 10;

figure(2);
plot(left, command, 'r.', 'MarkerSize', ms)
hold on;
plot(right,command, 'b.', 'MarkerSize', ms);
plot(speeds, matlabLeftFit, 'r-');
plot(speeds, matlabRightFit, 'b-');
plot(speeds, cppLeftFit, 'r--');
plot(speeds, cppRightFit, 'b--');
grid on;
xlabel('Wheel speed [rpm]');
ylabel('Motor command [-]');
legend('left', 'right', 'left fit matlab', 'right fit matlab',...
    'left fit cpp', 'right fit cpp', 'Location','southeast');
title(['Command VS speed with polynomial fit degree ' num2str(degree) ', model trained on speeds [-' ...
        num2str(speedLim) ', ' num2str(speedLim) '] rpm' ])
ylim([-270 270]);
%% functions

function [pNeg, pPos, fit] = findBestCommandFit(speed, command, degree, speedLim)
% remove points out of speed range
indices = find(abs(speed)<=speedLim);
command = command(indices);
speed = speed(indices);

% Find regressions for the three regions of the data
speedZeroThreshold = 25;

zeroIndices = find(abs(speed) < speedZeroThreshold);
minZero = zeroIndices(1);
maxZero = zeroIndices(end);

% negative part model
negSpeeds = speed(1:minZero);
negCommands = command(1:minZero);
[pNeg, negFit] = getPolyFit(negSpeeds, negCommands, degree);

% zeros part model
middleFit = zeros(maxZero-minZero-1,1);

% positive part model
posSpeeds = speed(maxZero:end);
posCommands = command(maxZero:end);
[pPos, posFit] = getPolyFit(posSpeeds, posCommands, degree);

fit = [negFit; middleFit; posFit];
end


function [p, fit] = getPolyFit(x, y, degree)
p = polyfit(x, y, degree);
fit = polyval(p,x);
end


function command = getCommand(pNeg, pPos, speed)
if speed > 0
    command = polyval(pPos, speed);
elseif speed < 0
        command = polyval(pNeg, speed);
else
    command = 0;
end
end


function commands = getCommands(pNeg, pPos, speeds)
commands = zeros(1, length(speeds));

for i = 1:length(speeds)
    speed = speeds(i);
    commands(i) = getCommand(pNeg, pPos, speed);
end
end

