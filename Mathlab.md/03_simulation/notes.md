## Simulation

This simulation is meant to create a simple but plausible infusion scenario.

I assumed:
- a macrodrip setup with 20 drops per mL
- a baseline drip rate of about 30 drops/min
- small fluctuations over time
- one short disturbance
- additional measurement noise

The goal is not to perfectly reproduce a clinical infusion system, but to create a controlled signal that behaves more realistically than a completely random one.

This makes it easier to test estimation methods and compare:
- the underlying true signal
- the noisy measurement
- the estimated signal

For consistency with the hardware project, the results are shown in:
- drops/min
- mL/min
- drops/sec
