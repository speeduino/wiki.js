---
title: Chrysler NGC
description: Decoder for engines with the Chrysler NGC pattern
published: true
date: 2021-10-12T16:19:05.254Z
tags: 
editor: markdown
dateCreated: 2021-10-12T16:19:05.254Z
---

# Chrysler NGC (untested)
## Overview

Decoder for 4-cylinder engines equipped with the Chrysler NGC pattern. Seems to be used on some Chrysler/Jeep/Dodge vehicles from 2002 onward.

This decoder has only been tested on a simulator, please notify speeduino maintainers if you have success or issues with it.

## Tuner Studio Configuration

- **Trigger Pattern:** Chrysler NGC
- **Trigger Angle:** Should be set to 30 +- a few degrees for a stock setup. If both crank and cam sensors have reversed polarity -330 should work (for sequential).
- **New ignition mode:** On is recommended as it gives a more accurate spark angle.

## Trigger Signal

This a 36+2-2 tooth wheel paired with a 7 tooth cam.

The crank wheel has 2 normal LOW missing teeth where the opposite side has two HIGH missing teeth.

The cam wheel teeth are mirrored. One side has a long HIGH tooth and the other has a long LOW tooth.

![ngc_4_cylinder.jpg](/decoders/ngc_4_cylinder.jpg)