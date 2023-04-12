---
title: SD Card logging
description: 
published: true
date: 2022-09-05T12:45:26.939Z
tags: 
editor: undefined
dateCreated: 2021-10-12T05:18:25.120Z
---

# SD Card logging
SD logging was introduced first in firmware version `202201` and officially supports Teensy based units only (Eg Dropbear). Support for additional logging options is intended to be added in future firmware releases. 

Whilst not required, logging can be combined with a Real Time Clock (RTC)

## Requirements
* Teensy based Speeduino ECU (Eg Dropbear)
  * Note: There is some experimental support for SD logging on stm32 based boards however this is not officially supported. 
* 4gb minimum SD card. 250mb must be free on this to begin a logging session
* SD card must be formatted with the ExFAT filesystem. Speeduino uses certain features of ExFAT that are not available on FAT16/32

## How to use
### Setup SD Card / Logging options

![SD Logging Options](/img/sd_card/sd-options.png){.align-center width=450}

#### Real Time Clock (RTC)
![Real Time Clock](/img/sd_card/sd-rtc.png){.align-center width=450}

### Reading log files
![Browsing Log files](/img/sd_card/sd-browse.png){.align-center width=450}


## File sizes
The size of the log file will depend on the duration and the logging speed that is selected. The table below gives an approximation of the filesize that can be expected for various scenarios

> Note that logs are split into 10MB files. Once the log file reaches 10MB, a new file will be created and the logging continued. Except for the overall SD card size, there is no limit to the number (and hence duration) of the SD logs
{.is-info}

|          | **1 min** | **10 min** | **30 Min** |
|----------|-----------|------------|------------|
| **1Hz**  | 12.3KB    | 123KB      | 1.23MB     |
| **4Hz**  | 51KB      | 510KB      | 1.52MB     |
| **10Hz** | 127KB     | 1.27MB     | 3.8MB      |
| **30Hz** | 380KB     | 3.7MB      | 11.1MB     |