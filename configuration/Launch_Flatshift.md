---
title: Launch & Flatshift
description: 
published: true
date: 2020-04-08T02:08:12.434Z
tags: 
editor: undefined
dateCreated: 2020-01-06T01:54:02.178Z
---

# Launch Control & Flat Shift

Speeduino features a 2-step launch control combined with a flat shift feature. These are each dependant on a clutch switch (Usually a ground switching type) being wired in.

## Setup
Both the 2-step and flatshift modes have hard and soft cut states. When under soft cut, the ignition timing will be altered to reduce the RPM acceleration, though this is generally not sufficient to stop or limit RPM rising. Under hard cut, the ignition signal is stopped completely until the RPMs drop

![Launch and flat shift settings](/img/tuning/launchFlatS.png){.align-center width=400}

### Launch
* **TPS Threshold** - A minimum value for the launch engagement. The limiter will only be engaged above this RPM. Typical values are 1%-3% TPS, depending on how much noise is on your signal
* **Soft rev limit** - The RPM at which the timing will be adjusted to slow RPM increase
* **Soft limit absolute timing** - The **absolute** timing that will be used once the soft RPM limit is reached. This overrides all other timing adjustments at this time
* **Hard rev limit** - The RPM at which the ignition signal will be cut entirely.
* **Fuel adder during launch** - A percentage modifier to the current pulse width to add extra fuel when launch (soft or hard) is active. This can aid in building boost on turbo setups at launch time

### Flat shift
* **Soft rev window** - This is an RPM window below the `Launch / Flat shift switch RPM` point during which an alternative timing will be applied. Typical values are 100 to 1000rpm. 
* **Soft limit absolute timing** - The abosloute timing that will be used when in the flat shift soft RPM window

### Clutch settings
Both launch and flat shift require a clutch input in order to activate. This is generally a ground active type switch attached behind the clutch pedal.

* **Clutch input pin** - The Arduino pin that the switch is wired to. Most setups should leave this as the Board Default
* **Clutch enabled when switch is** - The polarity of the clutch input. Typically this should be set to `LOW` for a switch that connects to ground when activated 
* **Clutch pullup resistor** - Whether the internal pullup will be enabled on this input. Typicall this should be set to `Pullup` if you have selected `LOW` for the above setting
* **Launch / Flat shift switch RPM** - The ECU will use the RPM point the clutch is engaged at to determine whether it is in launch mode or flatshift. If the clutch is pressed above this RPM value, it will be assumed to be a flat shift, below it will be considered a launch

> The engagement point of the clutch switch can make a significant difference in the applcation of launch control. The switch should trigger as close to the clutches take up point as possible for the fastest response. 
{.is-success}
