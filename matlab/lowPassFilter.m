%% Test low pass filter
clc; clear; clf;

% filtering will help a lot with the derivative term in PID controllers

%% load data
fileName  = 'controllerDelayImpact1ms.csv';
data = readtable(['./data/' fileName]);
time = (data.time - data.time(1))/1000; % time in seconds
speed = data.leftSpeed;

%% low-pass filter
filt005 = filter(speed, 0.05);
filt01 = filter(speed, 0.1);
filt02 = filter(speed, 0.2);

% how to estimate how good the filtering is?
varSpeed = var(speed)
var005 = var(filt005)
var01 = var(filt01)
var02 = var(filt02)


%% plot
subplot(121);
plot(time, speed,'.-');
hold on;
plot(time, filt02, '.-');
plot(time, filt01, '.-');
plot(time, filt005, '.-');
hold off;
grid on;
xlabel('Time [s]');
ylabel('Speed [rpm]');
legend('original', '\alpha = 0.2', '\alpha = 0.1', '\alpha = 0.05');
xlim([0 1.5]);

subplot(122);
plot(time, speed,'.-');
hold on;
plot(time, filt02, '.-');
plot(time, filt01, '.-');
plot(time, filt005, '.-');
hold off;
grid on;
xlabel('Time [s]');
ylabel('Speed [rpm]');
legend('original', '\alpha = 0.2', '\alpha = 0.1', '\alpha = 0.05');
xlim([0.4 0.65]);
ylim([180 217])


function filtered = filter(speed, alpha)
m = length(speed);
sensor = 0;
filtered = zeros(1,m);
for i=1:m
sensor = alpha * speed(i) + (1-alpha) * sensor;
filtered(i) = sensor;
end
end