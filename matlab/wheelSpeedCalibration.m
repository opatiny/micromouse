%% Relationship between motor speed command and wheel speed in rpm
clc; clear; clf;

%% load data
data = readtable('./data/wheelSpeedCalibration2.csv');

left = data.leftSpeedRpm;
right = data.rightSpeedRpm;
command = data.motorCommand;

%% Compute regressions
degree = 2;

[pNegLeft, pPosLeft, leftFit] = findBestFit(command, left, degree)
[pNegRight, pPosRight, rightFit] = findBestFit(command, right, degree)

%% plot data
ms = 10;

plot(command, left, 'r.', 'MarkerSize', ms);
hold on;
plot(command, leftFit,'r--')
plot(command, right, 'b.', 'MarkerSize', ms);
plot(command, rightFit, 'b--')
hold off;
xlabel('Motor command [-]');
ylabel('Wheel speed [rpm]');
legend('left', 'left polyfit', 'right', 'right polyfit', 'Location','southeast');
grid on;

%% Functions to find regressions
% using polyfit
function [pNeg, pPos, fit] = findBestFit(command, speed, degree)
    % Find polynomial regressions of given degree for the three regions of the
    % data
zeroIndices = find(speed == 0);
minZero = zeroIndices(1)-1;
maxZero = zeroIndices(end)+1;

% negative part model
minIndex = 1;
maxIndex = minZero;
[pNeg, negFit] = getPolyFit(speed, command, minIndex, maxIndex, degree);

% zeros part model
middleFit = zeros(maxZero-minZero-1,1);

% positive part model 
minIndex = maxZero;
maxIndex = length(command);
[pPos, posFit] = getPolyFit(speed, command, minIndex, maxIndex, degree);

fit = [negFit; middleFit; posFit];
end

function [p, fit] = getPolyFit(speed, command, minIndex, maxIndex, degree)
speeds = speed(minIndex:maxIndex);
commands = command(minIndex:maxIndex);
p = polyfit(commands, speeds, degree);
fit = polyval(p,commands);
end

function [p,fit] = getCustomFit(speed, command, minIndex, maxIndex)
speeds = speed(minIndex:maxIndex);
commands = command(minIndex:maxIndex);

aOpt = lsqcurvefit(model,a0,commands, speeds)

fit = polyval(p,commands);
end

function y = model(a,x)
b = getB(a,x);
c = getC(a,x);

y = a*x^2 + b*x + c;
end

function b = getB(a,x)
x2 = x(end);
b = -2*x2*a;
end


function c = getC(a,x)
x1 = x(0);
x2 = x(end);
c = a*x1*(2*x2 - x1);
end
