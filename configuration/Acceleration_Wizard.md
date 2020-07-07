---
title: Acceleration Wizard
description: Tuning the acceleration enrichment
published: true
date: 2020-07-07T19:48:40.862Z
tags: 
editor: markdown
---

# Acceleration Enrichment (AE)

Acceleration Enrichment (AE) is used to add extra fuel during the short transient period following a rapid increase in throttle. It performs much the same function as an accelerator pump on a carbureted engine, increasing the amount of fuel delivered until the manifold pressure reading adjusts based on the new load.

> To operate TPS based AE correctly, you must have a variable TPS installed and calibrated.
{.is-info}


## Theory

Tuning of acceleration enrichment is based on the rate of change of the throttle position, a variable known as TPSdot (TPS delta over time). This is measured in %/second, with higher values representing faster presses of the throttle and values in the range 50%/s to 1000%/s are normal. Eg:

- 100%/s = pressing the throttle from 0% to 100% in 1 second
- 1000%/s = pressing the throttle from 0% to 100% in 0.1s

TPSdot forms the X axis of the acceleration curve, with the Y axis value representing the % increase in fuel.

![accel.png](/img/tuning/accel.png){.align-center width=400}

### Tuning

The enrichment curve included with the base Speeduino tune is a good starting point for most engines, but some adjustment is normal depending on injector size, throttle diameter etc.

In most cases, tuning of the AE curve can be performed in a stationary environment, though dyno or road tuning is also possible. Fast and slow blips of the throttle should be performed and the affect on the AFRs monitored using the live line graph on the AE dialog. This graph shows both TPSdot and AFR values in sync with each other, making adjustments to the correct part of the AE curve simpler to identify.

If you find that the AFR is initially good, but then goes briefly lean, you should increase the 'Accel Time' setting, with increments of 10-20ms recommended.

### False triggering

In cases where the TPS signal is noisy, spikes in its reading may incorrectly trigger the acceleration enrichment. This can be seen in a log file or on a live dash in TunerStudio by the activation of the 'TPS Accel' indicator when there is no (or little) throttle movement occurring. 

Should this occur (and assuming that the TPS wiring cannot be corrected to reduce noise) then the false triggers can be prevented from triggering AE by increasing the "TPSdot Threshold" value. This should be increased in increments of ~5%/s, pausing between each increase to observe whether AE is still being incorrectly activated.

### Fields

- **Enrichment Mode**
Chose whether to use Throttle Position Sensor or Manifold Absolute Pressure for acceleration enrichment.
- **TPSdot Threshold**
Percentage of throttle position change per second required to trigger acceleration enrichment. For example, if set to 70, the throttle position must change at a rate of 70% per second for acceleration enrichment to become active.
- **MAPdot Threshold**
Same as TPSdot Threshold, but applies when using MAP enrichment mode.
- **Accel Time**
Duration of acceleration enrichment. Once enrichment is triggered, it will last this many milliseconds.
- **Taper Start RPM, Taper End RPM**
Scales the enrichment taper at different RPMs. If RPM is less than or equal to Start RPM, enrichment will be 100%. If RPM is greater than or equal to End RPM, enrichment will be 0%. As RPM increases, the total amount of required enrichment decreases. Enrichment is scaled linearly in between these values. Typically above 4000 RPM there is 0 acceleration enrichment required.
- **Cold Adjustment**
Scales the acceleration enrichment percentage linearly based on coolant temperature. At Start Temperature, adjustment will be equal to the Cold Adjustment field (%). At End Temperature, adjustment will be 0%.
- **Deceleration Fuel Cutoff**
Stops injecting fuel when decelerating.