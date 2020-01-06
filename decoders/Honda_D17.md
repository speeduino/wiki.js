<h2>
Overview

</h2>
The Honda D17 decoder applies to the Honda engine family using a 12+1 crankshaft wheel. The 4+1 camshaft signal is not currently used with Speeduino. Without the cam signal, all standard fuel and ignition modes up to semi-sequential and wasted-spark are supported.

Applications
------------

-   TBA

Tuner Studio Configuration
--------------------------

Timing adjustment
-----------------

In most cases altering the trigger angle should not be required, however there is some small variation between the OEM versions of thIs trigger so some minor adjustment may be needed. Once you have the engine started, set a fixed ignition angle and check the timing with a timing light. If this is a few degrees out (&lt;20°), adjust the trigger angle here. If this is more than 20° out, there may be a larger problem.

Trigger Pattern
---------------

The crank trigger wheel consists of 12 evenly spaced teeth plus 1 additional 13th tooth which provides position information. The first tooth after this 13th one is considered Tooth \#1

<center>
<img src="https://raw.githubusercontent.com/speeduino/wiki/master/decoders/honda_D17.png" width="75%" />

</center>
