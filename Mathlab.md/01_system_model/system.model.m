%% System model for drip monitoring (simplified)
clear; clc; close all;

% Idea:
% I am not modeling the full physical infusion system.
% Instead, I use a simplified dynamic system to describe how
% an underlying flow evolves over time and how it is measured.

% State-space representation

A = [-1 1;
      0 -1];

B = [0;
     1];

C = [0 1];

D = 0;

% Create state-space system
sys = ss(A, B, C, D);

% Check observability
OB = obsv(A, C);
obs_rank = rank(OB);

disp('Observability matrix:');
disp(OB);

disp(['Rank: ', num2str(obs_rank)]);

% Simple simulation
t = 0:0.01:5;
u = ones(size(t));   % constant input (steady flow)

[y, t, x] = lsim(sys, u, t);

% Plot results
figure;
plot(t, x(:,1), t, x(:,2));
legend('state x1', 'state x2');
xlabel('Time (s)');
ylabel('States');
title('System states over time');

figure;
plot(t, y);
xlabel('Time (s)');
ylabel('Measured output');
title('Measured output (what the sensor sees)');
