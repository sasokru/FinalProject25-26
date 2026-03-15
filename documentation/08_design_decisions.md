# Design Decisions

This project changed quite a lot during development, so some of the final design decisions were not things I knew from the beginning. A lot of them came out of testing, noticing what was not working well, and then simplifying the setup.

The final version is therefore not just the result of the original idea, but also of practical decisions made along the way.

## Why I used an IR sensor
I chose the IR sensor because it seemed like a simple and affordable way to detect activity in the drip chamber. For a student prototype, it made sense as a starting point because it allowed me to test the idea without building a much more complicated sensing system.

At the same time, the project showed that this choice also had limits. The sensor behaviour depended a lot on positioning, alignment, and the physical properties of the chamber. So while it was a reasonable choice for prototyping, it is probably not the most robust solution for a more advanced version.

## Why I used an RGB LED
The RGB LED was one of the most useful output elements in the project because it made the system state visible immediately. I wanted the prototype to communicate clearly whether the flow was too low, normal, or too fast.

In the final version, the colour logic was:
- red = low flow or no flow
- green = normal flow
- blue = fast flow

That made the output easy to understand during testing and also useful for the demo video.

## Why I kept the OLED display
The OLED display made the prototype more informative than the LED alone. Instead of only showing a colour, it could also display values like total drops, estimated total volume, and current flow.

I kept the display because it made the system easier to interpret and helped connect the physical setup with the data side of the project.

## Why I removed the buzzer
The buzzer was part of the earlier idea, but during testing I realised that it did not improve the prototype in a useful way. It was more distracting than helpful and did not add much compared to the visual output.

Because of that, I decided to leave it out of the final version and focus on the parts that made the setup clearer instead of more complicated.

## Why I used simple smoothing in the Arduino code
In the final code, I added a simple exponential moving average to smooth the flow value. I did this because the measured values could change quite abruptly from one interval to the next, especially when the signal was not perfectly stable.

The smoothing does not solve the sensor problem completely, but it makes the displayed flow value less nervous and easier to read.

## Why I kept the code relatively focused
There were many ways to make the project more complex, but I decided that for this stage it was better to have one understandable and functioning prototype than too many extra features that would make the system harder to control.

That is also why the final code focuses on a few core tasks:
- detect drops
- count them reliably
- calculate flow values
- smooth the current flow estimate
- show the result visually

## Why I used a real infusion setup
I decided early on that I did not want the project to stay purely abstract. That is why I worked with a real infusion stand, infusion set, and NaCl bottle. It made the project more meaningful to me and closer to the actual context that motivated it.

This also made things harder, because the physical build became part of the technical problem. But overall I still think it was the right choice.

## Conclusion
The final design decisions reflect a balance between the original idea, practical limitations, available materials, and the goal of producing a prototype that could actually be demonstrated. Some parts of the concept stayed, some were simplified, and some turned out to be better left out.
