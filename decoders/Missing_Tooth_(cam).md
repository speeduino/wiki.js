---
title: Missing Tooth (Cam speed)
description: 
published: true
date: 2020-01-16T11:46:41.284Z
tags: decoder
---

## Overview
The missing tooth cam-speed trigger is a Speeduino innovation, that permits function similar to a dual-wheel setup, thereby allowing sequential or wasted spark operation from cam-mounted or distributor wheels. The operation is based on both [Missing Tooth](Missing_Tooth "wikilink") and [Dual Wheel](Dual_Wheel "wikilink"). It is suggested to read those sections first for familiarization as this section will only highlight the fundamental differences to those common decoders.

This decoder is comprised of a single cam-speed wheel in the same configuration as a crank-mounted missing-tooth wheel. The number of teeth ***must*** be evenly divisible into 720°. As it rotates at half crank speed, the sensor reads half the wheel teeth on each 360° crank revolution, and the remaining teeth on the next crank rotation. A single missing tooth will appear on only one of the two crank rotations, and is then used as a phase indicator, much as the dual-wheel system uses the cam signal.

## Applications

Missing tooth cam or distributor wheels can be used with cam or distributor wheel modification or fabrication as no OEM systems use it originally. The wheel ***must*** have at least as many teeth as cylinders, ***not*** including the missing tooth. This generally requires double the number of teeth as cylinders or more. As many teeth, slots, or other readable features (sensor targets) as possible in the limited space is recommended in order to satisfy this requirement, and to maximize resolution. The sensor must be capable of reliably reading smaller or closely-spaced teeth.

Due to typically limited teeth, only half the teeth being read on each revolution, and the potential for reduced accuracy due to timing drive wear; the timing accuracy may be reduced in comparison to crank wheel systems. A figure of error cannot be predicted here as the wear or 'slop' of a given engine will be unique. However, it should be reasonable to assume the timing error will not exceed the accuracy of an OEM-equivalent cam-driven system such as typical distributor systems, or possibly better due to more sensor targets.

## Tuner Studio Configuration
![missingtooth_cam_triggerconfig.png](/img/decoders/missingtooth_cam_triggerconfig.png){.align-center width=450}

**Fields:**
-   Primary base teeth: This is the number of teeth the wheel would have if there were none missing, e.g. a 36-1 wheel has only 35 actual teeth, but you would enter 36 into this field.
-   Missing Teeth: The size of the 'gap' in the number of teeth. These missing teeth must be situated in a single block (ie there's only a single gap in the teeth). One missing tooth is recommended.
-   Trigger Angle: This is the angle in **crank degrees** **AFTER** TDC (ATDC) of the first tooth following the gap. This number ranges from -360° to +360°.
-   Cam Speed: Ensure this box is checked for this cam-speed system.

### Timing Setting

The trigger angle is set in CRANK degrees, not cam.

## Trigger Pattern

![missingtooth_cam_trace.jpg](/img/decoders/missingtooth_cam_trace.jpg){.align-center width75%}
