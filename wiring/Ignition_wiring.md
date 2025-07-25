---
title: Ignition Wiring
description: 
published: true
date: 2025-07-25T04:18:31.049Z
tags: ignition, wiring
editor: markdown
dateCreated: 2020-01-13T13:26:54.675Z
---

# Ignition Wiring
## Overview
Ignition output configuration can be one of the most difficult areas of ECU wiring and one that often causes the most confusion. A large part of this complexity comes from the huge number of different ignition types that are available, with there being significant changes in the hardware used in the late 80s and throughout the 90s compared to newer designs. 

Whilst this guide does not cover all ignition styles and hardware, it does cover the most common scenarios. Generally, it is recommended (Where possible) to use newer styles of ignition hardware (Typically 'smart' Coil-on-Plug or Coil-Near-Plug) rather than utilising separate igntion modules. 

## Wasted Spark
Wasted spark is a common means of controlling spark that requires only half the number of ignition outputs as there are cylinders, with 2 cylinder being attached to each output. EG:
* 4 cylinder engine requires 2 ignition outputs
* 6 cylinder engine requires 3 ignition outputs
* 8 cylinder engine requires 4 ignition outputs

Wasted Spark has the advantage of not requiring any cam signal or input as it does not need to know the engine phase. This is possible by firing the ignition outputs once per revolution and pairing that output to 2 cylinders that are both at TDC (With one cylinder on compression stroke and the other on exhaust)

When using wasted spark, it is critical the correct pairs coils and/or spark plugs are joined together. 

There are many dual pole, wasted spark coil packs available both with and without built in igniters. Either are suitable for use with Speeduino, but use of coils with built-in igniters is recommended

![4 Cylinder Wasted Spark with Dual coils](/img/wiring/ign_4Cyl_COP_wasted-spark.png){.align-center width=500}

> Note: The above example uses 'smart' coils with built in igniters. Do NOT attach high current (dumb) coils without adding an igniter
{.is-warning}

### Coil on Plug 
As an alternative to a dual pole wasted spark coil, individual coil on plug units can be used in a wasted spark configuration. 

![4 Cylinder Wasted Spark with COP](/img/wiring/ign_4Cyl_COP_wasted-COP.png){.align-center width=500}

> Note: The above examples use 'smart' coils with built in igniters. Do NOT attach dumb COPs (2 pins) without adding an igniter
{.is-warning}


## Sequential (COPs)
Sequential ignition control using Coil-on=Plugs coils dramtically simplifies the ignition wiring. With this configuration, each coil (and subsequently each cylinder) connects to a single ignition outpt, wired in the firing order. 


![4 Cylinder Coil on Plug Ignition](/img/wiring/ign_4Cyl_COP_seq.png){.align-center width=500}

> Note: The above example uses 'smart' coils with built in igniters. Do NOT attach dumb COPs (2 pins) without adding an igniter
{.is-warning}

## Distributor
If a distributor remains in use, only a single output is required from the ECU. This should be fed into a single channel ignition module (Such as the common Bosch 124) which can then drive the coil. 

![Distributor Ignition](/img/wiring/ign_Basic-distributor.png){.align-center width=500}

## Application Specific
Some application specific ignition setups exist that do no fit any of the above configurations. See below for more details:

* [GM 7/8 Pin Modules](/en/configuration/GM_Module)