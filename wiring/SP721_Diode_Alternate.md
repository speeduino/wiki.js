---
title: SP721_Diode_Alternate
description: 
published: true
date: 2020-04-08T02:10:11.518Z
tags: 
editor: undefined
dateCreated: 2020-01-06T01:54:37.725Z
---

SP721 Over-voltage Protection
-----------------------------

Speeduino versions through v0.3.2 and v0.4.0 used Schottky diodes on each input circuit to protect the Mega from over-voltages in the 'dirty' automotive electrical systems. Through-hole boards after those versions use a single SP721 in location IC4 to protect up to six inputs in a similar way to twelve diodes. Some Speeduino users have difficulty obtaining the SP721, and so the following information is to create an alternative protection based on the previous diode circuits, using the DIP8 footprint of the SP721.

The information can be used to assemble diodes directly to the Speeduino board, as a circuit in perf-board or strip-board, or as a PCB using [these Gerber files](http://efistuff.orgfree.com/PostHost/SP721_Alternate_GERBERS.zip) for manufacturing or by DIY PCB etching. The 1N5818 or 1N5819 are suggested, though any similar Schottky signal diode will likely work. Figure 1 shows six signal channels protected, though only the channels being used require diodes, at two per-channel.

The diode layout is shown in Figure 1:

<img src="http://efistuff.orgfree.com/PostHost/SP721%20Alternate.jpg" title="Fig. 1 SP721 diode diagram" />

Layout using the Gerber files above:

<img src="http://efistuff.orgfree.com/images/SP721%20Diode%20Alternate_pcb_noGF.png" title="Fig. 2 SP721 PCB example" />

Example layout on generic perf-board:

<img src="https://speeduino.com/wiki/images/2/29/Sp721_module_prfbrd.png" title="Fig. 3 SP721 perf-board example" />