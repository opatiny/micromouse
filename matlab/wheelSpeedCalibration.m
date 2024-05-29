%% Relationship between motor speed command and wheel speed in rpm
clc; clear; clf;

%% load data
data = readtable('./data/wheelSpeedCalibration2.csv');

left = data.leftSpeedRpm;
right = data.rightSpeedRpm;
command = data.motorCommand;

%% Compute regressions
degree = 4;

[pNegLeft, pPosLeft, leftFit] = findBestSpeedFit(command, left, degree);
[pNegRight, pPosRight, rightFit] = findBestSpeedFit(command, right, degree);

%% plot data
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


figure(2);
plot(left, command, 'b.')
grid on;
xlabel('Wheel speed [rpm]');
ylabel('Motor command [-]');

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

function [negSpeeds, negCommands,pNeg, pPos, fit] = findBestCommandFit(command, speed, degree)
% Find polynomial regressions of given degree for the three regions of the
% data
zeroIndices = find(speed == 0);
minZero = zeroIndices(1)-1;
maxZero = zeroIndices(end)+1;


% negative part model
negSpeeds = speed(1:minZero);
negCommands = command(1:minZero);
[pNeg, negFit] = getPolyFit(negSpeeds, negCommands, degree);

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
