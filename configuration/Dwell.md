---
title: Dwell
description: 
published: true
date: 2023-07-14T07:00:40.992Z
tags: 
editor: markdown
dateCreated: 2020-01-06T01:53:53.703Z
---

# Dwell Control
## Overview
The dwell control dialog alters the coil charging time (dwell) for Speeduino's ignition outputs. Care should be taken with these settings as igniters and coils can be permanently damaged if dwelled for excessive periods of time.

From the April 2017 firmware onwards, dwell will automatically reduce when the configured duration is longer than the available time at the current RPM. This is common in single channel ignition configurations (Eg 1 coil with a distributor) and in particular on higher cylinder count engines.

## Settings

![Dwell Settings](/img/ignition/dwell_settings.png){.align-center width=400}

**Note:** Both the running and cranking dwell times are nominal values, assumed to be at a constant voltage (Usually 12v). Actual dwell time used will depend on the current system voltage with higher voltages having lower dwell times and vice versa. See section below on voltage correction

- **Cranking dwell** - The nominal dwell time that will be used during cranking. Cranking is defined as being whenever the RPM is above 0, but below the 'Cranking RPM' values in the [Cranking](/en/configuration/Cranking "wikilink") dialog
- **Use dwell map** - By default this is set to "No" and speeduino will use fixed running dwell value (With a voltage correction applied). If different dwell values are required across engine RPM/load range, this can be set to Yes and separate Dwell table defines running dwell value.
- **Running dwell** - The nominal dwell that will be used when the engine is running normally.
- **Spark duration** - The approximate time the coil takes to fully discharge. This time is used in calculating a reduced dwell when in time limited conditions, such as mentioned above on single coil, high cylinder count engines. The limited dwell time is calculated by taking the maximum revolution time at the given RPM, dividing by the number of spark outputs required per revolution and subtracting the spark duration. Outside of those conditions, this setting is not used.
- **Over dwell protection** - The over dwell protection system runs independently of the standard ignition schedules and monitors the time that each ignition output has been active. If the active time exceeds this amount, the output will be ended to prevent damage to coils. This value should typically be at least 3ms higher than the nominal dwell times configured above in order to allow overhead for voltage correction.

## Voltage correction
As the system voltage rises and falls, the dwell time needs to reduce and increase respectively. This allows for a consistent spark strength without damaging the coil/s during high system voltage conditions. It is recommended that 12v be used as the 'nominal' voltage, meaning that the Dwell % figure at 12v should be 100%.

The correction curve in the base tune file should be suitable for most coils / igniters, but can be altered if required.

![Dwell voltage correction curve](/img/ignition/dwell_correction.png){.align-center width=450}

## Dwell map
If "Use dwell map" is set to "Yes" at dwell settings, this map will be available to allow for variable Running dwell based on ignition load and RPM values. The voltage correction will be applied on top of these map values.

![Dwell values map](/img/ignition/dwell_map.png){.align-center width=450}

