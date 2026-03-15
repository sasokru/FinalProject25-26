# FinalProject25-26
This is the documentation of my final project "drip.py" in the winter semester of 2025/26.
## drip.py / Arduino IV Drip Monitoring Prototype.

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

## Software and Tools
- **Arduino IDE** for writing and uploading the embedded code
- **GitHub** for documentation and project structure
- **MATLAB / Simulink** for the later analytical extension of the project
- **Fritzing** for the circuit diagram
- **NotebookLM** and **Codex** as helpers for debugging code and when I felt stuck

## Repository Structure

### Documentation
- [`documentation/`](documentation/README.md)  
  written documentation of the project, including motivation, goals, hardware setup, design decisions, code development, and reflection

### Arduino Code
- [`code_arduino/`](code_arduino/README.md)  
  final Arduino sketch and reconstructed earlier development stages

### Media
- [`media/`](media/README.md)  
  photos, sketches, schematics, plots, and the demo video

### MATLAB
- [`matlab/`](matlab/)  
  material related to later data analysis and filtering


## Connection to MATLAB and Kalman Filtering
The final Arduino code already uses a simple exponential moving average to make the displayed flow value less unstable.

In addition to that, the project is connected to a later MATLAB-based analysis step. The idea is that raw measurement data from the prototype can be processed further and compared with a filtered version, for example using a Kalman filter. In this repository, that part is included only briefly, because the main focus here is the hardware prototype itself.

## Project Status
The result is a working prototype and proof of concept, not a finished medical product. The project shows how a healthcare-related observation problem can be translated into a physical computing setup and documented as an iterative development process.

## Disclaimer
This project was created for educational purposes. It is an experimental prototype and not a certified medical device. It is not intended for clinical use.

## Author
**Sarah Kruschinski**  
Business Informatics
Digital Media / Business Administration  
Interest areas: digital health, healthcare process optimisation, physical computing
