---
title: Rover MEMS decoder
description: Rover MEMS decoder details
published: true
date: 2023-07-30T19:41:35.332Z
tags: decoder, trigger
editor: markdown
dateCreated: 2023-07-30T19:41:35.332Z
---

# Rover MEMs decoder

## Availability

This decoder is available in the current firmware.

## Background

Rover developed MEMs (Modular Engine Management System) which was used on a number of British vehicles with petrol engines. This included ‘A’ series, ‘O’ Series, ‘T’ series and ‘K’ Series engines. Due to the range of engines being used by a number of manufactures you can find the MEMS solution in Rovers, LandRovers, Caterham's, Elise's, Morgan's and many kit cars. 

During its lifetime Rover implemented multiple trigger patterns with the MEMs system. This decoder supports the 5 known patterns and will automatically identify and decode the pattern. The patterns are described below based on the number of teeth that occur sequentially broken up by gaps in the pattern. The gaps are represented by the ‘-’.

3-14-2-13-
2-14-3-13-
11-5-12-4-
17-17-
7-10-6-9-

The decoder also adds supports for the secondary (cam) 5-3-2- tooth pattern used by Rover as well as normal single tooth patterns.

Additionally, functionality has been added to the  17-17- pattern so if a secondary (cam) signal is present it will allow accurate spark signal to be generated at the appropriate time. The secondary signal needs to be between 360 and 720 degrees in the 720 degree cycle. 

## Limitations

The pattern with 17-17- can not do wasted spark due to no unique identifier within the 360 degrees engine cycle. If you require spark this must be done via a distributor with ignition set to single channel. This pattern is also limited on fuelling and must be used with at least 2 squirts per engine cycle.

The code currently only supports 4 ignition on cylinder engines, if their is a demand for 6 or 8 cylinder please log an ‘issue’ in github and the code can be extended.

## Setup

### Engine Constants

Squirts per Engine Cycle is set to 2 or higher for the trigger pattern 17-17-

### Trigger Settings

Select the Trigger Pattern “Rover MEMS”. A number of existing settings will be greyed out but display the values prior to the Rover MEMS pattern being selected. In the background the system sets up these values as it requires them.

NB you can only setup the “Trigger Angle (deg)” once you have completed all of the setup actions. To set this you should follow the standard guidance elsewhere in the Wiki.

### Spark Settings (Ignition)

If you have the trigger wheel 17 teeth gap 17 teeth gap Speeduino can currently only support spark output mode “Single Channel”. This means the sparks need to be routed via a distributor. 

All other patterns can support wasted spark and if a secondary trigger edge (cam) signal is present support sequential.

“Use new ignition mode” should be set to “yes”.