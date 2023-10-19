---
title: Yamaha VMax 1990+ pattern
description: Information about the Yamaha VMax 1990+ pattern
published: true
date: 2023-10-19T06:57:39.865Z
tags: 
editor: markdown
dateCreated: 2022-04-13T09:08:36.408Z
---

## Yamaha VMax 1990+

### Overview

The Yamaha Vmax is a V4 engine with 70 degrees between the cylinder heads. This makes it an oddfire engine since combustion is not always after the same number of degrees. The picture below shows the ignition pattern for this engine:

![Yamaha VMax trigger pattern](/img/decoders/vmax.png){.align-center}

As can be seen, combustion occurs after 180, 250, 180 and 110 degrees.
The early Yamaha Vmax bikes (from -85 to -89) used four pick-ups and a TCI controller, this trigger will not work for the old Vmaxes, perhaps these can use the basic distributor and run off the ignition pulse. From 1990, the Yamaha Vmax uses a digital ignition which has one pick-up and uses the pattern as shown below:

![VMax tooth numbers](/img/decoders/vmax2.png){.align-center}

The flywheel runs counter-clockwise and the beginning of lobe 6 (it's left side) is TDC of cylinder 1. To identify all lobes:

- Lobe 1 is the firing point without advance for cylinder 2
- Lobe 2 is the max advance for cylinder 3.
- Lobe 3 is the firing point without advance for cylinder 3 and max advance for cylinder 4.
- Lobe 4 is the firing point without advance for cylinder 4
- Lobe 5 is the max advance for cylinder 1.
- Lobe 6 is the firing point without advance for cylinder 1 and max advance for cylinder 2.

We don’t care about the max advance lobes but do use them to sync the flywheel signal.
To sync the signal, we have to find the wide lobe (6). This is done by triggering on both the `RISING` and `FALLING` edges of each lobe. By determining the time difference, we can find the wide lobe. To quickly sync (reducing cranking time), we want to provide a synced signal as soon as #1 is seen (instead of waiting for 6 to come by again). This is why we start counting from that lobe. To offset the fact that we start the rotation with #1 instead of #6, the trigger angle is set at 70.


### Applications

This is the first trigger built to sync on a wide lobe (instead of a missing tooth), so it could inspire others do adapt it for similar flywheels.

### Timing Requirements

The small lobes are 5 degrees, the big one is 45. However, when cranking, the signal might not be strong enough to show the entire 45 degrees of the wide lobe. Therefore, if a lobe is seen that is twice the size of the last, it is considered the wide lobe.
To ensure the trigger filter works correctly, the distance between the lobes is taken into account when calculating the triggerFilterTime.

### Hardware modification

The signal from the pick-up is quite noisy. Therefore, it requires 10K resistors on the VR+ and VR- line (before getting to the VR-conditioner), and the R10 on the VR-conditioner to be equipped with a 220nf ceramic capacitor to filter the generator noise.

### Tuner Studio Configuration

![VMax configuration in TunerStudio](/img/decoders/vmax3.png){.align-center}

**Fields:**

  - **Trigger Angle:** Since we sync on the first lobe after the sync lobe, this should be 70
  - **Trigger edge:** For an inverting vr-conditioner, use `FALLING`, for a non-inverting use `RISING`
  - **Trigger filter:** Set to your preference, but Aggressive is likely going to cause sync issues

### Further details

The author of this trigger is running in fuel-only mode, however on the bench (Ardustim) it also shows a good ignition signal. To setup the ignition at the correct oddfire angles, setup channel 2 to 180 degrees, channel 3 to 430 degrees and channel 4 to 610 degrees. The wiring for the ignition should adhere to the firing order as shown above.

### Sequential operation

No sequential operation is possible since there is no cam signal to work with.

