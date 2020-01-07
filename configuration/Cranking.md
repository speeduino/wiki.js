---
title: Cranking
description: 
published: true
date: 2020-01-07T01:57:30.177Z
tags: 
---

Overview
--------

Cranking conditions during starting typically require multiple adjustments to both fuel and ignition control in order to provide smooth and fast starts. The settings on this dialog dictate when Speeduino will consider the engine to be in a cranking/starting condition and what adjustments should be applied during this time.

Settings
--------


![cranking.png](/img/warmup/cranking.png =70%x){.align-center}

-   **Cranking RPM** - This sets the threshold for whether Speeduino will set its status to be cranking or running. Any RPM above 0 and below this value will be considered cranking and all cranking related adjustments will be applied. It's generally best to set this to be around 100rpm higher than your typical cranking speed to account for spikes and to provide a smoother transition to normal idle
-   **Flood Clear level** - Flood clear is used to assist in removing excess fuel that has entered the cylinder/s. Whilst flood clear is active, all fuel and ignition events will be stopped and the engine can be cranked for a few seconds without risk of starting or further flooding. To trigger flood clear, the RPM must be **below** the above Cranking RPM setting and the TPS must be **above** the threshold of this setting.
-   **Fuel pump prime duration** - When Speeduino is first powered on, the fuel pump output will be engaged for this many seconds in oder to pressurise the fuel system. If the engine is started in this time, the pump will simply keep running, otherwise it will be turned off after this period of time. Note that fuel pump priming only occurs at system power on time. If you have USB connected, Speeduino remains powered on even without a 12v signal.
-   **Priming Pulsewidth** - Upon power up, Speeduino will fire all injectors for this period of time. This pulse is NOT intended as a starting fuel load, but is instead for clearing out air that may have entered the fuel lines. It should be kept short to avoid engine flooding.
-   **Cranking enrichment** - Whilst cranking is active (See Cranking RPM above), the fuel load will be increased by this amount. Note that as a standard correction value, this cranking enrichment **is in addition** to any other adjustments that are currently active. This includes the warmup enrichment etc.
-   **Cranking Bypass** - This option is specifically for ignition systems that have a hardware cranking ignition option. These systems were used throughout the 80s and early 90s and allowed ignition timing to be fixed and controlled by the ignition system itself when active (Via an input wire). With this option you can specify an output pin that will be set HIGH when the system is cranking. The pin number specified is the ARDUINO pin number.
-   **Fix cranking timing with trigger** - Some (usually low resolution) trigger patterns are designed to align one of their pulses with the desired cranking advance. This is typically 5 or 10 degrees BTDC. When enabled, Speeduino will wait for this timed input pulse before firing the relevant ignition output (A dwell safety factor is still applied incase this pulse is not detected). This option is only made available when a trigger pattern that supports this function is selected (See [Trigger Setup](Trigger_Setup "wikilink"))
