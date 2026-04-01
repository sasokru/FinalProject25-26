%% data_analysis.m
clear; clc; close all;

% Load saved data
load('drip_data.mat');

N = length(z_gtt_min);

% -----------------------------------------
% Simple estimation / smoothing
% -----------------------------------------
x_est = zeros(1, N);
x_est(1) = z_gtt_min(1);

L = 0.2;   % correction gain

for k = 2:N
    x_pred = x_est(k-1);
    x_est(k) = x_pred + L * (z_gtt_min(k) - x_pred);
end

% -----------------------------------------
% Unit conversions
% -----------------------------------------
z_ml_min = z_gtt_min / drop_factor;
x_est_ml = x_est / drop_factor;

z_gtt_sec = z_gtt_min / 60;
x_est_gtt_sec = x_est / 60;

% -----------------------------------------
% Plots
% -----------------------------------------
figure;
plot(1:N, z_gtt_min, 'r--o', 'LineWidth', 1.5, 'DisplayName', 'Measured rate');
hold on;
plot(1:N, x_est, 'b', 'LineWidth', 2, 'DisplayName', 'Estimated rate');
legend('Location', 'best');
xlabel('Time index');
ylabel('Drops/min');
title('Measured vs estimated drip rate (drops/min)');
grid on;

figure;
plot(1:N, z_ml_min, 'r--o', 'LineWidth', 1.5, 'DisplayName', 'Measured rate');
hold on;
plot(1:N, x_est_ml, 'b', 'LineWidth', 2, 'DisplayName', 'Estimated rate');
legend('Location', 'best');
xlabel('Time index');
ylabel('mL/min');
title('Measured vs estimated drip rate (mL/min)');
grid on;

figure;
plot(1:N, z_gtt_sec, 'r--o', 'LineWidth', 1.5, 'DisplayName', 'Measured rate');
hold on;
plot(1:N, x_est_gtt_sec, 'b', 'LineWidth', 2, 'DisplayName', 'Estimated rate');
legend('Location', 'best');
xlabel('Time index');
ylabel('Drops/sec');
title('Measured vs estimated drip rate (drops/sec)');
grid on;

% -----------------------------------------
% Summary values
% -----------------------------------------
disp('--- Data summary ---');
disp(['Mean measured rate:  ', num2str(mean(z_gtt_min)), ' drops/min']);
disp(['Mean estimated rate: ', num2str(mean(x_est)), ' drops/min']);
disp(['Mean measured rate:  ', num2str(mean(z_ml_min)), ' mL/min']);
disp(['Mean estimated rate: ', num2str(mean(x_est_ml)), ' mL/min']);
