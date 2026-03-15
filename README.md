# FinalProject25-26
This is the documentation of my final project "drip.py" in the winter semester of 2025/26.
## drip.py / Arduino IV Drip Monitoring Prototype.

# Infusion Drip Monitoring Prototype
This project explores an Arduino-based prototype for monitoring infusion drip activity in a simple experimental setup. The system detects drop-related signals, estimates flow behaviour, and communicates the current state through visual output.

The project was developed in the context of the Technical Basics course at Leuphana University, but it also reflects a broader personal interest: connecting healthcare-related problems with technical prototyping and digital health thinking.

## Why this project?
I did not want to build a purely abstract electronics project. Instead, I wanted to work on a prototype that is connected to a real healthcare-related situation.
Because of my background in nursing and my growing interest in digital health and healthcare process optimisation, infusion monitoring felt like a meaningful topic. It allowed me to translate a practical observation problem into a physical computing project and to reflect on both its technical possibilities and limitations.

## Core Idea
The basic idea was to create a system that can:

- detect drip activity in an infusion chamber
- interpret whether the flow is too low, normal, or too fast
- communicate the state clearly through light and display output

The final prototype uses an IR sensor for detection, an RGB LED for quick visual feedback, and an OLED display for additional information such as state, drop count, and estimated flow values.

## Main Features
- IR sensor-based drop detection
- drop counting with edge detection
- flow estimation in mL/s and mL/min
- simple smoothing of the flow value with an exponential moving average
- RGB LED status indication
- OLED display output
- Serial Monitor output for debugging and observation

## Flow State Logic
The final prototype uses three flow states:

- **Red** → low flow or no flow
- **Green** → normal flow
- **Blue** → fast flow

These states are based on the estimated flow rate and are meant to make the system behaviour easy to understand during testing and demonstration.

## Hardware Components
Main hardware used in the project:

- Arduino Uno
- IR sensor
- RGB LED
- OLED display
- resistors, jumper wires, breadboard
- infusion stand
- infusion set with drip chamber
- NaCl bottle
- self-made cardboard / mounting structure

## Software and Tools
- **Arduino IDE** for writing and uploading the embedded code
- **GitHub** for documentation and project structure
- **MATLAB / Simulink** for the later analytical extension of the project
- **Fritzing** for the circuit diagram

## Repository Structure

### Documentation
- [`documentation/`](docs/README.md)  
  written documentation of the project, including motivation, goals, hardware setup, design decisions, code development, and reflection

### Arduino Code
- [`arduino/`](arduino/README.md)  
  final Arduino sketch and reconstructed earlier development stages

### Media
- [`media/`](media/README.md)  
  photos, sketches, schematics, plots, and the demo video

### MATLAB
- [`matlab/`](matlab/)  
  material related to later data analysis and filtering

### Learning Log
- [`learning-log/`](learning-log/)  
  short reflections on the development process

## Documentation Overview
The written documentation includes:

- problem and motivation
- project goals
- materials and sources
- hardware setup
- challenges and iterations
- circuit and pinout
- code development
- design decisions
- Kalman filter brief
- reflection and future improvements

## Development Process
This project did not develop in a straight line. A large part of the work consisted of testing, rebuilding, adjusting sensor placement, changing code logic, and simplifying features when they turned out not to be useful enough in practice.

That process is an important part of the project. The final prototype only really makes sense together with the documentation of its iterations, limitations, and design decisions.

## Main Challenges
Some of the biggest challenges during development were:

- sensor reliability in the physical setup
- false or continuous detection
- mounting and alignment of the sensor and infusion chamber
- deciding which outputs were actually useful for the final prototype

One result of this process was, for example, that the buzzer from the earlier concept was removed in the final version because the visual feedback turned out to be clearer and more useful.

## Connection to MATLAB and Kalman Filtering
The final Arduino code already uses a simple exponential moving average to make the displayed flow value less unstable.

In addition to that, the project is connected to a later MATLAB-based analysis step. The idea is that raw measurement data from the prototype can be processed further and compared with a filtered version, for example using a Kalman filter. In this repository, that part is included only briefly, because the main focus here is the hardware prototype itself.

## Project Status
The result is a working prototype and proof of concept, not a finished medical product. The project shows how a healthcare-related observation problem can be translated into a physical computing setup and documented as an iterative development process.

## Disclaimer
This project was created for educational purposes. It is an experimental prototype and not a certified medical device. It is not intended for clinical use.

## Author
**Sarah Kruschinski**  
Digital Media / Business Administration  
Interest areas: digital health, healthcare process optimisation, physical computing
