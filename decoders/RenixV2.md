---
title: Renix Decoder
description: Renix decoder for 44 or 66 tooth trigger wheels
published: true
date: 2023-07-30T19:36:42.976Z
tags: decoder, trigger
editor: markdown
dateCreated: 2023-07-30T19:22:37.646Z
---

# Renix 44 and 66 tooth decoder
## Availability

This decoder is available as part of the current release.

## Background

The Renix trigger wheels are required because neither tooth pattern divides exactly into 360 degrees. On the 44 tooth pattern each tooth is 8.1818 degrees wide, whilst the 66 tooth pattern is 5.4545 degrees. For Speeduino to work accurately the trigger wheel teeth must divide exactly (be left with a whole number) into 360. Every 11 teeth for either decoder equals a whole number (11 * 8.1818 = 90, 11 * 5.4545 = 60). This trigger wheel therefore works by fooling Speeduino into thinking the 44 tooth pattern only has 4 teeth (one every 90 degrees) and the 66 tooth pattern has 6 (one every 60 degrees). 

## Limitations

Both 44 and 66 tooth trigger wheels have nothing to indicate a unique point within 360 degrees. This means we can't establish if we're at 0 or 180 degrees. This presents two limitations,

This decoder can't do wasted spark or sequential ignition. If you require ignition you need to keep the distributor.
Fuel injection can not be timed to match the valve timing. You should therefore select as a minimum two squirts per engine cycle to ensure the injection event is within 180 degrees of ideal. This should be the speeduino default. Injection timing is less critical than ignition timing so for none race vehicles this is acceptable.

Both 44 and 66 tooth use the same implementation. Whilst 44 tooth has been tested for many months before inclusion into the firmware the 66 tooth hasn't so could potentially have issues. If problems are found please log an issue on Github for it to be investigated. 

Trigger setup - it is essential the trigger setup is correct for the decoder to work. Please ensure your tooth log matches the screen shot below before requesting help with the decoder.

## Setup

### Engine Constants

Squirts per Engine Cycle is set to 2 or higher

Number of cylinders dictates your trigger pattern. 

4 cylinders equates 44 tooth pattern.
6 cylinders equates 66 tooth pattern

### Trigger Settings

Select the Trigger Pattern “Renix”. A number of existing settings will be greyed out but display the values prior to the Renix pattern being selected. In the background the system sets up these values as it requires them.

NB you can only setup the “Trigger Angle (deg)” once you have completed all of the setup actions. To set this you should follow the standard guidance elsewhere in the Wiki.

### Trigger Sensor (VR or Hall)

Due to the way the teeth are setup on the decoder its very important if a VR sensor is used the wiring, VR decoder and trigger edge are setup correctly. You are targeting a tooth log that looks like the one below.


[https://wiki.speeduino.com/decoders/renix_trigger_pattern.jpg]  {.align-center width=90%}


### Spark Settings (Ignition)

Speeduino can currently only support spark output mode “Single Channel”. This means the sparks need to be routed via a distributor.

“Use new ignition mode” should be set to “yes”.



### Future Enhancements

Some Renix installations also have available a cam signal. When this decoder was developed details of the cam signal timing were not available. If enough details can be provided across enough engines to prove the location of the cam signal is similar (within 180 degrees) this can be added into a future release. The addition of a cam signal would then allow wasted spark and sequential ignition and fuelling.

