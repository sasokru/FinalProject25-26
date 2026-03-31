%% Simple system model for drip rate estimation
clear; clc; close all;

% Idea:
% The true drip rate changes slowly over time.
% The measurement is noisy.

% Simulated measurement (based on your plot)
z = [28 31 30 35 29 27 40 30 29 31 30];

N = length(z);

% Model:
% x(k+1) = x(k) + w
% z(k)   = x(k) + v

% Initialize estimate
x_est = zeros(1,N);
x_est(1) = z(1);

% Simple smoothing (model-based thinking)
for k = 2:N
    % prediction (no change assumed)
    x_pred = x_est(k-1);

    % update (simple correction toward measurement)
    x_est(k) = 0.8 * x_pred + 0.2 * z(k);
end

% Plot
figure;
plot(1:N, z, 'r-o', 'DisplayName','Messung');
hold on;
plot(1:N, x_est, 'b-', 'LineWidth',2, 'DisplayName','Schätzung');
legend;
xlabel('Zeitindex');
ylabel('Tropfrate (Drops/min)');
title('Measurement vs. Estimated drip rate');
