# Arduino Code

This folder contains the Arduino code for the infusion drip monitoring prototype.

## Structure
- `final_code.ino/` contains the final integrated Arduino sketch used for the prototype
-  The other two files contain earlier development stages that were crucial in the process.

## Main Functions of the Final Code
The final Arduino code:
- reads the IR sensor signal
- counts detected drops
- avoids multiple counts of the same drop with a minimum gap
- calculates flow values
- smooths the flow value with an exponential moving average
- shows the current state via RGB LED
- outputs information on the OLED display
- prints values to the Serial Monitor

## Final Pin Assignment
- Sensor: D4
- RGB red: D9
- RGB green: D8
- RGB blue: D5
- OLED: I2C

## Notes
The final code uses `INPUT_PULLUP` for the sensor input and treats `LOW` as the active sensor state.
