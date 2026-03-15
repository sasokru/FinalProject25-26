# Code Development


The code for this project developed step by step together with the hardware. I did not write one final version from the start. Instead, the code changed whenever I tested the setup and noticed that something was not working properly yet.

This was especially true because the behaviour of the sensor depended a lot on the physical arrangement of the setup. So the code and the hardware development were closely connected.

## Early Stage
In the beginning, the code was mainly about getting a basic signal from the sensor and checking whether the system was reacting at all. At that stage, the focus was not yet on a polished final logic, but on simple testing:
- is the sensor giving any usable signal?
- can the Arduino read it?
- can I trigger an output from it?

Once that worked to some degree, I started adding more elements like the LED behaviour and display output.

## Development Steps
The code changed over several stages:

1. basic sensor reading  
2. first drop detection logic  
3. adding visual feedback  
4. connecting the OLED display  
5. adjusting pin assignments  
6. changing the status logic  
7. removing the buzzer from the final version  
8. combining everything into one final sketch  

Not every version worked well. Some changes were made because the previous version gave false detections or unclear output.

## What made coding difficult
The hard part was not writing syntax on its own. The harder part was deciding how the incoming signal should be interpreted. In theory, the idea sounded simple: detect drop activity and classify the flow state. In practice, the sensor did not always behave in a perfectly stable way.

That meant the code had to be adjusted several times so that the system behaviour made more sense during testing.

## Structure of the final code
The final code includes:
- reading the sensor input
- interpreting the signal in relation to flow activity
- showing the current state through the RGB LED
- displaying information on the OLED screen

Compared to the initial idea, the final version is more reduced and focused on making the prototype understandable and demonstrable.

## Why the code changed over time
A lot of the code changes were caused by testing the real setup. The project showed that in physical computing, code often has to react to what the hardware actually does, not just what it was supposed to do in theory.

So the code development was part of the general iteration process, not a separate clean phase.

## File Structure
The final version of the program is stored in the main Arduino file of this repository.
