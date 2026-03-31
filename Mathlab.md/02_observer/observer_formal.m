%% Formal observer design for drip rate estimation
clear; clc; close all;

% Simplified state-space model
% This is not a full physical infusion model.
% It is a reduced dynamic model used to explore state estimation.

A = [-1 1;
      0 -1];

B = [0;
     1];

C = [0 1];

D = 0;

% Check observability
OB = obsv(A, C);
obs_rank = rank(OB);

disp('Observability matrix:');
disp(OB);
disp(['Observability rank: ', num2str(obs_rank)]);

% Desired observer poles
% Chosen negative and fast so the estimate converges quickly
P = [-5 -8];

% Observer gain
L = place(A', C', P)';

disp('Observer gain L:');
disp(L);

% Simulation settings
dt = 0.01;
T = 10;
t = 0:dt:T;

% Input signal
% Chosen to represent a roughly steady infusion with small changes
u = ones(size(t));

% Initial states
x = [0; 0];        % true state
x_hat = [0; 0];    % estimated state

% Storage
x_store = zeros(2, length(t));
xhat_store = zeros(2, length(t));
y_store = zeros(1, length(t));

for k = 1:length(t)
    % Measured output
    y = C*x;

    % True system
    x_dot = A*x + B*u(k);
    x = x + dt*x_dot;

    % Observer
    xhat_dot = A*x_hat + B*u(k) + L*(y - C*x_hat);
    x_hat = x_hat + dt*xhat_dot;

    % Store values
    x_store(:,k) = x;
    xhat_store(:,k) = x_hat;
    y_store(k) = y;
end

% Plot estimated vs true states
figure;
plot(t, x_store(1,:), 'r', 'LineWidth', 1.5);
hold on;
plot(t, xhat_store(1,:), 'b--', 'LineWidth', 1.5);
legend('True state x_1', 'Estimated state x̂_1', 'Location', 'best');
xlabel('Time (s)');
ylabel('State value');
title('Observer performance for state x_1');
grid on;

figure;
plot(t, x_store(2,:), 'r', 'LineWidth', 1.5);
hold on;
plot(t, xhat_store(2,:), 'b--', 'LineWidth', 1.5);
legend('True state x_2', 'Estimated state x̂_2', 'Location', 'best');
xlabel('Time (s)');
ylabel('State value');
title('Observer performance for state x_2');
grid on;

figure;
plot(t, y_store, 'k', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Measured output');
title('Measured output y = Cx');
grid on;
