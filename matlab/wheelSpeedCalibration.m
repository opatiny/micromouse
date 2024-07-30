%% Relationship between motor speed command and wheel speed in rpm
clc; clear; clf;

%% variables
maxCommand = 255;

%% load data
data = readtable('./data/wheelSpeedCalibration2.csv');

left = data.leftSpeedRpm;
right = data.rightSpeedRpm;
command = data.motorCommand;

%% Compute regressions for speed
% Remove point with speed abs value too large
degree = 4;

[pNegLeft, pPosLeft, leftFit] = findBestSpeedFit(command, left, degree);
[pNegRight, pPosRight, rightFit] = findBestSpeedFit(command, right, degree);

%% plot speed VS command

dutyCycle = command/maxCommand*100;
ms = 5;
figure(1);
plot(dutyCycle, left, 'ro', 'MarkerSize', ms);
hold on;
plot(dutyCycle, right, 'bo', 'MarkerSize', ms);
plot(dutyCycle, leftFit,'r-')
plot(dutyCycle, rightFit, 'b-')
hold off;
xlabel('Duty cycle [%]');
ylabel('Wheel speed [rpm]');
legend('left', 'right', 'left polyfit', 'right polyfit', 'Location','southeast');
grid on;



%% Functions to find regressions
% speed VS command
function [pNeg, pPos, fit] = findBestSpeedFit(command, speed, degree)
% Find polynomial regressions of given degree for the three regions of the
% data
zeroIndices = find(abs(speed) < 25);
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

function [p, fit] = getPolyFit(x, y, degree)
p = polyfit(x, y, degree);
fit = polyval(p,x);
end
