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
ylabel('Wheel speed [rpm]');
xlabel('Time [s]');
legend('left dc/T', 'left C/dt', 'right dc/T', 'right C/dT', 'Location', 'southeast');
xlim([0 25])