---
title: Programmable Outputs
description: 
published: true
date: 2022-10-15T13:36:16.685Z
tags: 
editor: markdown
dateCreated: 2022-04-04T08:51:25.574Z
---

# Programmable Outputs
## Overview

Speeduino features 8 programmable (on/off) outputs that can be used for purposes that can't be done with regular functionalities on Speeduino firmware. Using of these programmable outputs usually requires creating custom circuitry on the speeduino board to convert logic level arduino pins to drive actual hardware on the engine. Although some boards might have spare outputs that can be used. 

## Programmable Outputs dialog

![programmable_outputs.jpg](/img/tuning/programmable_outputs.jpg){.align-center width=400}

- **Select Rule number** - The programmable output number (1-8)
- **Output Pin Num** - Sets the output pin. Note that this is Arduino pin number. Not IDC or other ECU connector pin number. Select virtual to keep the rule result for cascade ruling. ***Requires power cycle***
- **Rule Alias** - This can be used to rename the output based on what it is controlling. This name will apear in log.
- **Output Polarity** - Sets if the output pin goes low or high when output is active. `Active low` means that output gets grounded when it's active and `Active high` means that output goes to 5v when active. *This refers to arduino pin polarity, board output might be inverted.*
- **Activation Delay(S)** - Sets how long the rule conditions need to stay active before the output is activated. Setting this to 0.0 makes the output to be active whenever conditions are met.
- **2nd Condition** - The output can have 1 or 2 conditions to be met for it to activate. Set this to `Disabled` if only one condition is enough. If this is set to `And`, both conditions need to be met for the output to activate. When `Or` is selected, it's enough that only one of the conditions is met for the output to activate. Third option is `XOR` which activates the output if one of the conditions are met. If both or none of the conditions are met, output stays off.
- **Condition 1 and 2** - To set what actually activates the output. For example if you want the output to activate when MAP value is higher than 80kPa, select `MAP (kPa)` on the left drop down. Then `> (greater)` for the right dropdown and lastly set the value to 80. This makes output activate above 80kPa MAP value.
- **Comparator type** - All comparators has an english name, but there are 2 with special use cases, `& (and)` a [bitwise AND operator](/en/https://en.wikipedia.org/wiki/Bitwise_operation#AND), the `^ (xor)` are [bitwise XOR operator](/en/https://en.wikipedia.org/wiki/Bitwise_operation#XOR), they can be useful to extract information from bit variables such as `engine` and/or `status1` to `status4` variables.
- **Limit time active** - This can be used to limit how long the output is active. Limiting can be used for how long the output must be on by minimum or how long it can be on at maximum. Setting this to 0.0 disables the time control.

## Use of cascade rules
Is possible to combine any number of rules to control a single output, with some observations.
- **Rule validations are done in sequence** - Use the small numbers for higher priority checks, when selecting `Rule 4` as rule 1 condition it will be validated on next loop *(0.1S delay)*
- **Every rule is available** - Even when a rule is controlling a pin is possible to use its status to validate another.
- **Using as condition** - Each rule are stored and compared as a bit, valid values are 0 and 1, valid comparators are `== (equal)`, `!= (different)`, `& (and)` and `^ (xor)`.

## Example of a flat shift light blinking every 0.5S
![programmable_outputs_cascade_0.jpg](/img/tuning/programmable_outputs_cascade_0.jpg){.align-center width=400}
![programmable_outputs_cascade_1.jpg](/img/tuning/programmable_outputs_cascade_1.jpg){.align-center width=400}
![programmable_outputs_cascade_2.jpg](/img/tuning/programmable_outputs_cascade_2.jpg){.align-center width=400}
