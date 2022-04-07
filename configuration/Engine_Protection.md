---
title: Engine Protection
description: Configuring engine protection limiters
published: true
date: 2022-04-07T14:44:42.636Z
tags: 
editor: markdown
dateCreated: 2022-04-07T14:44:42.636Z
---

# Engine Protection
> **Note** This page describes Engine Protection window settings as in 202002 FW release. For older FW versions that use Rev Limiter window, see [this page.](/en/configuration/Rev_Limits)
{.is-info}

Speeduino includes a spark and fuel based rev limiters with both hard and soft cuts. In addition to rev. limiter, there is optional oil and boost pressure based protection limiters. Boost limit settings are also available under [Boost_Control](/en/configuration/Boost_Control) dialog.

The soft cut rev. limiter will lock timing at an absolute value or reduce timing advance to slow further acceleration. If RPMs continue to climb and reach the hard cut limit, ignition events and/or fueling will cease until the RPM drop below this threshold. 

## Settings

![engine_protection.png](/img/tuning/engine_protection.png){.align-center}

### Engine Protection and Limiters

- **Protection Cut:** Sets the protection cut method to spark or fuel. Also both can be used simultaneously. This protection cut method is used for rev limiter and other protection methods (boost cut, oil pressure protection).
- **Engine Protection RPM min:** Below this RPM all the protection methods are disabled. This is especially important with oil pressure protection as this is the RPM limit for the engine if oil pressure is too low. If you want to totally shut down the engine in case of oil pressure is too low, set this to 0. Otherwise above idle RPM is usually fine for this setting.
- **Cut method:** Normally set to `Full` when all ignition and/or injection events are ceased if protection cut is active. `Rolling` will cut one output per rotation. This is softer method, but might not be enough.
- **Soft rev limit:** The RPM at which the soft cut ignition timing will be applied over.
- **Soft limiter mode:** `Fixed` will fix the timing advance to one set as `Soft limit timing` when soft limiter is active. `Relative` will reduce current timing advance by the amount set as `Soft limit timing` when soft limiter is active.
- **Soft limit absolute timing:** The amount of ignition advance or amount of ignition advance correction based on `Soft limiter mode` setting. If mode is set to `Fixed`, 10 degrees will fix timing to 10 degrees when soft limiter is active. If mode is set to `Relative` 10 degrees will reduce current timing advance by 10 degrees when soft limiter is active.
- **Soft limit max time:** The maximum number of seconds that the soft limiter will operate for. If the engine remains in the soft cut RPM region longer than this, the hard cut will be applied.
- **Hard rev limiter:** Above this RPM, all ignition and/or injection events will cease depending on protection cut method.

### Boost Cut

- **Enable Boost limit:** To enable or disable boost cut.
- **Boost Limit:** Above this kPa, all ignition and/or injection events will cease depending on protection cut method.

### Oil Pressure

- **Oil Pressure Protection:** To enable or disable oil pressure protection. Oil pressure sensing needs to be enabled to activate this setting.
- **Oil Pressure Protection(Curve)** Set the oil pressure protection curve so that in normal engine operation the oil pressure should not drop below this curve. Note that oil pressure is much lower when engine is hot than it is with cold engine. Set the curve based on normal operation temp oil pressures. 