Overview
--------

The Nissan 360 CAS trigger is used across a large number of both 4 and 6 cylinder Nissan engines. See below for applications.

The trigger is comprised of a wheel, running at cam speed, that has 360 windows and is read by an optical sensor. Each window therefore represents 2 crank degrees. For location information, there is also an inner ring of windows, equal to the number of cylinders (ie 4 windows on 4 cylinder engines, 6 windows on 6 cylinder engines).

**NOTE:** There are multiple versions of the 4 cylinder CAS and not all are currently supported. Each known version is described below

1.  Pattern 1 - Has a single unique inner window with all others being identical. Not currently supported
2.  Pattern 2 - The unique slot sizes are in opposing pairs. This is partially supported.
3.  Pattern 3 - Each inner window has a unique size. Typically 4,8,12,16 on 4 cylinder engines and 4,8,12,16,20,24 on 6 cylinders. This is supported.

Applications
------------

-   CA18 - Believed to have pattern 3
-   SRxx Redtop - Believed to be pattern 3
-   SRxx Blacktop (early) - Believed to be pattern 1
-   SRxx Blacktop (notch) - Believed to be pattern 1
-   FJ20 - Believed to have pattern 1
-   RB30 - Believed to have pattern 1
-   RB25/26 - Believed to all have pattern 3

Tuner Studio Configuration
--------------------------

-   Set both Trigger edge to Trailing
-   Trigger Filter: off
-   Re-sync every cycle: yes

**NOTE**: If you are still not seeing any RPM signal or Sync try reversing the CAM and CRANK signals on the IDC40. These settings are confirmed for the 4-8-12-16 wheel.

![<File:SR20> Trigger Setting.png](SR20_Trigger_Setting.png "File:SR20 Trigger Setting.png")

Timing adjustment
-----------------

In most cases altering the trigger angle should not be required, however there is some small variation between the OEM versions of thIs trigger so some minor adjustment may be needed. Once you have the engine started, set a fixed ignition angle and check the timing with a timing light. If this is a few degrees out (&lt;20°), adjust the trigger angle here. If this is more than 20° out, there may be a larger problem.

Trigger Pattern
---------------

TBA