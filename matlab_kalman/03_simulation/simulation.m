%% simulation.m
clear; clc; close all;

% -----------------------------------------
% Parameters
% -----------------------------------------
drop_factor = 20;      % 20 drops = 1 mL
N = 30;                % number of time steps
baseline = 30;         % normal drip rate in drops/min
noise_std = 1.5;       % measurement noise

% -----------------------------------------
% Simulated "true" drip rate
% -----------------------------------------
x_true = zeros(1,N);
x_true(1) = baseline;

for k = 2:N
    % slow variation around the baseline
    x_true(k) = x_true(k-1) + 0.2*randn;
end

% one short disturbance / spike
x_true(18) = x_true(18) + 6;

% -----------------------------------------
% Simulated measurement
% -----------------------------------------
z_gtt_min = x_true + noise_std*randn(1,N);

% -----------------------------------------
% Simple smoothing / estimation
% -----------------------------------------
x_est = zeros(1,N);
x_est(1) = z_gtt_min(1);

L = 0.2;

for k = 2:N
    x_pred = x_est(k-1);
    x_est(k) = x_pred + L*(z_gtt_min(k) - x_pred);
end

% -----------------------------------------
% Unit conversion
% -----------------------------------------
x_true_ml = x_true / drop_factor;
z_ml = z_gtt_min / drop_factor;
x_est_ml = x_est / drop_factor;

% -----------------------------------------
% Plot 1: drops/min
% -----------------------------------------
figure;
plot(1:N, x_true, 'k', 'LineWidth', 2);
hold on;
plot(1:N, z_gtt_min, 'r--o', 'LineWidth', 1.2);
plot(1:N, x_est, 'b', 'LineWidth', 2);
legend('True signal', 'Measured signal', 'Estimated signal');
xlabel('Time index');
ylabel('Drops/min');
title('Simulation of drip rate (drops/min)');
grid on;

% -----------------------------------------
% Plot 2: mL/min
% -----------------------------------------
figure;
plot(1:N, x_true_ml, 'k', 'LineWidth', 2);
hold on;
plot(1:N, z_ml, 'r--o', 'LineWidth', 1.2);
plot(1:N, x_est_ml, 'b', 'LineWidth', 2);
legend('True signal', 'Measured signal', 'Estimated signal');
xlabel('Time index');
ylabel('mL/min');
title('Simulation of drip rate (mL/min)');
grid on;