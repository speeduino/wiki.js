---
title: Speeduino Firmware installatie
description: De Speeduino firmware op uw board instellen
published: true
date: 2020-12-22T10:39:21.689Z
tags: 
editor: markdown
dateCreated: 2020-12-22T10:39:21.689Z
---

# De Speeduino firmware laden
## Overzicht
De Speeduino firmware is de code die de hardware aandrijft en moet op uw bord worden geïnstalleerd voordat u de ECU gebruikt. Er worden regelmatig nieuwe firmwareversies uitgebracht (ongeveer elke 2 maanden) die nieuwe functies, bugfixes en prestatieverbeteringen bieden, dus up-to-date blijven wordt sterk aanbevolen.

Met het oog op maximale eenvoud is het compileren en installeren van de firmware redelijk eenvoudig. De meeste gebruikers zullen de SpeedyLoader methode gebruiken om de firmware te installeren


## Installatie - SpeedyLoader

De eenvoudigste (en aanbevolen) methode om de Speeduino firmware op een standaard Arduino Mega 2560 te installeren, is met het hulpprogramma SpeedyLoader. SpeedyLoader zorgt ervoor dat de firmware wordt gedownload en op een Arduino wordt geïnstalleerd zonder dat u de code zelf handmatig hoeft te compileren. U kunt de nieuwste firmware kiezen die is uitgebracht, of desgewenst een van de oudere. SpeedyLoader zal ook het INI-bestand downloaden en optioneel een basistune voor de firmware die u kiest, zodat deze in uw TunerStudio project kan worden geladen.

-   **Windows:** [32-bit](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader-ia32.exe) / [64-bit](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader-x64.exe)
-   **Mac:** [SpeedyLoader.dmg](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader.dmg)
-   **Linux:** [SpeedyLoader.AppImage](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader.AppImage) (Moet uitvoerbaar worden gemaakt na het downloaden)
    -   Linux vereist dat libusb libraries worden geïnstalleerd. Bijv. op Debian/Ubuntu:
            `sudo apt-get install libusb-1.0-0 libusb-0.1-4:i386`
-   **Raspberry Pi** [SpeedyLoader.AppImage](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader-armv7l.AppImage)
    -   Raspberry Pi / Raspbian-gebruikers kunnen de vereiste libraries installeren met:
            `sudo apt-get install libusb-1.0-0 libusb-0.1-4`

Als de firmware eenmaal op het board is geïnstalleerd, zie [Verbinding maken met Tuner Studio](/Connecting_to_TunerStudio) voor meer informatie over het configureren van TunerStudio

## Installatie - Handmatig Compilen
> Let op dat het handmatig compileren van de firmware ** NIET ** vereist is om Speeduino te installeren, de gemakkelijkste (en aanbevolen voor de meeste gebruikers) methode is het gebruik van SpeedyLoader zoals hierboven beschreven.
{.is-warning}

 
Als u de firmware zelf wilt compileren of codewijzigingen wilt aanbrengen, dan is de bron van zowel de releases als de huidige ontwikkelversie vrij beschikbaar.

### Vereisten

