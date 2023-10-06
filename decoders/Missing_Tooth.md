---
title: Missing Tooth
description: Information about the missing tooth decoder pattern
published: true
date: 2023-10-06T00:08:20.559Z
tags: 
editor: markdown
dateCreated: 2020-01-06T00:30:19.883Z
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

### Timing Requirements

The missing tooth crank and cam decoders require that the wheel is spinning at roughly the same speed throughout the rotation. For single missing tooth decoders: If the next tooth does not come within 1.5 * The Delta Time of the last 2 teeth it is assumed we just observed the missing tooth. For more than one missing tooth decoder there is a bit more leeway if the next tooth does not come within 2 * The Delta Time of the last 2 teeth it is assumed we just observed the missing teeth. 

Usually this can be fixed by ensuring that the starter motor has enough current available to power through any harder spots through the rotation / opening closing cams / engine accessories. 

If the starter motor is good and getting the right voltage ensure the mechanical components of the engine are correct. 


### Tuner Studio Configuration
![missingtooth_202108.png](/img/decoders/missingtooth_202108.png){.align-center}

**Fields:**

  - Primary base teeth: This is the number of teeth the wheel would have if there were none missing. Eg a 36-1 wheel has only 35 actual teeth, but you would enter 36 into this field.
  - Missing Teeth: The size of the 'gap' in the number of teeth. These missing teeth must be situated in a single block (ie there's only a single gap in the teeth)
  - Trigger Angle: This is the angle in crank degrees **AFTER** TDC (ATDC) of the first tooth following the gap

### Timing Setting

The trigger angle can be found using the following steps:
1. Set the crankshaft at TDC 0° (Cylinder 1) with a tool by hand
1. Rotate the crankshaft (running direction) until the first tooth after the missing teeth is under the sensor
1. Measure how many degrees the crankshaft rotated. This is the value to enter as the trigger angle. 

### Sequential operation

The missing tooth decoder supports sequential operation if an additional cam input is present. If Sequential mode is selected for either the fuel timing or spark timing, the system will expect to see a cam signal and will not sync correctly without this. Note that this is ONLY the case if sequential is selected for one or both of fuel and spark timing.

This cam signal should take the form of 4-1 cam trigger wheel or a single pulse every complete cycle. This can be a short tooth or a half moon type arrangement, provided that electrically there is only a single rising (or falling) pulse per cycle.

### Trigger Diagram
![missingtooth_trace1.png](/img/decoders/missingtooth_trace1.png){.align-center}
