## Simulation

Before working with actual or reconstructed data, I created a simple simulation of a drip process.

The idea was to have a controlled signal that behaves similarly to what I observed in the project:
- a mostly stable drip rate
- small natural fluctuations
- one short disturbance
- and additional measurement noise

The baseline was set to around 30 drops/min, which corresponds to a realistic gravity infusion using a macrodrip setup (20 drops per mL).

This allows the signal to be interpreted both in:
- drops/min
- mL/min

The goal of this simulation is not to reproduce a real infusion system in detail, but to create a scenario where the behavior of estimation methods can be tested clearly.

In the plots:
- the true signal represents the underlying drip rate
- the measured signal includes noise
- the estimated signal shows a smoothed version

This step helps to understand the general idea of filtering before applying it to actual data.