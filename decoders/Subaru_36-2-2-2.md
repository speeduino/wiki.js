---
title: Subaru 36-2-2-2
description: 
published: true
date: 2020-01-16T11:48:52.741Z
tags: 
---

## Overview

The 36-2-2-2 wheel is common on many 4 cylinder Subaru engines from approx. 2000 onwards. It utilises a crank trigger wheel containing a nominal 36 teeth, spaced 10 crank degrees apart, and 3 groups of 2 missing teeth. These missing tooth groupings allow for sync to be determined within at most 1/2 a crank turn.

Early wheels were VR triggered however after the switch to variable valve timing, Subaru switched to Hall sensors. Most configurations are paired with one or two 4-1 cam sensors, however these are not required for sync on Speeduino.

## Trigger Pattern
The 3 sets of 2 missing teeth are located such that one group is on its own and the other two are located adjacent to one another, with a single tooth in between. Sync can be determined by detecting the missing 2 teeth, then seeing if there is another set of missing teeth immediately after it.

Cylinder 1 TDC compression happens on the fourth tooth after the single gap. Speeduino watches for any missing tooth period, then waits to confirm whether it is followed by another. Sync can therefore be determined in this manner at 2 points in a single crank revolution.

![36-2-2-2.png](/img/decoders/36-2-2-2.png){.align-center width=90%}

**Note:** Many diagrams and trigger wheel images available online show the wheel from the backside, making it show as rotating counter clockwise. For the correct orientation, when looking at the front of the engine, the wheel spins clockwise.