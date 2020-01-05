---
title: Decoders
description: List of supported crank/cam patterns
published: true
date: 2020-01-05T23:49:24.680Z
tags: 
---

Speeduino supports an ever growing number of crank and cam decoders and
trigger wheels. This includes some of the more common OEM setups as well
as those favoured in the aftermarket (Such as the missing tooth wheels).

The list below includes all those that are currently supported. They
each lead to a page with details on using the decoder (These pages are a
Work in Progress)

| Decoder                                                 | Status           | Applications / Description                                                                                                      |
| ------------------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| [Missing Tooth](Missing_Tooth "wikilink")               | Complete         | A crank wheel with 1 or more 'missing' teeth                                                                                    |
| [Missing Tooth (cam)](Missing_Tooth_\(cam\) "wikilink") | Complete         | A camshaft or distributor wheel with 1 or more 'missing' teeth at half-crank speed                                              |
| [Dual Wheel](Dual_Wheel "wikilink")                     | Complete         | Two signals combined from two different wheels                                                                                  |
| [Basic Distributor](Basic_Distributor "wikilink")       | Complete         | Untimed pulses that are the equivalent of a tach or distributor pulse                                                           |
| [GM 7X](GM_7X "wikilink")                               | Untested         | Multi tooth pulse                                                                                                               |
| [4G63](4G63 "wikilink")                                 | Complete         | As used on many 4 cylinder Mitsubishis and NA/NB Miata / MX-5. Also supports the 6 cylinder variation of this pattern (Eg 6g72) |
| [GM 24X](GM_24X "wikilink")                             | Untested         | Commonly used on GM LS1 V8                                                                                                      |
| [Jeep 2000](Jeep_2000 "wikilink")                       | Complete         | 6 Cylinder Jeep engines from '91 to 2000                                                                                        |
| [Audi 135](Audi_135 "wikilink")                         | Complete         | Audi engines with 135 pulses-per-revolution                                                                                     |
| [Honda D17](Honda_D17 "wikilink")                       | Complete         | Honda 4 cylinder D17 engine                                                                                                     |
| [Miata 99](Miata_99 "wikilink")                         | Complete         | 1.8L Miata/MX5 from '99 to '00                                                                                                  |
| [Non-360](Non-360 "wikilink")                           | Complete         | A variation of the dual wheel decoder that can be used with tooth counts that do not divide evenly into 360                     |
| [Nissan 360](Nissan_360 "wikilink")                     | In progress      | 360 tooth cam wheel used in many 4 and 6 cylinder engines.                                                                      |
| [Subaru 6/7](Subaru_6/7 "wikilink")                     | Testing underway | Subaru engines using the 6 tooth crank wheel + 7 tooth cam wheel arrangement                                                    |
| [Daihatsu +1](Daihatsu_+1 "wikilink")                   | Complete         | 3+1 and 4+1 patterns used on 3 and 4 cylinder Daihatsu engines                                                                  |
| [Subaru 36-2-2-2](Subaru_36-2-2-2 "wikilink")           | Complete         | A 30 tooth wheel with three strategically placed big gaps                                                                       |

All signals need to be conditioned to a 3.3v - 5v dc square wave bef