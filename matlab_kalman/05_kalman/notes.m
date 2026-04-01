## Kalman filter

This folder contains a simple Kalman filter implementation for the drip-rate signal.

The idea is that the measured drip rate is noisy and does not always reflect the actual underlying flow directly. Instead of trusting each measurement equally, the Kalman filter combines:
- the previous estimate
- a simple system model
- the new measurement

This leads to a smoother and more plausible estimate of the drip rate over time.

In this project, the filter is applied to a reconstructed example dataset based on realistic infusion values. The results are shown both in:
- drops/min
- mL/min

The goal is not to create a perfect clinical model, but to demonstrate how estimation methods can improve noisy measurement signals.