%% Compare methods of measuring speed

%% load data
data = readtable('./data/compareSpeeds4.csv');

time = (data.time-data.time(1))/1000000;
leftHigh = data.leftHighSpeed;
rightHigh = data.rightHighSpeed;

leftLow = data.leftLowSpeed;
rightLow = data.rightLowSpeed;



%% plot
ms = 10;
plot(time, leftHigh, 'b.-', 'MarkerSize', ms); hold on;
plot(time, leftLow, 'ro-', 'MarkerSize', ms);
%plot(time, rightHigh, 'b.-', 'MarkerSize', ms);
%plot(time, rightLow, 'bo-', 'MarkerSize', ms);
hold off;
grid on;
xlabel('Wheel speed [rpm]');
ylabel('Time [s]');
legend('left dX/T', 'left X/dt', 'right dX/T', 'right X/dT', 'Location', 'southeast');
xlim([0 25])