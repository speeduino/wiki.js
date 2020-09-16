---
title: Basic Distributor
description: 
published: true
date: 2020-09-16T07:29:23.217Z
tags: decoder, trigger
editor: markdown
dateCreated: 2020-01-06T01:54:12.645Z
---

## Basic Distributor

The Basic Distributor trigger is a very simplistic decoder that expects input like what a traditional distributor outputs. That is, 1 pulse per cylinder per cycle.

For this reason the signal lacks any cylinder position signal and so without a missing/added tooth or camshaft signal reference Speeduino cannot calculate crankshaft angle, phase of cycle, or cylinder assignment. **A distributor must be used to route the resulting sparks to the correct cylinders** (With the exception of single cylinder engines). 

The signal can be as simple as the breaker points from an old pre-electronic distributor, to a crankshaft wheel without any abnormal, extra, or missing slots, provided it is conditioned appropriately to 0v-5v. Most who have installed aftermarket tachometers are familiar with the simplicity of the signal with the only variation being the number of pulses in each crankshaft rotation.

### A note on resolution

By its nature the resolution of a simple distributor wheel is quite low. The exact resolution depends on the number of cylinders (The more cylinders, the higher the resolution), but even with an 8 cylinder engine there are only 4 pulses per revolution. This can impact timing accuracy if running ignition control from Speeduino and in most cases upgrading to a higher resolution trigger wheel is strongly recommended. 

## Trigger Signal

![Basic_sistributor case.png](/img/decoders/basic_distributor.jpg){.align-center}