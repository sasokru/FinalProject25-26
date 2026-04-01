%% observer_formal.m 
clear; clc; close all;

% -----------------------------------------
% System definition
% -----------------------------------------
A = [-1 1;
      0 -1];

B = [0;
     1];

C = [0 1];

% -----------------------------------------
% Observability
% -----------------------------------------
OB = [C; C*A];

disp('Observability matrix:');
disp(OB);

disp('Rank of observability matrix:');
disp(rank(OB));

% -----------------------------------------
% -----------------------------------------
L = [2; 5];

disp('Observer gain L:');
disp(L);

% -----------------------------------------
% Simulation
% -----------------------------------------
dt = 0.01;
T = 8;
t = 0:dt:T;

u = ones(size(t));

x = [0; 0];
x_hat = [0; 0];

x_store = zeros(2, length(t));
xhat_store = zeros(2, length(t));
y_store = zeros(1, length(t));

for k = 1:length(t)

    y = C*x;

    % real system
    x_dot = A*x + B*u(k);
    x = x + dt*x_dot;

    % observer
    xhat_dot = A*x_hat + B*u(k) + L*(y - C*x_hat);
    x_hat = x_hat + dt*xhat_dot;

    % store
    x_store(:,k) = x;
    xhat_store(:,k) = x_hat;
    y_store(k) = y;
end

% -----------------------------------------
% Plot x1
% -----------------------------------------
figure;
plot(t, x_store(1,:), 'r', 'LineWidth', 1.5);
hold on;
plot(t, xhat_store(1,:), 'b--', 'LineWidth', 1.5);
legend('True x_1', 'Estimated x̂_1');
title('Observer performance x_1');
grid on;

% -----------------------------------------
% Plot x2
% -----------------------------------------
figure;
plot(t, x_store(2,:), 'r', 'LineWidth', 1.5);
hold on;
plot(t, xhat_store(2,:), 'b--', 'LineWidth', 1.5);
legend('True x_2', 'Estimated x̂_2');
title('Observer performance x_2');
grid on;