---
title: Speeduino Handleiding
description: De Speeduino documentatie handleiding
published: true
date: 2020-12-22T07:19:56.368Z
tags: 
editor: undefined
dateCreated: 2020-12-22T07:19:47.101Z
---

# Introductie
Deze handleiding behandelt de hardware (sensoren, bedrading etc.), Softwareconfiguratie en tuning elementen die verband houden met het draaien van een Speeduino unit. Wanneer u begint met Speeduino, vooral als het de eerste keer is dat u een motormanagementsysteem installeert en configureert, zal deze handleiding helpen bij het begrijpen van de mogelijkheden van Speeduino en hoe het geïnstalleerd moet worden, zowel in termen van hardware als software / firmware.

Hoewel dit document zal helpen bij het verstrekken van informatie met betrekking tot de configuratie van de Speeduino, heeft het geen betrekking op geavanceerde motortuning, brandstof- / ontstekingsstrategieën, enzovoort. Zoals bij elke wijziging in het motormanagement, is de mogelijkheid van schade aan hardware zeer reëel als een systeem onjuist wordt geconfigureerd.

### Benodigdheden

Om te beginnen met Speeduino, kan het helpen om de verschillende componenten van het systeem te begrijpen:

1. **Een Speeduino board** - Dit is de kracht van de Speeduino ECU en bevat alle drivers en IO-circuits. Dit is misschien een van de generieke borden (zoals de v0.4) of een PNP-board voor een specifiek mode lauto.
2. **Een Arduino** - Dit is het brein van Speeduino en bevat de processor, geheugen en opslag. Het wordt aangesloten op het Speeduino board om te communiceren met de voertuigbedrading. Meestal een Arduino Mega 2560.
3. **Firmware** - Dit is de systeemsoftware die op het Arduino board wordt uitgevoerd en de werking ervan voedt. Er wordt regelmatig nieuwe firmware uitgebracht met updates, prestatieverbeteringen en bugfixes. 

Als uitgangspunt wordt over het algemeen aanbevolen om eerst de firmware naar uw Arduino te uploaden en deze te verbinden met de tuning-software (Tuner Studio) voordat u verder gaat met hardware-assemblage of bedrading enz. Software-installatie en configuratie op Speeduino kan worden voltooid zonder de noodzaak aan extra hardware om aanwezig te zijn (buiten de arduino zelf) en dit maakt verkenning van de beschikbare software en opties mogelijk voordat ofwel een aanzienlijke investering of een aanzienlijke tijdsinvestering nodig is.

Meer details over hardwarevereisten en versiespecifieke functies zijn te vinden op de "Getting Started" -pagina. (https://wiki.speeduino.com/nl/Getting_Started)

### Over deze handleiding

Als open source-project groeit deze documentatie voortdurend en dit betekent dat u gaten in de documentatie kunt tegenkomen waar momenteel weinig informatie wordt verstrekt. Aarzel niet om op het forum te posten als er iets ontbreekt dat je kritisch (of zelfs niet zo kritisch) nodig hebt.

Bovendien, als u wilt bijdragen aan de Speeduino-documentatie, horen we graag van u! De voorkeursmethode om wiki-toegang aan te vragen, is via Slack https://speeduino.com/forum/app.php/page/slack)
