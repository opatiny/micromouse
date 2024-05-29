%% Find best parabola going through 2 given points of data
clc; clear; clf;

%% load data
data = readtable('./data/wheelSpeedCalibration2.csv');

left = data.leftSpeedRpm;
right = data.rightSpeedRpm;
command = data.motorCommand;

speed = left;
zeroIndices = find(speed == 0);

minZero = zeroIndices(1)-1;
maxZero = zeroIndices(end)+1;

minIndex = maxZero;
maxIndex = length(command);

x = speed(minIndex:maxIndex);
y = command(minIndex:maxIndex);

%% compute fit
[p,fit] = getCustomFit(x, y);


%% plot
plot(x, y, 'b.', 'MarkerSize', 10);
hold on;
plot(x,fit, 'b-');
hold off;
grid on;
xlabel('Motor command [-]');
ylabel('Wheel speed [rpm]');
legend('data', 'fit', 'Location','southeast');

%% function
function [p,fit] = getCustomFit(x, y)

x1 = x(1);
y1 = y(1);
x2 = x(end);
y2 = y(end);

getB = @(a) (y2-y1)/(x2-x1) - a*(x2+x1);
getC = @(a) y1 - a*x1^2 - getB(a)*x1;

model = @(a,x) a*x.^2 + getB(a)*x + getC(a);

a0 = 0;

a = lsqcurvefit(model, a0, x, y);

b = getB(a);
c = getC(a);

p = [a b c]

fit = polyval(p,x);
end
