# MATLAB

(still in progress, mainly relevant for Prof. Mercorelli)

This folder contains material related to the later analytical extension of the project.

The main idea is to use measurement data from the Arduino-based infusion monitoring prototype and analyse it further in MATLAB or Simulink.

## Contents
- `data/` for exported or manually transferred measurement data
- `scripts/` for MATLAB code
- `simulink/` for model-based representations
- `figures/` for plots and visual output

## Relation to the project
The Arduino prototype already includes simple smoothing with an exponential moving average.

The MATLAB part goes one step further by exploring how noisy measurement data could be filtered and interpreted more systematically, for example with a Kalman filter.
