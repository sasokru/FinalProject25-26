%% Observer idea for drip rate estimation
clear; clc; close all;

% Assumption:
% The true drip rate changes slowly over time.
% The measured drip rate is noisy.
%
% Example measurements in drops/min:
% Chosen to stay in a realistic range for adult gravity infusion
% using macrodrip tubing (e.g. 20 gtt/mL), roughly corresponding
% to about 84-120 mL/hr.

z = [28 31 30 35 29 27 40 30 29 31 30];
N = length(z);

% Simple observer-style estimate
% Idea:
% previous estimate + correction toward current measurement

x_hat = zeros(1, N);
x_hat(1) = z(1);

L = 0.2;   % correction gain

for k = 2:N
    x_pred = x_hat(k-1);                 % prediction
    x_hat(k) = x_pred + L*(z(k)-x_pred); % correction
end

% Plot
figure;
plot(1:N, z, 'r-o', 'DisplayName', 'Measurement z');
hold on;
plot(1:N, x_hat, 'b-', 'LineWidth', 2, 'DisplayName', 'Observer estimate');
legend('Location','best');
xlabel('Time index');
ylabel('Drip rate (drops/min)');
title('Measured drip rate vs observer estimate');
grid on;
