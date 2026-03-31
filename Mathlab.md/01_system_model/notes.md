## System model

This is a simplified representation of the drip process.

I am not trying to model the actual physics of infusion, but rather to describe the behavior of the system in a way that allows state estimation later on.

The idea is that there is an underlying continuous process (flow), but the sensor only gives indirect and sometimes unstable measurements.

So the model separates:
- internal system states
- measured output

This is the basis for the observer and later the Kalman filter.
