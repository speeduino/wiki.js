---
title: Staged Injection
description: Configuring multi-stage fuel injection
published: true
date: 2020-02-29T21:25:11.772Z
tags: 
---

# Staged Injection
## Overview
Speeduino has the ability to control a secondary fuel stage for engines that have 2 sets of injectors, typically of different capacities. Whilst there are few stock engines that come with secondary injectors (the notable exception being many Mazda rotaries) secondary staged injection is a common modification, in particular used whenever large injectors are required, but where it is desirable to keep smaller injectors for smoother low RPM performance.

## Configuration
No matter which control strategy is chosen, you must enter the sizing of the primary and secondary injectors in order to allow Speeduino to know the split in the overall fuelling.

> **CRITICAL** - The req-Fuel value in the [Engine Constants](/configuration/Engine_Constants) MUST be updated when staged injection is turned on. **When staging is in use, the value entered in the req_fuel calculator MUST be equal to the sum of both the primary and secondary injector sizes**
> Failure to set these values correctly will result in excessive rich or lean conditions.
{.is-danger}

**Eg:**

* **Primary Injectors :** 300cc
* **Secondary Injectors :** 700cc
* **Value entered into the req_fuel calculator :** 1000cc

![Staged fuel settings](/img/staging/staging_settings.PNG){.align-center width=400}
![REquired fuel calculator](/img/staging/staged_reqfuel.PNG){.align-center width=400}

### Control methods
Speeduino provides 2 staging control modes, each with their own strengths and weaknesses. In most cases it is recommended to start with the Automatic mode, which only requires tuning of the standard VE table, and reviewing to see if you get the desired outcome. Only if this can't be tuned to give a satisfactory fuel split would changing to the manual table tuning be recommended.

#### Automatic staging
When using the automatic staging method Speeduino takes into account the full capacity of the injectors (ie the sum of the 2 injector stages) and will perform a split of these itself. With this method, the user can simply tune the VE table in the same manner as if only a single set of injectors were used and the system takes care of the rest.

In this mode, Speeduino will attempt to use the primary injectors up to their 'Injector Duty Limit' (As configured in the [Injector Characteristics](/configuration/Injector_Characteristics) dialog. When staging is being used, it is recommend that this limit should be no higher than 85%. Once the primary injectors reach this duty limit, Speeduino will begin to perform any further fueling from the secondary injectors. In this way, the VE table is all that is required for tuning as the system will take care of allocating the current fuel load to the best injectors.

#### Table control
Table control allows the use of a manual 8x8 map that indicates what percentage of the fuel load will be performed by the **secondary** injectors
- 0% = Secondary injectors disabled
- 100% = Primary injectors disabled

It is important to note that the values in this table do NOT correspond directly to the split of the duty cycle or pulse width. They represent the percentage of the total fuel load that the secondaries will be asked to perform. The affect this value has on the pulse width depends on the ratio of the primary and secondary injector capacities.

One disadvantage of the table tuning method is that it does not allow for the full fuel load of the primary and secondary injectors to be used simultaneously. As the table is a split of the total fuel load, as one set of injectors performs more, the other will perform less.

### Note
The dead time of the 2 sets of injectors is currently assumed to be the same. This may be altered in future firmwares if required (Post a feature request if needed).