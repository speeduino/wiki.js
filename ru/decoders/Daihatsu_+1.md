---
title: Daihatsu +1 trigger
description: 
published: true
date: 2021-01-04T17:33:16.543Z
tags: 
editor: markdown
dateCreated: 2021-01-04T17:33:16.543Z
---

## Overview
The Daihatsu +1 triggers are used across a number of 3 and 4 cylinder engines from Daihatsu. See below for applications.

It is comprised of a single cam signal provided by either a hall sensor. This should be fed into the RPM1 input on Speeduino

## Applications
-   TBA (3 cylinder)
-   TBA (4 cylinder)

## Tuner Studio Configuration
Simply select the Daihatsu +1 trigger option.

## Timing adjustment

In most cases altering the trigger angle should not be required, however there is some small variation between the OEM versions of thIs trigger so some minor adjustment may be needed. Once you have the engine started, set a fixed ignition angle and check the timing with a timing light. If this is a few degrees out (&lt;20°), adjust the trigger angle here. If this is more than 20° out, there may be a larger problem.

Trigger Pattern
---------------

In 3 cylinder engines, there are 3 evenly spaced teeth at 0, 240 and 480 crank degrees. There is an additional (+1) tooth located at 30 crank degrees to provide position info

The 4 cylinder is the same, except with 4 evenly spaced teeth. The 5 teeth are therefore located at 0, 30, 180, 360 & 540 (Crank degrees, ATDC)

![daihatsu_3_1.png](/img/decoders/daihatsu_3_1.png){.align-center width=80%}
