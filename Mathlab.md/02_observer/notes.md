## Observer

Before going into a Kalman filter, I wanted to keep the estimation idea as simple as possible.

The raw drip measurements fluctuate more than the actual flow realistically would, so I used a basic observer-style update:
- start from the previous estimate
- then correct it slightly toward the new measurement

This already shows the general logic of state estimation:
the system is not described only by the newest measured value, but also by its previous behavior.

The measurement values were chosen in a realistic range for adult gravity infusions and are meant to reflect a mostly stable drip rate with some disturbances or noisy readings.

## Formal observer design

After setting up a simplified system model, I used a formal state observer to estimate the internal states of the system.

The main idea is that the measured output does not contain the full system information by itself. Instead, the observer combines:
- the system model
- the input
- the measured output

to reconstruct internal states over time.

I first checked whether the system is observable. This is important because state estimation only makes sense if the internal states can in principle be reconstructed from the measurement.

Then I designed the observer gain using pole placement. The observer poles were chosen in the stable negative range so that the estimated states converge quickly toward the true states.

This is still based on a simplified model and is not meant to represent the full physics of an infusion system. The point here is to understand the estimation principle and create a basis for the later Kalman filter approach.
