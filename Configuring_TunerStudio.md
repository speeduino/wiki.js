---
title: Configuring TunerStudio project options
description: 
published: true
date: 2020-01-16T11:08:06.062Z
tags: TunerStudio
---

# Configuring TunerStudio Project Properties

The menu option for the project properties page can be found here

![TS_9.png](/img/TunerStudio/TS_9.png){.align-center width=400}

Once opened this page will be seen. 

![TS_4.png](/img/TunerStudio/TS_4.png){.align-center width=350}

## Settings Tab
The Settings tab does not affect the tune directly, but does change the way some things are displayed within Tuner Studio. Some menus are hidden by default, either for safety reasons or because they are still under development, and they can be enabled here.

### Lambda Display
This changes whether the oxygen sensor reasons are shown in AFR (default) or Lambda.

### Temperature Display

The temperature selection changes all degrees values within TunerStudio. 

-   Fahrenheit(Default)
-   Celsius

> Changing this value does not alter the values in tune at all, only which scale the values are displayed in
{.is-info}


### Enable Hardware Test
The hardware testing dialog allows you to manually turn the ignition and injection outputs on and off in order to test that the circuits are working. This can be dangerous if the outputs are connected to hardware however and so this dialog must be explicitely enabled. 

> Please **ONLY** turn this on when the ECU is not connected to a vehicle
{.is-danger}

If Enabled, an additional Tab will appear on the tuning page 

![Project Settings](/img/TunerStudio/TS_project_settings.png){.align-center width=400}

### Reset control features
An optional Speeduino specific boot loader is available that has different methods of controlling the automatic reset. The vast majority of users should leave this on the default 'Basic options only'


## CAN Devices Tab

CAN options are currently under development, but settings are available on this tab for testing if you have supported hardware.

![Project Settings](/img/TunerStudio/TS_CAN_settings.png){.align-center width=400}
