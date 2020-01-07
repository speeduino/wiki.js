---
title: Engine Constants
description: 
published: true
date: 2020-01-07T00:46:55.176Z
tags: TunerStudio
---

## Overview

From the Settings menu, select Constants

![TS_8.png](/img/TS_8.png =60%x){.align-center}

Here you need to setup the engine constants. Fill out the fields in the bottom section before calculating the Required Fuel.

## Settings Description

![engine.png](/img/constants/engine.png =80%x){.align-center}
-   **Control Algorithm:** The load source that will be used for the fuel table
-   **Squirts per Engine Cycle:** How many squirts will be performed over the duration of the engine cycle (Eg 720 degrees for a 4 stroke). most engines will not require values greater than 4. For sequential installations, this should be set to 2 with the injector staging set to 'Alternating'(Internally Speeduino will adjust the squirts to 1)
    -   Note that for 3 and 5 squirts, you must have a cam signal in addition to the crank.
-   **Injector Staging:** This configures the timing strategy used for the injectors
    -   Alternating (Recommended for most installs) - Injectors are timed around each cylinders TDC. The exact closing angle can be specific in the Injector Characteristics dialog.
    -   Simultaneous - All injectors are fired together, based on the TDC of cylinder 1.
-   **Engine stroke:** Whether the engine is 2 stroke or 4 stroke
-   **Number of cylinders:** Number of cylinders in the engine. For rotary engines, select 4.
-   **Injector Port Type:** Option isn't used by firmware. Selection currently does not matter
-   **Number of injectors:** Usually the same as number of cylinders (For port injection)
-   **Engine Type:** Whether the crank angle between firings is the same for all cylinders. If using an Odd fire engine (Eg Some V-Twins and Buick V6s), the angle for each output channel must be specific.
-   **Injector Layout:** Specifies how the injectors are wired in
    -   **Paired:** 2 injectors are wires to each channel. The number of channels used is therefore equal to half the number of cylinders.
    -   **Semi-Sequential:** Semi-sequential: Same as paired except that injector channels are mirrored (1&4, 2&3) meaning the number of outputs used are equal to the number of cylinders. Only valid for 4 cylinders or less.
    -   **Sequential**: 1 injector per output and outputs used equals the number of cylinders. Injection is timed over full cycle. Only available for engines with 4 or fewer cylinders.
-   **Board Layout:** Specifies the input/output pin layout based on which Speeduino board you're using. For specific details of these pin mappings, see the utils.ino file
-   **MAP Sample Method:** How the MAP sensor readings will be processed:
    -   **Instantaneous:** Every reading is used as it is taken. Makes for a highly fluctuating signal, but can be useful for testing
    -   **Cycle Average:** The average sensor reading across 720 crank degrees is used. This is the recommended option for 4 of more cylinders
    -   **Cycle Minimum:** The lowest value detected across 720 degrees is used. This is the recommended method for less than 4 cylinders or ITBs