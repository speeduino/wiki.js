---
title: Warmup
description: 
published: true
date: 2021-08-10T08:56:14.786Z
tags: 
editor: markdown
dateCreated: 2020-01-06T01:54:11.507Z
---

# Current implementation of WUE dialog

## Warmup curve
The Warm Up Enrichment (WUE) curve represents the additional fuel amount to be added whilst the engine is coming up to temperature (Based on the coolant sensor). The final value in this curve should represent the normal running temperature of the engine and have a value of 100% (Representing no modification of the fuel from that point onwards).

![warmup_new.png](/warmup_new.png){.align-center}

# Old implementation of WUE dialog

## Settings
 ![warmup.PNG](/img/warmup/warmup.PNG){.align-center width=450}
 
 ### Warmup curve
 
 This curve represents the additional fuel amount to be added whilst the engine is coming up to temperature (Based on the coolant sensor). The final value in this curve should represent the normal running temperature of the engine and have a value of 100% (Representing no modification of the fuel from that point onwards).
 
 ### Afterstart Enrichment
 
 Afterstart Enrichment (ASE) is a seperate fuel modifier that operates over and above the WUE for a fixed period of time after the engine first starts. Typically this is a 3 - 10 second period where a small enrichment can help the engine transition smoothly from cranking to idling.
