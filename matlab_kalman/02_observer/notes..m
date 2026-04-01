## Observer

In this step, I looked at a simplified observer approach before going to the Kalman filter.

The idea is that the system may have internal states that are not directly visible from the measurement alone. Instead of relying only on the measured output, the observer combines:
- the system model
- the input
- the measured value

to estimate the internal behavior over time.

Because I did not use the full toolbox-based version here, I kept the implementation simple and chose the observer gain manually. The goal was not to build a perfect control-theory model, but to understand the principle of state estimation in a way that is still connected to the overall project.

This step is important because it shows the transition from:
- direct measurement
to
- model-based estimation

and therefore builds the conceptual bridge toward the Kalman filter.