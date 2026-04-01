## System model

This step introduces a very simple model of the drip process.

The main assumption is that the underlying drip rate changes only slowly over time, while the measured values can vary more strongly due to noise and imperfections in the sensing process.

Instead of starting directly with estimation methods, I first wanted to separate:
- the true underlying signal
- the measured signal

The simulation shows that even if the real process is relatively stable, the measurement can fluctuate significantly.

This observation is important for the rest of the project, because it motivates why filtering and estimation methods are needed at all.

The model is intentionally simple:
- no complex physical modeling
- no detailed infusion dynamics

The focus is only on the basic idea:
the system is smoother than what we observe.