## Observer

Before going into a Kalman filter, I wanted to keep the estimation idea as simple as possible.

The raw drip measurements fluctuate more than the actual flow realistically would, so I used a basic observer-style update:
- start from the previous estimate
- then correct it slightly toward the new measurement

This already shows the general logic of state estimation:
the system is not described only by the newest measured value, but also by its previous behavior.

The measurement values were chosen in a realistic range for adult gravity infusions and are meant to reflect a mostly stable drip rate with some disturbances or noisy readings.