-   Een Windows, Mac of linux PC
-   Een van de volgende:
    -   [The Arduino IDE](http://arduino.cc/en/Main/Software). De huidige minimum vereiste versie is 1.6.7, hoewel een nieuwere versie wordt aanbevolen.
    -   [PlatformIO](http://platformio.org/). Kan worden gedownload van <http://platformio.org/platformio-ide>
-   Een kopie van de nieuwste Speeduino codebase. Zie hieronder.
-   Een installatie van [TunerStudio](http://www.tunerstudio.com/index.php/downloads) om te testen of de firmware is geüpload

### De firmware downloaden

Er zijn twee methoden om de Speeduino-firmware te verkrijgen:

1.  Regelmatige, stabiele code-drops worden geproduceerd en gemaakt als releases op Github. Deze zijn te vinden op: <https://github.com/noisymime/speeduino/releases>
2. Als je de nieuwste en beste (en soms slechtste) code wilt, kan de git-repository worden gekloond en bijgewerkt. Zie <https://github.com/noisymime/speeduino>

### De firmware compilen

-   Start de IDE, selecteer *File &gt; Open*, navigeer naar de locatie waar u Speeduino hebt gedownload en open het **speeduino.ino** bestand.
-   Selecteer board type: *Tools &gt; Board &gt; Arduino Mega 2560* or Mega ADK (Dit is het enige bord dat momenteel wordt ondersteund)
-   Klik op het **Verify** icoon in de linkerbovenhoek (lijkt op een vinkje)

Op dit punt zou u een gecompileerde firmware moeten hebben! Als u een probleem ondervindt tijdens het compileren, raadpleegt u de [Probleemoplossing](http://speeduino.com/wiki/index.php?title=Compiling_and_Installing_Firmware&action=edit&section=4#Troubleshooting) sectie hieronder.

Deze video doorloopt het hele proces van het helemaal opnieuw installeren van de firmware op uw Arduino:

<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/AX9URou4JTs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

#### Optioneel (Maar Aanbevolen)

Er is een optie beschikbaar om het optimalisatieniveau van de compiler te wijzigen, dat kan verbeteren. Standaard gebruikt de IDE de compileeroptie -Os, die zich richt op het produceren van kleine binaire bestanden. Omdat de grootte van de Speeduino-code geen probleem is, maar snelheid een overweging is, levert het wijzigen van dit naar -O3 betere resultaten op (ongeveer 20% sneller, met een 40% grotere schetsgrootte). Hiervoor moet u het platform.txt bewerken:

-   Zorg ervoor dat de Arduino IDE niet actief is
-   Open het platform.txt bestand dat zich op de volgende locaties bevindt:
    -   Op Windows: c:\\Program Files\\Arduino\\hardware\\arduino\\avr
    -   Op Mac: /Applications/Arduino/Contents/Resources/Java/hardware/arduino/avr/
    -   Op Linux:
-   Op de volgende 3 vermeldingen, verander de Os naar O3:
    -   compiler.c.flags
    -   compiler.c.elf.flags
    -   compiler.cpp.flags
-   Sla het bestand op en start de Arduino IDE opnieuw

**Lees:** Dit is NIET vereist als u PlatformIO gebruikt, de bovenstaande optimalisatie wordt daar automatisch toegepast

### Installeren

Nadat u de firmware met succes hebt gecompileerd, is de installatie op het bord triviaal.

-   Sluit uw Mega 2560 aan op een vrije USB-poort
-   Als u een oudere versie van **Windows** gebruikt en dit is de eerste keer dat u een Arduino gebruikt, moet u wellicht stuurprogramma's installeren voor de Arduino seriële chip (USB-UART of "USB-adapterchip").

De meeste officiële borden en veel niet-officiële versies gebruiken de ATMega16U2 of 8U2, terwijl veel van de Mega2560-kloonborden de CH340G IC gebruiken. Beide typen werken goed. De seriële chips kunnen over het algemeen worden geïdentificeerd door uiterlijk:

* **ATMega16U** - Deze heeft een vierkant IC bij de USB-connector - stuurprogramma's zijn inbegrepen in Windows 7+, MacOS en Linux.
* **WCH CH340G** - Deze heeft een rechthoekige IC in de buurt van de USB-connector - gebruikt "CH341" drivers van [WCH](http://www.wch.cn/downloads/file/65.html) voor Windows
  * WCH-original CH340/CH341stuurprogramma's voor andere systemen (Mac, Linux, Android, enz.) kunnen  [hier](http://www.wch.cn/downloads/CH341SER_ZIP.html) worden gevonden.

-   In Arduino IDE; selecteer de Mega2560: *Tools &gt; Board*
-   Selecteer de seriële poort van uw systeem om te uploaden: *Tools &gt; Serial Port*
-   Druk op de knop *Upload* in de linkerbovenhoek 

### Oudere firmware versies

Indien nodig zijn oudere firmwareversies en details te vinden op [Firmware History](Firmware_History "wikilink")

### Firmware verifiëren

De firmware is nu op uw bord geladen en u kunt nu verder naar [Verbinding maken met Tuner Studio](/Connecting_to_TunerStudio "wikilink")

Optioneel kunt u een handmatige verificatie van de firmware uitvoeren met behulp van de seriële monitor van de Arduino IDE. Dit kan worden gestart door 'Serial Monitor' te selecteren in het menu Tools.

Typ in het venster dat verschijnt een hoofdletter "S" (geen aanhalingstekens) en druk op *Enter*. De Mega moet reageren met het jaar en de maand van de geïnstalleerde codeversie (xxxx.xx):

    Speeduino 2020.12

**LEES**: Zorg ervoor dat de baudrate is ingesteld op 115200

U kunt ook "?" invoeren voor een lijst met queries van uw Mega.

### Probleemoplossing

#### Onjuist Arduino board geselecteerd

Als u de volgende (of vergelijkbare) fouten ziet bij het compileren van de firmware en de oplossingen:

    scheduler.ino:317:7: error: ‘OCR4A’ was not declared in this scope
    scheduler.ino:323:8: error: ‘TIMSK5’ was not declared in this scope
    scheduler.ino:323:25: error: ‘OCIE4A’ was not declared in this scope

Mogelijk hebt u het verkeerde type Arduino-bord geselecteerd. Stel het bordtype in door *Tools &gt; Board &gt; Arduino Mega 2560* of Mega ADK

#### Het hele Speeduino project is niet geopend

Het volgende kan gebeuren als u alleen het speeduino.ino-bestand hebt geopend in plaats van het hele project.

`speeduino.ino:27:21: fatal error: globals.h: No such file or directory`

Zorg ervoor dat alle bestanden zich in dezelfde map bevinden, selecteer File-&gt;Open en zoek het bestand speeduino.ino. Als je het project correct hebt geopend, zou je bovenaan meerdere tabbladen moeten hebben:

![speeduinoIDE.png](/img/TunerStudio/speeduinoIDE.png){.align-center width=500}

Als u slechts één bestand of een klein aantal bestanden ziet, heeft u niet het hele project geopend.