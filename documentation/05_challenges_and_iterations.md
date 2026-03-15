# Challenges and Iterations

## Overview
This project changed a lot while I was building it. The original idea was clear, but once I started testing the hardware, several problems came up that forced me to adapt both the setup and the code.

A big part of the project was therefore not just building the prototype, but reacting to things that did not work as expected.

## Main Challenges

### 1. Sensor reliability
One of the biggest issues was the IR beam sensor. In theory, it seemed like a simple and useful way to detect drops in the drip chamber. In practice, it turned out to be more sensitive to the setup than I expected.

The material of the chamber, the exact positioning, and the alignment of the sensor all had an influence. This made the system less stable than I had originally hoped. Luckily a family member of mine has a 3D printer, so I planned on stabilizing the sensors by creating a holder that
would make the IR beam transmitter and receiver stay in place. At first I had thought about using glue, but then the 3D printer came up and I took the measurements of the diameter of the chamber of the infusion system (18 mm) and the depth and width of the transmitter and receiver ( same for both,
depth 8mm and width 9 mm. I then added one milimeter to each of the last two measurements so that they would fit into the hard plastic. The result was the following product and it worked out perfectly fine:

### 2. False or continuous detection
At some points during testing, the system behaved as if drops were being detected continuously, even when that was not really the case. This was one of the most frustrating problems because it made the output unreliable. It was mostly due to the plastic of the chamber, through which the light
of the IR beam transmiter travelled to the receiver and which broke the light twice before it reached the receiver. To solve this, I used a screwdriver to make small holes into the outer wall of the chamber so that the light would only travel through air (and liquid that drops within).

This showed that a sensor signal alone is not automatically meaningful. It still has to be interpreted correctly, and the physical conditions around the sensor matter a lot.

### 3. Physical construction
Another challenge was the physical build itself. It is one thing to connect components electronically, but another to build them into a setup that actually holds together and makes sense spatially.

Because the project involved an infusion stand, bottle, tubing, drip chamber, sensor, and Arduino components, the physical arrangement was more complicated than a normal small desk prototype.

### 4. Feedback design
Originally, the concept also included acoustic feedback with a buzzer. During development, I realised that this did not really improve the prototype in a useful way. It felt more distracting than helpful, especially for demonstrating the system.

So later I decided to leave it out and focus more on visual feedback instead.

### 5. Translating idea into reality
In the first concept, the system was imagined in a very clear way: detect drops, classify flow state, communicate status. In reality, every part of that chain had to be adjusted. The project taught me that even a simple idea becomes more complex when you actually build it.

## Iterations and Changes
During the project I changed several things, for example:
- the physical sensor placement
- the LED pin setup
- the logic of the system states
- the overall mounting of the components
- the role of the buzzer
- the structure of the code

Some changes were small, others affected the whole behaviour of the prototype.

## Example of Iterative Development

| Problem | Suspected reason | What I tried | Result |
|---|---|---|---|
| sensor detected drops all the time | setup interference / bad positioning | changed placement and adjusted logic | partly improved |
| hardware felt unstable | mounting was too improvised | used stand and additional support structure | setup became more manageable |
| buzzer was not useful | feedback was too distracting | removed buzzer from final version | visual output became clearer |
| LED behaviour needed adjustment | states were not shown clearly enough | revised colour logic and pin usage | output became easier to understand |

## What I learned from this
The biggest lesson from this phase was that hardware, code, and physical context cannot really be separated. A lot of the debugging was not only programming, but also positioning, observing, rebuilding, and simplifying.

That is also why documenting the process matters here. The final prototype only makes sense when the failed attempts and changes are included as part of the project.
