%% Compare methods of measuring sped
clc; clear; clf;

%% load data
data = readtable('./data/compareSpeeds3.csv');

speed = data.speed;
leftHigh = data.leftHighSpeed;
rightHigh = data.rightHighSpeed;

leftLow = data.leftLowSpeed;
rightLow = data.rightLowSpeed;

limits = 550;

model = -550:550;

%% plot
ms = 10;
plot(speed, leftHigh, 'r.-', 'MarkerSize', ms); hold on;
plot(speed, rightHigh, 'b.-', 'MarkerSize', ms);
plot(speed, leftLow, 'ro-', 'MarkerSize', ms);
plot(speed, rightLow, 'bo-', 'MarkerSize', ms);
plot(model, model, '-')
hold off;
grid on;
xlabel('Target speed [rpm]');
ylabel('Wheel speeds [rpm]');
legend('left dX/T', 'right dX/T','left X/dt', 'right X/dT', 'ideal response', 'Location', 'southeast');
