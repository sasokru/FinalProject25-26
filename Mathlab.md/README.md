
# MATLAB / Kalman Seminar

This part of the repository belongs to a separate seminar focused on Kalman filtering and state estimation.

While my main project (Arduino-based drip monitoring) is more hardware-oriented, I realized pretty quickly that the sensor signal itself is not always stable or reliable. Instead of just accepting noisy measurements, I wanted to understand how such a signal could be described and improved from a modeling perspective.

So this folder is basically where I step away from the physical prototype and look at the problem more abstractly.

## Idea

The core idea is simple:
A raw measurement (like detecting drops) is not necessarily a good representation of the actual system behavior.

In my case:

* the sensor sometimes detects false positives
* the signal can fluctuate even when the flow is constant
* small physical changes (e.g. the drip chamber) affect the readings

Instead of relying only on direct measurements, I explore how a system model + estimation methods can help reconstruct a more stable signal.

## Approach

I started with a simplified linear state-space model and checked whether the system is observable. Based on that, I implemented a basic observer using pole placement.

This is not yet a full Kalman filter, but it builds the foundation for it.

The general idea is:

* describe the system mathematically
* combine the model with measurements
* estimate internal states instead of trusting raw data

From there, the next step is extending this toward a Kalman-based approach, where noise and uncertainty are explicitly considered.

## Structure

* `01_system_model`
  Initial assumptions and state-space representation of the system

* `02_observer`
  Observer design (based on pole placement)

* `03_simulation`
  Simulations of system behavior and estimated states

* `04_data`
  Experimental or simulated data related to the drip sensor

* `05_kalman`
  Extension toward Kalman filtering (work in progress)

## Relation to the main project

This is not the main implementation of the drip monitor, but rather a conceptual extension.

The Arduino prototype focuses on detecting drops in real time.
This MATLAB part explores what happens if we don’t fully trust those measurements and instead try to estimate the system behind them.

## Note

This is an exploratory part of the project.
The models are simplified and not meant to fully represent real infusion systems, but to understand the underlying principles of state estimation and filtering.
