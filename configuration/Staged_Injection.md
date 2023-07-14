---
title: Staged Injection
description: Configuring multi-stage fuel injection
published: true
date: 2023-07-14T04:14:43.859Z
tags: 
editor: markdown
dateCreated: 2020-01-06T01:54:09.173Z
---

# Staged Injection
## Overview
Speeduino has the ability to control a secondary fuel stage for engines that have 2 sets of injectors, typically of different capacities. Whilst there are few stock engines that come with secondary injectors (the notable exception being many Mazda rotaries) secondary staged injection is a common modification, in particular used whenever large injectors are required, but where it is desirable to keep smaller injectors for smoother low RPM performance.

## Hardware Configuration
The hardware configuration of the staging outputs depends greatly on the board in use, the engine itself and the fuel injector arrangement. 

The table below outlines the number and channel configuration of the fuel channels required based on the cylinder count and fuel mode:

|                | **1**                           | **2**                               | **3**                                   | **4**                                       | **5**                                   | **6**                                     | **8**                                       |
|----------------|---------------------------------|-------------------------------------|-----------------------------------------|---------------------------------------------|-----------------------------------------|-------------------------------------------|---------------------------------------------|
| **Sequential** | **Min Inj#:** 2<br>**Pri:** 1<br>**Sec:** 2 | **Min Inj#:** 4<br>**Pri:** 1/2<br>**Sec:** 3/4 | **Min Inj#:** 6<br>**Pri:** 1/2/3<br>**Sec:** 4/5/6 | **Min Inj#:** 8<br>**Pri:** 1/2/3/4<br>**Sec:** 5/6/7/8 | **Min Inj#:** 6<br>**Pri:** 1/2/3/4/5<br>**Sec:** 6 | **Min Inj#:** 7<br>**Pri:** 1/2/3/4/5/6<br>**Sec:** 7 | N/A                                         |
| **Other**      | As above                        | **Min Inj#:** 2<br>**Pri:** 1<br>**Sec:** 2     | **Min Inj#:** 4<br>**Pri:** 1/2/3<br>**Sec:** 4     | **Min Inj#:** 4<br>**Pri:** 1/2<br>**Sec:** 3/4         | As above                                | **Min Inj#:** 6<br>**Pri:** 1/2/3<br>**Sec:** 4/5/6   | **Min Inj#:** 8<br>**Pri:** 1/2/3/4<br>**Sec:** 5/6/7/8 |


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

![Required fuel calculator](/img/staging/staged_reqfuel.PNG){.align-center width=400}

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



#### Wiring

The wiring of injectors depends on the number of cylinders, the number of channels available on your ECU and whether you are using sequential fueling. 

##### Example
Assuming a 4 cylinder even fire engine, the injectors are to be wired in pairs.

Primary injectors on outputs 1 and 2. The secondary on outputs 3 and 4.

For other setups see the Hardware Configuration section above

> **Note:** The dead time of the 2 sets of injectors is currently assumed to be the same. This may be altered in future firmwares if required (Post a feature request if needed).
{.is-info}
