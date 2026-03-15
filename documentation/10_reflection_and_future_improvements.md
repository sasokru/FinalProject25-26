# Reflection and Future Improvements

## Reflection
This project became much more personal to me than a typical technical assignment. From the beginning, I did not want to build something purely abstract. I wanted to work on a problem that felt connected to a real context, something that made sense to me beyond just fulfilling a course requirement.

Because of my background in nursing and my growing interest in digital health, this project felt meaningful from the start. It was one of the first times I really tried to bring those two sides together: practical healthcare experience and technical prototyping.

At the same time, the project was also more difficult than I expected. On paper, the idea seemed relatively clear. In reality, building the setup, getting the sensor to behave in a useful way, and adjusting the logic again and again took much more trial and error than I had imagined. That was frustrating at times, but it also made the project feel real. I was not just following instructions — I was actually dealing with the messiness of trying to make an idea work.

## What worked well
One thing I am genuinely happy about is that the project kept its original meaning throughout the process. Even when parts of the setup were unstable or had to be changed, the core idea stayed intact: taking a healthcare-related observation problem and trying to translate it into a technical system.

I also think the final prototype does succeed in making that idea visible. The combination of the sensor, the RGB LED, the display, and the physical infusion setup makes it possible to understand what the project is trying to do. It may still be a prototype, but it is no longer just an idea in my head.

Another part that worked well for me was the connection between building and reflecting. I did not only want to make something that “works somehow,” but also something I could explain, document, and think critically about. That part matters to me because I want my work to be understandable, not just functional.

## What was difficult for me
The hardest part was definitely the sensor reliability. That was probably the point where I felt the gap most strongly between the idea I had in mind and the reality of the prototype. The IR sensor seemed like a reasonable solution at first, but in practice it depended so much on positioning, alignment, and the drip chamber itself that it became clear very quickly that this was also one of the weakest points in the system.

I also found it challenging that in this kind of project, the hardware, the code, and the physical setup all depend on each other. I could not just “fix the code” or “fix the hardware” separately. A small change in one place could change the whole behaviour of the system. That made the project more complex, but also much more interesting.

Another thing I noticed was that I had to let go of some parts of the original concept. At first, I wanted more features, more feedback, more completeness. But during development, I realised that not every idea actually improved the project.

## What could have gone better
If I look at the project honestly, there are several things that could have gone better.

The sensor setup is the most obvious one. It works well enough for a prototype, but not in a way that feels truly robust. If I had more time, I would want to test a better sensing method and compare different options more systematically.

The physical construction could also have been cleaner and more stable. I do not mean only in an aesthetic sense, but also technically. In this project, the way things were mounted had a direct effect on how well the system worked. So improving the construction would probably also improve the measurement quality.

I also think the project could have benefited from more systematic testing and data collection earlier in the process. A lot of development happened through practical trial and error, which was useful, but a more structured comparison of different setups and outputs would have made the analysis even stronger.

## Design choices I changed along the way
One thing that became very clear to me was that simplifying the project was sometimes the better decision.

The buzzer is probably the clearest example. In the beginning, it seemed like a good idea to add sound as another output. But once I tested it, it felt more distracting than helpful. Removing it was actually an important moment, because it made me realise that a project does not become better just by having more features.

The RGB LED, on the other hand, stayed useful because it gave immediate feedback and made the system easier to understand. I still think there could be better solutions in a more advanced version, but for this prototype it was a good and practical choice.

I also think using simple smoothing in the Arduino code was the right decision. It did not solve every issue, but it made the output much easier to read and helped the prototype feel less chaotic.

## What I would improve next
If I continued this project, the first thing I would focus on would be the sensing method. I would want to test a more reliable alternative and look more closely at how the quality of the signal changes under different conditions.

I would also improve the physical build. A more stable and better-designed mounting system would make the whole setup feel more coherent and probably improve the performance as well.

Another next step would be to work more deeply with the measurement data. That part interests me a lot, especially because it connects the hardware side of the project to analysis and modelling. I would like to compare raw and smoothed data more clearly and continue the MATLAB and Simulink part in a more systematic way, especially with the Kalman filter.

## What I personally learned
What I learned most from this project is that technical work becomes much more meaningful to me when it is connected to a real problem. I do not just enjoy building something for the sake of building it. What motivates me more is when I can see why it matters, even in a small experimental way.

I also learned that I am actually interested in this kind of work even when it becomes frustrating. Maybe especially then. Because that is the point where it stops being a clean idea and becomes a real problem-solving process.

This project also confirmed something important for me personally: I want to keep moving in this direction. I want to keep working at the intersection of healthcare, technology, and process improvement. This prototype is still small and imperfect, but it already feels like a first step into that space.

## Final Thought
For me, this project is not only about an infusion monitoring prototype. It is also about testing what kind of work I want to do in the future.

It showed me that I care about building systems that are connected to real human contexts, that I enjoy thinking through technical problems even when they do not have a simple solution, and that I want to keep developing the skills that allow me to work between healthcare and technology.

The prototype still has clear limitations, and I do not want to hide that. But that is also part of why it matters to me. It is honest, it is unfinished in a productive way, and it shows both what I was able to build and where I would want to go next.
