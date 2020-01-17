---
title: Missing Tooth
description: Information about the missing tooth decoder pattern
published: true
date: 2020-01-17T00:41:27.503Z
tags: 
---

# Supported trigger patterns
## Missing Tooth Pattern
### Overview

A missing tooth crank trigger is used as standard equipment by a number of OEMs, most notably Ford, but is also very popular as an aftermarket fitment.

It is comprised of crank wheel with a given number of evenly spaced teeth, and one or more 'missing' teeth. Common values are typically 60-2, 36-1, 24-1, 12-1 and 4-1 where the first number represents the total number of teeth the wheel would have if there were none missing. The second number after a dash "-" indicates the number of teeth missing.

> **Note**: If there is a third number (e.g., 36-1-1), the missing teeth are not sequential, and this decoder does not apply. Do not confuse counts with slashes "/", as numbers following slashes represent cam teeth—not missing teeth. Wheels with "+" indicate added teeth rather than missing, and again this decoder does not apply.
{.is-warning}


### Applications

Missing tooth crank wheels can be used on virtually any engine and is one of the more popular aftermarket options. It provides very good resolution in the higher tooth count versions (Eg 36-1 and 60-2) without being CPU intensive to decode.

### Tuner Studio Configuration
![missingtooth_triggerconfig.png](/img/decoders/missingtooth_triggerconfig.png){.align-center}

**Fields:**

  - Primary base teeth: This is the number of teeth the wheel would have if there were none missing. Eg a 36-1 wheel has only 35 actual teeth, but you would enter 36 into this field.
  - Missing Teeth: The size of the 'gap' in the number of teeth. These missing teeth must be situated in a single block (ie there's only a single gap in the teeth)
  - Trigger Angle: This is the angle in crank degrees **AFTER** TDC (ATDC) of the first tooth following the gap

### Timing Setting

The trigger angle can be found by placing the engine at TDC, then calculating how far it must be rotated until the first tooth after the gap reaches the sensor.

### Sequential operation

The missing tooth decoder supports sequential operation if an additional cam input is present. If Sequential mode is selected for either the fuel timing or spark timing, the system will expect to see a cam signal and will not sync correctly without this. Note that this is ONLY the case if sequential is selected for one or both of fuel and spark timing.

This cam signal should take the form of a single pulse every complete cycle. This can be a short tooth or a half moon type arrangement, provided that electrically there is only a single rising (or falling) pulse per cycle.

### Trigger Diagram
![missingtooth_trace1.png](/img/decoders/missingtooth_trace1.png){.align-center}
