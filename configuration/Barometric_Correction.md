---
title: Barometric Correction
description: 
published: true
date: 2021-11-11T07:25:29.014Z
tags: baro
editor: markdown
dateCreated: 2021-11-11T07:25:29.014Z
---

# Barometric Correction
## Overview

The barometric correction curve is used to adjust fueling because of altitude changes based on barometric sensor readings. This is especially useful for Alpha-N setups, but may or may not be useful with Speed Density too, depending on the engine setup.
## Correction Curve
![baro.png](/img/tuning/baro.png){.align-center width=400}

In the barometric correction curve Y-axis is amount of fuel and X-axis is the barometer reading. 100% means that no correction is applied. Bigger percentage makes mixture riches and lower percentage makes mixture leaner. By default this curve should be 100% at all points, but the correction can be adjusted based on AFR observations at different baro pressures.