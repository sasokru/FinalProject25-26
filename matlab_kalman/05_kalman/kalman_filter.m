%% kalman_filter.m
clear; clc; close all;

% -----------------------------------------
% Daten 
% -----------------------------------------
load('../04_data/drip_data.mat');

N = length(z_gtt_min);

% -----------------------------------------
% Einfaches Kalman-Modell
% x_k   = wahrer Tropfraten-Zustand
% z_k   = gemessene Tropfrate
%
% Zustandsgleichung:    x(k) = x(k-1) + w(k)
% Messgleichung:        z(k) = x(k)   + v(k)
% -----------------------------------------

A = 1;   % Zustand bleibt im Mittel ähnlich
H = 1;   % Messung beobachtet direkt den Zustand

Q = 0.2; % Prozessrauschen
R = 4;   % Messrauschen

% -----------------------------------------
% Initialisierung
% -----------------------------------------
x_est = zeros(1,N);   % geschätzter Zustand
P = zeros(1,N);       % Fehlervarianz
K = zeros(1,N);       % Kalman-Gewinn

x_est(1) = z_gtt_min(1);
P(1) = 1;

% -----------------------------------------
% Kalman-Filter
% -----------------------------------------
for k = 2:N
    
    % Vorhersage
    x_pred = A * x_est(k-1);
    P_pred = A * P(k-1) * A' + Q;
    
    % Kalman-Gewinn
    K(k) = P_pred * H' / (H * P_pred * H' + R);
    
    % Update
    x_est(k) = x_pred + K(k) * (z_gtt_min(k) - H * x_pred);
    P(k) = (1 - K(k) * H) * P_pred;
end

% -----------------------------------------
% Einheiten umrechnen
% -----------------------------------------
z_ml_min = z_gtt_min / drop_factor;
x_est_ml = x_est / drop_factor;

% -----------------------------------------
% Plot: drops/min
% -----------------------------------------
figure;
plot(1:N, z_gtt_min, 'r--o', 'LineWidth', 1.5);
hold on;
plot(1:N, x_est, 'b', 'LineWidth', 2);
legend('Measured', 'Kalman estimate');
xlabel('Time index');
ylabel('Drops/min');
title('Kalman filter: measured vs estimated drip rate');
grid on;

% -----------------------------------------
% Plot: mL/min
% -----------------------------------------
figure;
plot(1:N, z_ml_min, 'r--o', 'LineWidth', 1.5);
hold on;
plot(1:N, x_est_ml, 'b', 'LineWidth', 2);
legend('Measured', 'Kalman estimate');
xlabel('Time index');
ylabel('mL/min');
title('Kalman filter: measured vs estimated (mL/min)');
grid on;