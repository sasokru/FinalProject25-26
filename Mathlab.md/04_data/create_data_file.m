%% create_data_file.m
clear; clc;

% Reconstructed / example drip-rate data
% Unit: drops per minute (gtt/min)
z_gtt_min = [30 31 29 30 32 30 29 33 31 30 34 30 29 40 31 30];

% Assumed macrodrip factor
drop_factor = 20;   % 20 drops = 1 mL

save('drip_data.mat', 'z_gtt_min', 'drop_factor');

disp('drip_data.mat was created successfully.');
