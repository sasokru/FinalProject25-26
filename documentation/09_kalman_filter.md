# Kalman Filter 

## Why this is relevant?
One thing that became clear during the project is that sensor-based measurements are not always clean. Even if the setup works in principle, the signal can still be noisy or unstable, and that makes interpretation harder.

That is why filtering becomes relevant.

## Important distinction
In the Arduino code of the final prototype, I already used a simple smoothing method: an exponential moving average. This helps make the displayed flow value less jumpy.

The Kalman filter is something different. It is not part of the final Arduino sketch itself, but part of the extended analysis I want to connect to the project in MATLAB.

## What the Kalman filter does
The Kalman filter is a method for estimating a more reliable signal from noisy measurements. Instead of taking each measured value at face value, it combines a prediction with the incoming measurement and updates the estimate step by step.

In simple terms, it helps separate the underlying behaviour from short-term noise.

## Why I connect it to this project
This is relevant for the infusion monitoring prototype because the measured signal is not perfectly stable. A filtering method can therefore help make the data easier to interpret, especially over time.

The idea is that the raw data from the Arduino setup can later be analysed in MATLAB and compared with a filtered version.

## Simple explanation
A very simple way to think about it is:

measured value = actual behaviour + noise

The goal of the Kalman filter is to estimate the actual behaviour more clearly instead of reacting too strongly to every noisy measurement.

## Role in this repository
In this repository, the Kalman filter is only included as a short extension of the main hardware project. The focus here is still on building and documenting the Arduino-based prototype.

The Kalman part is therefore kept brief and mainly serves to show how the hardware project can be connected to a later data analysis step.

## MATLAB connection
The more detailed Kalman filter work belongs to the related seminar context, where the measurements can be analysed more thoroughly in MATLAB or Simulink.

In relation to this project, the important point is simply that filtering is useful because the sensor data is not perfectly clean, and that this prototype can provide a meaningful basis for that kind of analysis.
