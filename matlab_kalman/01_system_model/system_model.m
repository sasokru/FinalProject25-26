%% system_model.m
clear; clc; close all;

% -----------------------------------------
% Simplified system model for drip rate
% -----------------------------------------
% Idea:
% The underlying drip rate changes slowly over time.
% The measured value is only an indirect and noisy version of this process.

A = 1;    % state stays approximately similar
B = 0;    % no external input used here
C = 1;    % measurement directly reflects the state
D = 0;

% -----------------------------------------
% Simulation settings
% -----------------------------------------
N = 30;
x = zeros(1,N);      % true state
z = zeros(1,N);      % measured output

x(1) = 30;           % starting value in drops/min

for k = 2:N
    % state changes only slowly
    x(k) = x(k-1) + 0.2*randn;
end

% measurement with added noise
z = x + 1.5*randn(1,N);

% -----------------------------------------
% Plot
% -----------------------------------------
figure;
plot(1:N, x, 'k', 'LineWidth', 2);
hold on;
plot(1:N, z, 'r--o', 'LineWidth', 1.2);
legend('True state', 'Measured output');
xlabel('Time index');
ylabel('Drops/min');
title('Simplified system model for drip rate');
grid on;