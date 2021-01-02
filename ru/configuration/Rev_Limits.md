---
title: Limiters
description: Configuring engine protection limiters
published: true
date: 2021-01-02T04:37:22.043Z
tags: 
editor: markdown
dateCreated: 2021-01-02T04:37:22.043Z
---

# Limiters

Speeduino includes a spark based rev limited with both hard and soft cuts.

The soft cut limiter will lock timing at an absolute value to slow further acceleration. If RPMs continue to climb and reach the hard cut limit, ignition events will cease until the RPM drop below this threshold.

> **Note** As this is spark based limiting, fuel only installs cannot use the rev limiter functionality
{.is-info}


## Settings

![Rev limiter settings](/img/tuning/revLimiter.png){.align-center}

- **Soft rev limit:** The RPM at which the soft cut ignition timing will be applied over.
- **Soft limit absolute timing:** Whilst the engine is over the soft limit RPM, the ignition advance will be held at this value. Lower values here will have a greater soft cut affect.
- **Soft limit max time:** The maximum number of seconds that the soft limiter will operate for. If the engine remains in the soft cut RPM region longer than this, the hard cut will be applied.
- **Hard rev limiter:** Above this RPM, all ignition events will cease.
