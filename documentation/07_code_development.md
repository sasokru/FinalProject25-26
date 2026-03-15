# Code Development

The code for this project developed step by step together with the hardware. I did not write one finished version from the start. Instead, the code changed during testing whenever something in the setup needed to be adjusted.

This was especially true because the sensor behaviour depended a lot on the physical setup. So coding and hardware testing were closely connected throughout the project.

## Early Development
At the beginning, the main question was simply whether the sensor could detect anything useful at all. The first code versions were therefore mainly about basic reading and simple output.

Once that worked at least partly, I started expanding the system with LED feedback, display output, and a clearer flow-state logic.

## What the final code does
The final code combines several functions in one sketch:
- reading the sensor signal
- counting drops
- avoiding multiple counts for the same drop through a minimum time gap
- calculating flow values
- smoothing the current flow value
- updating the RGB LED based on the flow state
- showing the current information on the OLED display
- printing values to the Serial Monitor

## Sensor Logic
In the final version, the sensor pin is set to `INPUT_PULLUP`. A drop is counted when the signal changes from inactive to active, with `LOW` being treated as the active state.

This matters because the code does not just count every moment where the signal is active. It only counts a change from inactive to active, which helps avoid repeated counting of the same drop.

To reduce false multiple counts, the code also uses a minimum gap of 40 milliseconds between detected drops.

## Measuring and Calculation
The code evaluates the signal once per second. For each interval, it calculates:
- drops detected in that interval
- flow in mL per second
- flow in mL per minute
- total estimated volume in mL

The conversion is based on a drop factor of 20 drops per mL, which represents a typical macrodrip setup.

## Smoothing
The final code also includes simple smoothing using an exponential moving average. This makes the displayed flow value less jumpy and easier to interpret.

That part is useful because the raw signal can change quickly and is not always perfectly stable.

## Flow States
The flow state is divided into three categories:
- below 0.67 mL/min = low or no flow
- between 0.67 and 2.00 mL/min = normal flow
- above 2.00 mL/min = fast flow

These states are shown through the RGB LED and also displayed as text on the OLED screen.

## Display Output
The display shows:
- project title
- current state
- total number of drops
- total estimated volume
- current flow in mL/s
- filtered flow in mL/min

This made the prototype easier to understand during testing because the output was not limited to the LED alone.

## Code Changes During the Project
The code changed several times over the course of the project. These changes included:
- pin changes
- integrating the display
- revising the state logic
- changing the LED behaviour
- removing the buzzer from the final version
- improving counting so that drops were not simply counted continuously

A lot of these changes happened because the first versions did not behave reliably enough in the real setup.

## What I learned from the code development
The main lesson was that code in a physical computing project is not developed in isolation. It has to react to what the real setup actually does. In this project, coding was therefore closely tied to testing, debugging, and simplifying.

That is also why the final code is more focused than the earliest idea. Some parts were reduced or removed so that the final prototype would be clearer and more stable.
