%% Relationship between motor speed command and wheel speed in rpm
clc; clear; clf;

%% load data
data = readtable('./data/wheelSpeedCalibration3.csv');

left = data.leftSpeedRpm;
right = data.rightSpeedRpm;
command = data.motorCommand;

%% Compute regressions for speed
% Remove point with speed abs value too large
speedLim = 550; % rpm
degree = 4;

[pNegLeft, pPosLeft, leftFit] = findBestSpeedFit(command, left, degree);
[pNegRight, pPosRight, rightFit] = findBestSpeedFit(command, right, degree);

%% plot speed VS command
ms = 10;

figure(1);
plot(command, left, 'r.', 'MarkerSize', ms);
hold on;
plot(command, right, 'b.', 'MarkerSize', ms);
plot(command, leftFit,'r-')
plot(command, rightFit, 'b-')
hold off;
xlabel('Motor command [-]');
ylabel('Wheel speed [rpm]');
legend('left', 'right', 'left polyfit', 'right polyfit', 'Location','southeast');
grid on;

%% Compute regressions for commands
degree = 4;

[pNegLeft, pPosLeft,~] = findBestCommandFit(left, command, degree, speedLim);
[pNegRight, pPosRight,~] = findBestCommandFit(right, command, degree, speedLim);


speeds = -700:700;
finalLeftFit = getCommands(pNegLeft, pPosLeft, speeds);
finalRightFit = getCommands(pNegRight, pPosRight, speeds);

%% plot command VS speed
figure(2);
plot(left, command, 'r.', 'MarkerSize', ms)
hold on;
plot(right,command, 'b.', 'MarkerSize', ms);
plot(speeds, finalLeftFit, 'r-');
plot(speeds, finalRightFit, 'b-');
grid on;
xlabel('Wheel speed [rpm]');
ylabel('Motor command [-]');
legend('left', 'right', 'left fit', 'right fit', 'Location','southeast');
title(['Command VS speed with polynomial fit degree ' num2str(degree) ', model trained on speeds [-' ...
        num2str(speedLim) ', ' num2str(speedLim) '] rpm' ])

%% Functions to find regressions
% speed VS command
function [pNeg, pPos, fit] = findBestSpeedFit(command, speed, degree)
% Find polynomial regressions of given degree for the three regions of the
% data
zeroIndices = find(speed == 0);
minZero = zeroIndices(1)-1;
maxZero = zeroIndices(end)+1;

% negative part model
speeds = speed(1:minZero);
commands = command(1:minZero);
[pNeg, negFit] = getPolyFit(commands, speeds, degree);

% zeros part model
middleFit = zeros(maxZero-minZero-1,1);

% positive part model
speeds = speed(maxZero:end);
commands = command(maxZero:end);
[pPos, posFit] = getPolyFit(commands, speeds, degree);

fit = [negFit; middleFit; posFit];
end

function [pNeg, pPos, fit] = findBestCommandFit(speed, command, degree, speedLim)
% remove points out of speed range
indices = find(abs(speed)<=speedLim);
command = command(indices);
speed = speed(indices);

% Find regressions for the three regions of the data
zeroIndices = find(speed == 0);
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

