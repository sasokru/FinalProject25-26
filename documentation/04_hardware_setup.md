# Hardware Setup

## General Setup
The project was built around a real infusion setup instead of only using loose electronic parts on a desk. I wanted the prototype to be physically close to the situation it was based on, so I used an infusion stand, an infusion set with drip chamber, and a NaCl glass bottle.

The electronics were added around this setup. The Arduino controlled the system, the IR sensor was used to detect activity at the drip chamber, and the output was shown through the OLED display and the RGB LED.

## How I built it
At the beginning, the hardware was mainly assembled on a breadboard so I could test things quickly and change the wiring when needed. That was useful because the setup changed several times during development.

The infusion bottle was attached to the stand, and the tubing with the drip chamber was positioned underneath it like in a normal gravity-based infusion system. Around this, I tried to place the sensor in a way that would make detection possible without making the setup too unstable or impractical.

I also worked with a simple outer construction made from cardboard and mounting elements to hold some parts in place and make the setup more manageable.

## Main Parts of the Setup
The hardware setup included:
- infusion stand
- NaCl (Natrium Chloride) glass bottle
- infusion set with drip chamber
- Arduino Uno
- IR beam sensor
- RGB LED
- OLED display
- breadboard, wires, resistors
- cardboard or self-made mounting structure

## Why the physical setup mattered
One thing that became obvious quite quickly was that this project was not only about code. The physical setup had a big influence on whether the system worked or not. Sensor placement, the angle of the chamber, the alignment of components, and the way everything was mounted all affected the behaviour of the prototype.

So the hardware build was not just a container for the code. It was part of the problem itself.

## Development Approach
I did not build the final setup in one go. It developed step by step:
1. basic infusion setup with stand and bottle
2. first sensor positioning attempts
3. connection of LED and display
4. adjustment of mounting and wiring
5. changes based on testing and false detections

This was important because each new step showed something that needed to be improved.

## Current State
The final prototype is still clearly a student prototype and not a polished finished product. But that is also part of the point. The setup shows the idea in a visible and functional way, and it made it possible to test how a healthcare-related monitoring problem can be translated into physical computing.

## Visual Documentation
Photos of the setup, intermediate stages, and the final arrangement are included in the `media/photos/` folder. Early sketches and handwritten ideas are included in `media/sketches/`.
