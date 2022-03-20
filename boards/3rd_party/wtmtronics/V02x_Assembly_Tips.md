---
title: V02x_Assembly_Tips
description: 
published: true
date: 2021-01-27T09:23:52.880Z
tags: 
editor: undefined
dateCreated: 2020-01-06T01:53:38.998Z
---

**The most current version of the bill of materials is kept on my GitHub here: [GitHub](https://github.com/turboedge/SpeedyBoards)**

------------------------------------------------------------------------

I normally insert and then solder all the passive components at one time, BUT I would suggest soldering down the resistor networks before you bend a whole bunch of through hole leads (especially from the input capacitors) in front of their solder pads. It's difficult to get the tip in there otherwise. Speaking of the resistor networks. The orientation on them does not matter except for RN3 where is does matter. The dot on RN3 should align with the square pad and the little square around the square pad.![](rn3.jpg "fig:rn3.jpg")

When soldering the stepper module pin sockets bend the first four pins over. This will help the board sit flat even though the Arduino DC jack will be right under it (Optional, I always forget).![](steppersocket.jpg "fig:steppersocket.jpg")

If you choose to have the connector soldered directly to the PCB the tab for the locking latch should aim toward IC2, and do NOT use a socket under IC2, solder it directly to the board. If you use an IC socket it will be difficult to unlatch the connector.![](ic2.jpg "fig:ic2.jpg")

When inserting the LEDs be sure to put the squared off side with the short lead into the square solder pad. Or it won't work. Also, if you want the resistors to sit flush like the ones in the picture (though that third one crept up a bit) the legs need to be folded over as close to the resistor body as possible.![](leds.jpg "fig:leds.jpg")

For version v.0.2.2 a header was added to the NO2C to allow easier connection of a Bluetooth module. This causes a bit of an issue with the Arduino header pins. The pins required for the BTMod to function (TX0/RX0) are marked for use with the daughter-board. The DB has connections for a BTMod also, so they were routed to that, and if you ever got a DB you may want to connect the BTMod there since it is easier. If you don't have any plans to use the mostly unreleased DB with your NO2C you may want to add standard header pins in the two serial0 locations.