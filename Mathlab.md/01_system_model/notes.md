## System model

Looking at the measurements, the drip rate does not realistically jump as much as the raw signal suggests.

So instead of interpreting every value directly, I assume that:
- the underlying system changes slowly
- sudden deviations are mostly noise

Based on that, I model the system as a simple process where the current state depends on the previous one, plus small variations.

The measurement is treated as a noisy observation of this state.

This is the basis for later applying a Kalman filter.
