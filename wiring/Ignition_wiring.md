---
title: Ignition Wiring
description: 
published: true
date: 2020-01-13T13:26:54.675Z
tags: wiring, ignition
---

# Header
## Overview

## Wasted Spark
Wasted spark is a common means of controlling spark that requires only half the number of ignition outputs as there are cylinders, with 2 cylinder being attached to each output. EG:
* 4 cylinder engine requires 2 ignition outputs
* 6 cylinder engine requires 3 ignition outputs
* 4 cylinder engine requires 4 ignition outputs

Wasted Spark has the advantage of not requiring any cam signal or input to determine engine phase. This is possible by firing the ignition putputs once per revolution and pairing that output to 2 cylinders that are both at TDC (With one cylinder on compression strok and the other on exhaust)

When using wasted spark, it is critical the correct pairs coils and/or spark plugs are joined together. 

### Coil on Plug (Wasted COP)
As an alternative to a dual pole wasted spark coil, individual coil on plug units can be used
![ign_4Cyl_COP_wasted-spark.png](/img/wiring/ign_4Cyl_COP_wasted-spark.png =500x){.align-center}
> 
> Note: The above example uses 'smart' coils with built in igniters. Do NOT attach dumb COPs (2 pins) without adding an igniter
{.is-warning}


## Sequential (COPs)
![ign_4Cyl_COP_seq.png](/img/wiring/ign_4Cyl_COP_seq.png =500x){.align-center}

## Distributor
![ign_Basic-distributor.png](/img/wiring/ign_Basic-distributor.png =500x){.align-center}