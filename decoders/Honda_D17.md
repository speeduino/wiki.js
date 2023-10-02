---
title: Honda D17
description: 
published: true
date: 2023-10-02T20:03:47.771Z
tags: decoder, trigger
editor: markdown
dateCreated: 2020-01-06T01:54:18.505Z
---

## Overview

The Honda D17 decoder applies to the Honda engine family using a 12+1 crankshaft wheel. The 4+1 camshaft signal is not currently supported with Speeduino, but as of Oct'23 development including vtec support is underway. Without the cam signal, all standard fuel and ignition modes up to semi-sequential and wasted-spark are supported.

### Applications

-   TBA

### Tuner Studio Configuration

### Timing adjustment

In most cases altering the trigger angle should not be required, however there is some small variation between the OEM versions of thIs trigger so some minor adjustment may be needed. Once you have the engine started, set a fixed ignition angle and check the timing with a timing light. If this is a few degrees out (&lt;20°), adjust the trigger angle here. If this is more than 20° out, there may be a larger problem.

### Trigger Pattern

The crank trigger wheel consists of 12 evenly spaced teeth plus 1 additional 13th tooth which provides position information. The first tooth after this 13th one is considered Tooth \#1

![honda_D17.png](/img/decoders/honda_D17.png){.align-center width=75%}
