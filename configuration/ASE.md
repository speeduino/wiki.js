---
title: ASE
description: Afterstart Enrichment (ASE)
published: true
date: 2021-08-10T14:44:13.619Z
tags: 
editor: markdown
dateCreated: 2021-08-10T09:26:15.758Z
---

Overview
--------

Afterstart Enrichment (ASE) is a separate fuel modifier that operates over and above the WUE for a fixed period of time after the engine first starts. Typically this is a few seconds long period where a small enrichment can help the engine transition smoothly from cranking to idling.

Settings
--------

![After Start Enrichment dialog](/img/warmup/ase.png){.align-center width=400}

-   **ASE - Enrichment %** - This curve sets the amount of enrichment during ASE period in percentage based on coolant temp. Typically 50% enrichment is required with cold engine and 5% with warm engine.
-   **Transition time to disable** - After the ASE duration has passed, the enrichment amount will taper to zero smoothly to avoid sudden changes to AFR. This sets the time for how long the taper to zero will be. Typically few seconds.
-   **ASE - Duration** - This curve sets the how long the ASE is applied in seconds. Typically 1-2 seconds is enough when engine is hot and 20 seconds when engine is cold.

