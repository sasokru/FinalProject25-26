

## Main Goal
The main goal of this project was to develop a functioning prototype for monitoring infusion drip activity using Arduino-based hardware and simple output components.

The system should be able to detect drop activity in the infusion chamber, interpret the current flow situation, and communicate the result through clear feedback.

## Functional Goals
The prototype was designed with the following functional goals:

- detect drip events in the infusion chamber
- use a microcontroller to process the incoming sensor signal
- classify the detected flow behaviour into meaningful states
- communicate system status through visible feedback
- create a demonstrable and understandable hardware setup
- document the full development process from concept to prototype

In the initial project idea, the intended states were:
- lower than specified range
- within the specified range
- higher than specified range 

## Technical Goals
Besides the practical functionality, the project also had several technical learning goals:

- applying Arduino programming in a physical computing context
- integrating sensor input and hardware output
- working with an OLED display and RGB LED
- building and adjusting a real physical setup around an infusion stand
- improving the system iteratively through testing and debugging
- preparing the measured data for later analysis and filtering

## Documentation Goals
A second important goal was to document the project in a structured and transparent way. 

This includes:
- explaining the initial problem and motivation
- documenting materials and component choices
- showing the hardware setup
- reflecting on challenges and design decisions
- presenting the code development process
- briefly connecting the prototype to MATLAB-based signal filtering

## Extended Analytical Goal
An additional goal was to connect the hardware project to a second analytical layer: the use of a Kalman filter to smooth and interpret noisy measurement data. In this repository, that part is only introduced briefly, because the more detailed treatment belongs to the related seminar context.



