# Problem and Motivation


## Problem Context
Intravenous infusions are a common part of patient care in hospitals and other healthcare settings. Fluids such as antibiotics, pain medication, or saline solution are often administered through gravity-based infusion systems. In these systems, liquid drops from the bottle into the drip chamber and then continues through the tubing to the patient. Monitoring whether the infusion is dripping as intended is therefore an important practical issue. Nowadays, nurses do not know whether there might be a problem with the IV, such as it not running at all or it being through, unless they go into the room and look at the system (which has mostly clear liquid in a clear plastic line) very closely. 
You can see reference pictures in the media section. XX

This project explores how such a process can be translated into a simple physical-computing prototype. The idea was to build an infusion drop monitoring system that detects drops flowing from the infusion bottle into the chamber of the plastic line system, estimates the flow behaviour, and communicates the current state clearly by a lamp and a monitor (which could possibly be linked to the nursing station). In the initial concept, the system was intended to classify the flow into three categories: below the specified range, within the specified range, and above the specified range. 

## Why this topic?
I chose this topic because it combines a meaningful healthcare-related scenario with electronics, prototyping, and data interpretation. Rather than building a purely abstract Arduino project, I wanted to work on a problem that is connected to real clinical routines and to my own background in nursing.
The project also reflects my growing interest in digital health and healthcare process optimization. I am especially interested in how technical systems can support observation, improve visibility, and translate practical care-related problems into measurable and interpretable signals.

## Personal Motivation
For me, this project was not only about building a sensor-based system, but also about testing how technical thinking can be applied to a healthcare context. It allowed me to connect my practical knowledge of infusion systems, hardware prototyping with Arduino, signal interpretation and status feedback, and later, a first step toward data smoothing with a Kalman filter in MATLAB.

This makes the project a small but meaningful example of the direction I would like to continue in: combining healthcare knowledge with technical problem-solving.

## Core Idea
The core idea behind the prototype was to create a system that:

- detects infusion drops in the drip chamber,
- interprets the resulting flow behaviour,
- and communicates the state of the system in an understandable way.

In the early concept, status communication was planned via light and sound, with possible interaction through buttons and buzzers. During development, this concept was simplified and adapted to what was technically feasible and most useful for the final prototype. 

## Project Scope
This project is an experimental prototype and proof of concept. It is not a certified medical device and is not intended for clinical use. The purpose of the project is to explore a healthcare-related monitoring scenario through physical computing, documentation, and iterative technical development.

