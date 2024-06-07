%% Test if speed calibration works
clc; clear; clf;


%% load data
data = readtable('./data/testSpeedCalibration1.csv');

speed = data.speed;
left = data.leftSpeed;
right = data.rightSpeed;

limits = 550;

model = -550:550;

%% plot
ms = 10;
plot(speed, left, 'r.', 'MarkerSize', ms); hold on;
plot(speed, right, 'b.', 'MarkerSize', ms);
plot(model, model, '-')
hold off;
grid on;
xlabel('Target speed [rpm]');
ylabel('Wheel speeds [rpm]');
legend('left', 'right', 'ideal case', 'Location', 'southeast');
