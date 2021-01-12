---
title: Обзор кода Code_overview
description: 
published: true
date: 2021-01-12T12:52:44.783Z
tags: 
editor: markdown
dateCreated: 2021-01-02T04:56:02.482Z
---

# Overview
A low level description of each code file and its purpose can be found in the Doxygen pages: https://speeduino.github.io/speeduino-doxygen/files.html

## High level description of Speeduino control loop

The main loop in the `speeduino.ino` file runs continually and has 2 primary functions, determining the engine requirements and setting the ignition/injection schedules according to these requirements.

A high level description of the functions performed in the main loop is below:

-   Check whether there is a request in the serial buffer to be processed
-   See whether the engine is turning by looking at the last time a crank tooth was seen
-   Read values from all analog sensors (TPS, IAT, CLT, MAP, O2, Battery voltage). Not all sensors are read every loop as they do not change frequently enough to warrant this
-   The following functions only occur if the engine has 'sync':
    -   Check whether the RPM is above or below the cranking threshold (Both fuel and ignition values are adjusted when the engine is cranking)
    -   Run all corrections functions (See corrections.ino section below). The outcome of this is a % that the pulsewidth will be adjusted by (100% = no adjustment, 110% = 10% more fuel, 90% = 10% less fuel)
    -   Lookup VE from the the main fuel table
    -   Convert VE into a pulsewidth value in uS
    -   Lookup the desired advance from the ignition table
    -   Calculate the current crank angle
    -   Calculate the crank angle that each injector should open at based on the current engine speed
    -   Calculate the dwell angle based on the desired dwell time and current engine speed
    -   Calculate the ignition start angle for each cylinder by subtracting the advance angle and the dwell angle from the TDC angle
    -   Set a 'schedule' for each injector by converting the above calculated start angles into a number of uS in the future (Eg if injector should start opening at 45\* ATDC and the crank angle is currently 10\*BTDC, how long will it take to travel those 55\*)
-   Perform the same schedule setting for each ignition output