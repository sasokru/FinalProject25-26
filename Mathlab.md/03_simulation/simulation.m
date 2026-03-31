%% Simulation of realistic IV drip measurements
clear; clc; close all;

% -------------------------------------------------
% PARAMETERS
% -------------------------------------------------
drop_factor = 20;        % 20 drops per mL (macrodrip)
N = 60;                  % number of time steps
baseline_gtt_min = 30;   % realistic adult baseline
noise_std = 1.2;         % measurement noise
disturbance_index = 35;  % one short disturbance
disturbance_size = 8;    % spike in drops/min

% -------------------------------------------------
% TRUE DRIP RATE (drops/min)
% -------------------------------------------------
x_true = zeros(1, N);
x_true(1) = baseline_gtt_min;

for k = 2:N
    % slowly varying true signal
    x_true(k) = x_true(k-1) + 0.15 * randn;
end

% add one disturbance
x_true(disturbance_index) = x_true(disturbance_index) + disturbance_size;

% -------------------------------------------------
% NOISY MEASUREMENT
% -------------------------------------------------
z = x_true + noise_std * randn(1, N);

% -------------------------------------------------
% SIMPLE ESTIMATE (observer-like smoothing)
% -------------------------------------------------
x_est = zeros(1, N);
x_est(1) = z(1);

L = 0.2;   % correction gain

for k = 2:N
    x_pred = x_est(k-1);                 % prediction
    x_est(k) = x_pred + L * (z(k) - x_pred); % correction
end

% -------------------------------------------------
% CONVERT TO mL/min
% -------------------------------------------------
x_true_ml = x_true / drop_factor;
z_ml = z / drop_factor;
x_est_ml = x_est / drop_factor;

% -------------------------------------------------
% OPTIONAL: convert to drops/sec
% -------------------------------------------------
x_true_gtt_sec = x_true / 60;
z_gtt_sec = z / 60;
x_est_gtt_sec = x_est / 60;

% -------------------------------------------------
% PLOTS
% -------------------------------------------------
figure;
plot(1:N, x_true, 'k', 'LineWidth', 2, 'DisplayName', 'True rate');
hold on;
plot(1:N, z, 'r--o', 'DisplayName', 'Measurement');
plot(1:N, x_est, 'b', 'LineWidth', 2, 'DisplayName', 'Estimate');
legend('Location', 'best');
xlabel('Time index');
ylabel('Drops/min');
title('Simulation of IV drip rate (drops/min)');
grid on;

figure;
plot(1:N, x_true_ml, 'k', 'LineWidth', 2, 'DisplayName', 'True rate');
hold on;
plot(1:N, z_ml, 'r--o', 'DisplayName', 'Measurement');
plot(1:N, x_est_ml, 'b', 'LineWidth', 2, 'DisplayName', 'Estimate');
legend('Location', 'best');
xlabel('Time index');
ylabel('mL/min');
title('Simulation of IV drip rate (mL/min)');
grid on;

figure;
plot(1:N, x_true_gtt_sec, 'k', 'LineWidth', 2, 'DisplayName', 'True rate');
hold on;
plot(1:N, z_gtt_sec, 'r--o', 'DisplayName', 'Measurement');
plot(1:N, x_est_gtt_sec, 'b', 'LineWidth', 2, 'DisplayName', 'Estimate');
legend('Location', 'best');
xlabel('Time index');
ylabel('Drops/sec');
title('Simulation of IV drip rate (drops/sec)');
grid on;

% -------------------------------------------------
% PRINT SOME BASIC VALUES
% -------------------------------------------------
disp('--- Baseline assumptions ---');
disp(['Drop factor: ', num2str(drop_factor), ' gtt/mL']);
disp(['Baseline: ', num2str(baseline_gtt_min), ' drops/min']);
disp(['Baseline in mL/min: ', num2str(baseline_gtt_min / drop_factor)]);
disp(['Baseline in mL/hr: ', num2str((baseline_gtt_min * 60) / drop_factor)]);
