---
title: Basic_Distributor
description: 
published: true
date: 2020-01-17T11:55:34.718Z
tags: 
---

## Basic Distributor

The Basic Distributor trigger is a very simplistic decoder that expects input like what a traditional distributor outputs. That is, 1 pulse per cylinder per cycle.

For this reason the signal lacks any cylinder position signal and so without a missing/added tooth or camshaft signal reference Speeduino cannot calculate crankshaft angle, phase of cycle, or cylinder assignment. **A distributor must be used to route the resulting sparks to the correct cylinders**. 

The signal can be as simple as the breaker points from an old pre-electronic distributor, to a crankshaft wheel without any abnormal, extra, or missing slots, provided it is conditioned appropriately to 0v-5v. Most who have installed aftermarket tachometers are familiar with the simplicity of the signal with the only variation being the number of pulses in each crankshaft rotation.

### Trigger Signal

![Basic_sistributor case.png](/img/decoders/basic_distributor.jpg){.align-center}