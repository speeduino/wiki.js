---
title: Реперные диски и декодеры Trigger Patterns and Decoders
description: List of supported crank/cam patterns
published: true
date: 2021-01-03T08:10:06.980Z
tags: 
editor: markdown
dateCreated: 2021-01-02T06:41:14.102Z
---

Speeduino поддерживает постоянно растущее количество коленвально-распредвальных декодеров и реперных колес. Это включает в себя некоторые из более распространенных установок OEM, а также те, которые предпочтительны на рынке послепродажного обслуживания (например, отсутствующие зубчатые колеса)..

В списке ниже перечислены все поддерживаемые в настоящее время. Каждый из них ведет к странице с подробной информацией об использовании декодера (эти страницы являются незавершенным процессом)

| Decoder                                                 | Status           | Applications / Description                                                                                                      |
| ------------------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| [Missing Tooth](/decoders/Missing_Tooth "wikilink")               | Complete         | A crank wheel with 1 or more 'missing' teeth                                                                                    |
| [Missing Tooth (cam)](/decoders/Missing_Tooth_\(cam\) "wikilink") | Complete         | A camshaft or distributor wheel with 1 or more 'missing' teeth at half-crank speed                                              |
| [Dual Wheel](/decoders/Dual_Wheel "wikilink")                     | Complete         | Two signals combined from two different wheels                                                                                  |
| [Basic Distributor](/decoders/Basic_Distributor "wikilink")       | Complete         | Untimed pulses that are the equivalent of a tach or distributor pulse                                                           |
| [GM 7X](/decoders/GM_7X "wikilink")                               | Untested         | Multi tooth pulse                                                                                                               |
| [4G63](/decoders/4G63 "wikilink")                                 | Complete         | As used on many 4 cylinder Mitsubishis and NA/NB Miata / MX-5. Also supports the 6 cylinder variation of this pattern (Eg 6g72) |
| [GM 24X](/decoders/GM_24X "wikilink")                             | Untested         | Commonly used on GM LS1 V8                                                                                                      |
| [Jeep 2000](/decoders/Jeep_2000 "wikilink")                       | Complete         | 6 Cylinder Jeep engines from '91 to 2000                                                                                     |
| [Harley EVO](/decoders/Harley_EVO "wikilink")                     | Complete         | Harley EVO V-Twin engines up to '99                                                                                              |
| [Honda D17](/decoders/Honda_D17 "wikilink")                       | Complete         | Honda 4 cylinder D17 engine                                                                                                     |
| [Miata 99](/decoders/Miata_99 "wikilink")                         | Complete         | 1.8L Miata/MX5 from '99 to '00                                                                                                  |
| [Non-360](/decoders/Non-360 "wikilink")                           | Complete         | A variation of the dual wheel decoder that can be used with tooth counts that do not divide evenly into 360                     |
| [Nissan 360](/decoders/Nissan_360 "wikilink")                     | In progress      | 360 tooth cam wheel used in many 4 and 6 cylinder engines.                                                                      |
| [Subaru 6/7](/decoders/Subaru_6/7 "wikilink")                     | Testing underway | Subaru engines using the 6 tooth crank wheel + 7 tooth cam wheel arrangement                                                    |
| [Daihatsu +1](/decoders/Daihatsu_+1 "wikilink")                   | Complete         | 3+1 and 4+1 patterns used on 3 and 4 cylinder Daihatsu engines                                                                  |
| [Subaru 36-2-2-2](/decoders/Subaru_36-2-2-2 "wikilink")           | Complete         | A 30 tooth wheel with three strategically placed big gaps                                                                       |

All signals need to be conditioned to a 3.3v - 5v dc square wave before being used by the firmware.