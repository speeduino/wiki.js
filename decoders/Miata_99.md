---
title: Miata 99-05
description: 
published: true
date: 2020-05-28T07:32:26.758Z
tags: decoder, miata, trigger
---

## Miata 99-05

From MY99 onwards, Miatas moved to a new trigger patter that, whilst similar to that used on the 4g63, is more tolerant to noise and does not rely on both edges of a tooth being tracked. Crucially it also permits movement of the cam signal relative to the crank signal which is required due to the addition of variable cam timing in these engines. Sync can be determined in the same way regardless of if the variable cam is at it's maximum or minimum movement.

The trigger consists of a 4 tooth wheel located on the crankshaft and a 3 tooth wheel on the cam. The teeth on both wheels are unevenly spaced.

### Applications

NB Miatas from 1999 until 2005.

### Tuner Studio Configuration

The trigger angle should not need changing once this pattern has been selected (ie Make sure it is set to 0)

For most installs, Trigger filtering set to Off or Weak is sufficient.

In the `Starting/Idle -> Cranking Settings` dialog ensure the following options are turned on:

* 'Fix cranking timing with trigger'
* 'Use new ignition mode'

### Trigger Pattern

The crank wheel contains 4 teeth, separated by an alternating 70 and 110 degrees.

Sync is determined by counting the number of secondary (cam) pulses that occur between the primary (crank) pulses and can be confirmed at 2 points in the cycle. The first crank pulse after 2 cam pulses is tooth \#6 and the first crank pulse after a single cam pulse is tooth \#2. Tooth \#1 is located at 10 degrees BTDC and cannot be identified directly, only relative to teeth \#2 and \#6. As the camshaft timing is moved as part of the VVT, the secondary pulses remain within the same 'window' relative to the primary pulses. Sync can therefore before confirmed at all loads and speeds, no matter what VVT value is being currently used.

![miata9905.png](/img/decoders/miata9905.png){.align-center width=90%}
