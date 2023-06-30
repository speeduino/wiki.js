---
title: Trigger Patterns and Decoders
description: List of supported crank/cam patterns
published: true
date: 2023-06-30T22:13:10.799Z
tags: 
editor: markdown
dateCreated: 2020-01-05T23:43:16.210Z
---

Speeduino supports an ever growing number of crank and cam decoders and trigger wheels. This includes some of the more common OEM setups as well as those favoured in the aftermarket (Such as the missing tooth wheels).

The list below includes all those that are currently supported. They each lead to a page with details on using the decoder (These pages are a Work in Progress)

| Decoder                                                 | Status           | Applications / Description  |
| ------------------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| [Missing Tooth](/decoders/Missing_Tooth "wikilink")               | Complete         | A crank wheel with 1 or more 'missing' teeth  |
| [Missing Tooth (cam)](/decoders/Missing_Tooth_\(cam\) "wikilink") | Complete         | A camshaft or distributor wheel with 1 or more 'missing' teeth at half-crank speed  |
| [Dual Wheel](/decoders/Dual_Wheel) 																                     | Complete         | Two signals combined from two different wheels (Crank + Cam) |
| [Basic Distributor](/decoders/Basic_Distributor "wikilink")       | Complete         | Untimed pulses that are the equivalent of a tach or distributor pulse  |
| [GM 7X](/decoders/GM_7X "wikilink")                               | Untested         | Multi tooth pulse |
| [4G63](/decoders/4G63 "wikilink")                                 | Complete         | As used on many 4 cylinder Mitsubishis and NA/NB Miata / MX-5. Also supports the 6 cylinder variation of this pattern (Eg 6g72) |
| [GM 24X](/decoders/GM_24X "wikilink")                             | In Progress         | Commonly used on GM LS1 V8  |
| [Jeep 2000](/decoders/Jeep_2000 "wikilink")                       | Complete         | 6 Cylinder Jeep engines from '91 to 2000  |
| [Harley EVO](/decoders/Harley_EVO "wikilink")                     | Complete         | Harley EVO V-Twin engines up to '99  |
| [Honda D17](/decoders/Honda_D17 "wikilink")                       | Complete         | Honda 4 cylinder D17 engine with 12+1 crank signal  |
| [Honda K20/K24](/decoders/HondaK20K24  "wikilink")           | In Development         | Honda K20/K24 with 12+1 crank and supporting inlet and exhaust cams  |
| [Honda J30/J32](/decoders/HondaJ30J32  "wikilink")           | In Development         | Honda J30/J32 as well as early s2000's  |
| [Miata 99-05](/decoders/Miata_99 "wikilink")                      | Complete         | 1.8L Miata/MX5 from '99 to '09  |
| [Non-360](/decoders/Non-360 "wikilink")                           | Complete         | A variation of the dual wheel decoder that can be used with tooth counts that do not divide evenly into 360  |
| [Nissan 360](/decoders/Nissan_360 "wikilink")                     | Partial      | 360 tooth cam wheel used in many 4 and 6 cylinder engines. |
| [Daihatsu +1](/decoders/Daihatsu_+1 "wikilink")                   | Complete         | 3+1 and 4+1 patterns used on 3 and 4 cylinder Daihatsu engines |
| [Subaru 36-2-2-2](/decoders/Subaru_36-2-2-2 "wikilink")           | Complete         | A 30 tooth wheel with three strategically placed big gaps             (H4 and H6) |
| [Chrysler NGC](/decoders/ChryslerNGC "wikilink")           | Complete         | A 36+2-2 crank with 7 tooth cam for 4 cyl, 12 tooth cam for 6 cyl and 15 tooth cam for 8 cyl. Used on Chrysler/Jeep/Dodge vehicles from 2002 onward. |
| [DRZ400](/decoders/DRZ400 "wikilink")           | Complete         | A varient on the dual wheel decoder setup for DRZ400 bikes |
| [Renix](/decoders/Renix "wikilink")           | Complete         | Renix decoder for 44 and 66 tooth trigger wheels |
| [Rover MEMs](/decoders/Rover "wikilink")           | Complete    | Rover MEMs decoder covering 5 different crank patterns |
| [Ford ST170](/decoders/ST170 "wikilink")           | Complete         | 36-1 Missing tooth with special Ford ST170 cam trigger wheel |
| [Yamaha VMax 1990+](/decoders/Yamaha_VMax  "wikilink")           | Complete         | Yamaha V4 engine with 6 unevenly spaced teeth at crank |
| [Toyota 3 tooth cam](/decoders/Toyota3Tooth  "wikilink")           | In Progress         | Decoder covering a number of Toyota engines with a 3 tooth cam including 1uz, 1jz, 2jz-vvti, 1f-fe |




All signals <b><i>MUST</b></i> be conditioned to a 3.3v - 5v dc square wave before being used by the firmware.