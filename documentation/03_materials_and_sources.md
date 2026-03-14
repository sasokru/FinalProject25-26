# Materials and Sources

## Overview
For this project I used a mix of standard Arduino components and a real infusion setup. The goal was to build a prototype that is technically simple enough to realise within the course, but still close enough to a realistic healthcare context to make the idea meaningful.

Some parts were bought specifically for the project, while others came from things I already had or from the hospital context.

## Main Components

| Component | Use in the project | Source |
|---|---|---|
| Arduino Uno | main controller of the system | existing  |
| IR beam sensor | detection of drops in the drip chamber | bought |
| RGB LED | visual feedback for system status | existing |
| OLED display | output of information | bought |
| resistors | for the circuit | existing |
| jumper wires | wiring the components | existing |
| breadboard | testing and temporary setup | existing |
| perfboard / soldering materials | considered for a more fixed setup | bought |
| push button | part of the earlier concept | existing |
| active buzzer | originally planned as acoustic feedback | existing |

## Infusion Setup

| Component | Use in the project | Source |
|---|---|---|
| infusion stand | physical structure for the setup | bought |
| infusion set with drip chamber | central element to be monitored | hospital |
| NaCl glass bottle | fluid source for the setup | hospital |
| tubing | part of the infusion system | hospital / infusion set |
| cardboard construction / holder | mounting and stabilising parts of the prototype | self-made / self- made 3D print|

## Software

| Tool | Use |
|---|---|
| Arduino IDE | writing and uploading the Arduino code |
| GitHub | documentation and final project submission |
| MATLAB | later analysis of measurement data |
| Simulink | simple visual representation of the filtering idea |

## Why I chose these materials
I chose the components mainly based on what was practical, affordable, and available in time. The Arduino setup made sense because it is easy to test and change while building the prototype. The IR sensor seemed like a good option for detecting drops without having to build a much more complex measuring system.

The infusion stand, infusion set, and NaCl bottle were important because I did not want the project to stay completely abstract. I wanted the setup to actually resemble the context I had in mind.

## Practical Notes
Not every material that was part of the original idea ended up being equally useful. For example, the buzzer and push button were included in the first concept, but later the project developed in a slightly different direction. During testing, it became clearer which parts were actually helping the prototype and which parts were unnecessary or distracting.

The same is true for the sensor choice. The IR beam sensor worked as a low-cost and accessible solution, but it also caused some difficulties because the physical setup mattered a lot. Positioning, alignment, and the material of the drip chamber all influenced the behaviour of the system.

## Reflection on Material Choice
Overall, the materials were suitable for building a working prototype, even if they were not perfect. That is also part of the project: not just showing the final setup, but also showing which components were chosen, why they were chosen, and where their limits became visible.

