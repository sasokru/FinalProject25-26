## Data

This folder contains a first dataset for testing the estimation approach.

At this stage, the values are reconstructed example values based on the kind of behavior observed in the project:
- mostly stable drip rate
- small fluctuations
- one short disturbance / spike

The data is stored in a `.mat` file so that the analysis script can load it directly.

The signal is evaluated in:
- drops/min
- mL/min
- drops/sec

This makes the MATLAB part easier to compare with the hardware project, where the drip rate can also be interpreted in different units.
