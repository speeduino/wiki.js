---
title: Chrysler NGC
description: Decoder for engines with the Chrysler NGC pattern
published: true
date: 2022-01-08T13:28:31.261Z
tags: 
editor: markdown
dateCreated: 2021-10-12T16:19:05.254Z
---

# Chrysler NGC (untested)
## Overview

Decoder for 4, 6 and 8-cylinder engines equipped with the Chrysler NGC pattern. Seems to be used on some Chrysler/Jeep/Dodge vehicles from 2002 onward.

This decoder has only been tested on a simulator, please notify speeduino maintainers if you have success or issues with it.

## Tuner Studio Configuration

- **Trigger Pattern:** Chrysler NGC
- **Trigger Angle:**
	- **4-cylinder:** Should be set to 30 +- a few degrees for a stock setup. If both crank and cam sensors have reversed polarity -330 should work (for sequential).
	- **6 and 8-cylinder:** Should be set to 210 +- a few degrees for a stock setup. If both crank and cam sensors have reversed polarity -150 should work (for sequential).
- **New ignition mode:** On is recommended as it gives a more accurate spark angle.

## Trigger Signal

All versions use the same 36+2-2 crank wheel but the 6 and 8-cyl has TDC 180 degrees away from the 4-cyl version.
The crank wheel has 2 normal LOW missing teeth where the opposite side has two HIGH missing teeth.

### 4-cylinder

The 4-cyl trigger pattern uses a 7 tooth cam. The cam wheel teeth are mirrored. One side has a long HIGH tooth and the other has a long LOW tooth.

![ngc_4_cylinder.jpg](/decoders/ngc_4_cylinder.jpg)

### 6 and 8-cylinder

The 6 and 8-cyl cams are different but function in the same way. The position can be determined when knowing the number of teeth in two adjacent groups of teeth.

![ngc_6-cyl_cam.png](/decoders/ngc_6-cyl_cam.png)![ngc_8-cyl_cam.png](/decoders/ngc_8-cyl_cam.png)