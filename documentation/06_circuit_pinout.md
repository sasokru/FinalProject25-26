# Circuit and Pinout

The circuit for this project connects one sensor input with several output components. The Arduino Uno is the central controller. It reads the signal from the IR sensor and then controls the visual outputs of the system.

The setup is still relatively simple, but because the project changed several times during development, it was important to document the final wiring clearly.

## Main Connections
The main elements of the circuit are:
- IR beam sensor as input
- RGB LED as visual status output
- OLED display as information output
- Arduino Uno as controller

## Final Pin Assignment

XXXXX! add schaltplan

## Notes on the Wiring
The RGB LED was used to show different flow states through colour. This made the system easier to understand visually during testing and demonstration.

The OLED display was connected through I2C, which kept the wiring simpler than assigning many separate digital pins.

The IR sensor was connected as the main detection element. Because the sensor behaviour depended strongly on the physical setup, correct wiring alone was not enough. Placement and alignment were just as important.

## Important Note
This pin table describes the final intended version of the setup. Earlier versions used different assignments while I was testing the system. If the final Arduino code differs from this table, the code should be treated as the authoritative version and this documentation should be updated accordingly.

## Schematic
A separate schematic or hand-drawn circuit overview can be added in the `media/schematics/` folder.

## Practical Reflection
Even though the circuit itself is not extremely complicated, getting the system to behave properly was not only a question of wiring. The project showed that in physical computing, a correct circuit diagram is necessary, but not always sufficient. The behaviour of the real object being measured can still create problems that do not appear in a clean diagram.
