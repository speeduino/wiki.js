---
title: installation firmware
description: 
published: true
date: 2020-10-17T01:26:48.799Z
tags: 
editor: markdown
dateCreated: 2020-10-16T22:01:54.254Z
---

# Chargement du micrologiciel Speeduino
## Survol
Le micrologiciel Speeduino est le code qui fait fonctionner le module et doit être installé sur votre module avant de pouvoir utiliser le ECU. De nouvelles version du micrologiciel sont lancées régulièrement (aux deux mois environ) et ils permettent de nouvelles fonctionnalités, des corrections de bugs et des améliorations de performances. Donc il est recommandé de rester à jour pour les micro logiciels.  

Voulant garder un maximum de simplicité, le processus de compilation et d'installation du micrologiciel est raisonnablement simple. La plupart des utilisateurs utiliseront la méthode 'SpeedyLoader' pour l'installation du micrologiciel.


## Installation - SpeedyLoader

La méthode la plus simple (et recommandée) d'installer le micrologiciel Speeduino sur un Arduino standard MEGA 2560 est avec l'utilitaire SpeedyLoader. SpeedyLoader fera lui-même le transfert du micrologiciel et de l'installation de celui-ci sans aucune nécessité de compilation manuelle. Vous pouvez choisir lea version la plus récente ou sélectionner une des versions plus ancienne si vous le préférez. SpeedyLoader téléchargera le fichier INI and optionnellement un fichier de programmation de base qui sera possible de charger dans le logiciel TunerStudio.

-   **Windows:** [32-bit](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader-ia32.exe) / [64-bit](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader-x64.exe)
-   **Mac:** [SpeedyLoader.dmg](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader.dmg)
-   **Linux:** [SpeedyLoader.AppImage](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader.AppImage) (Doit être exécuté après le téléchargement)
    -   Linux requiert que la bibliothèque libusb soit installée. exemple :  si sur Debian/Ubuntu:
            `sudo apt-get install libusb-1.0-0 libusb-0.1-4:i386`
-   **Raspberry Pi** [SpeedyLoader.AppImage](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader-armv7l.AppImage)
    -   Raspberry Pi / Utilisateurs Raspbian peuvent installer la bibliothèque de cette façon:
            `sudo apt-get install libusb-1.0-0 libusb-0.1-4`

Une fois le micrologiciel installé sur la plaque, voir  [Se connecter à TunerStudio](/Connecting_to_TunerStudio) pour plus de détails sur comment configurer TunerStudio

## Installation - Compilation manuelle
> Note: la compilation manuelle du micrologiciel **n'est pas** nécessaire pour installer Speeduino, la façon la plus simple (et recommandée pour la plupart des usagers) est d'utiliser SpeedyLoader tel que décrite ci-haut.
{.is-warning}

 
Si vous voulez complier le micrologiciel vous-même, ou de faire des changement dans le code, les codes sources sont disponibles gratuitement.

### Requirements

-   un PC Windows, Mac ou linux 
-   un parmi les choix suivants:
    -   [Le Arduino IDE](http://arduino.cc/en/Main/Software). La version la plus vieille supportée est la 1.6.7, mais il est recommandé d'utiliser la version la plus à jour.
    -   [PlatformIO](http://platformio.org/). Disponible pour téléchargement ici: <http://platformio.org/platformio-ide>
-   Une copie du code source Speeduino le plus récent. Voir plus bas.
-   Une copie de [TunerStudio](http://www.tunerstudio.com/index.php/downloads) pour tester que le micrologiciel a été chargé correctement.

### Téléchargement du micrologiciel

Il y a deux méthodes pour obtenir le micrologiciel Speeduino:

1.  Des versions régulières et stables sont produites et relâchées sur Github. On peut les retrouver ici: <https://github.com/noisymime/speeduino/releases>
2.  Si vous voules les versions les plus récentes et avec plus donc fonctionnalitées, (quelque fois non parfaites et ou stables) elles sont disponibles ici: <https://github.com/noisymime/speeduino>

### Compilation du micrologiciel

-   Start the IDE, select *File &gt; Open*, navigate to the location you downloaded Speeduino to and open the **speeduino.ino** file.
-   Set the board type: *Tools &gt; Board &gt; Arduino Mega 2560* or Mega ADK (This is the only board currently supported)
-   Click the **Verify** icon in the top left corner (Looks like a tick) 

At this point you should have a compiled firmware! If you experienced a problem during the compile, see the [Troubleshooting](http://speeduino.com/wiki/index.php?title=Compiling_and_Installing_Firmware&action=edit&section=4#Troubleshooting) section below.

This video walks through the whole process of installing the firmware on your Arduino from scratch:

<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/AX9URou4JTs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

#### Optional (But recommended)

There is an option available for changing the compiler optimization level, which can improve . By default, the IDE uses the -Os compile option, which focuses on producing small binaries. As the size of the Speeduino code is not an issue but speed is a consideration, changing this to -O3 produces better results (Approximately 20% faster, with a 40% larger sketch size) To do this, you need to edit the platform.txt file:

-   Make sure the Arduino IDE isn't running
-   Open the platform.txt file which is in the following locations:
    -   On Windows: c:\\Program Files\\Arduino\\hardware\\arduino\\avr
    -   On Mac: /Applications/Arduino/Contents/Resources/Java/hardware/arduino/avr/
    -   On Linux:
-   On the following 3 entries, change the Os to be O3:
    -   compiler.c.flags
    -   compiler.c.elf.flags
    -   compiler.cpp.flags
-   Save the file and restart the Arduino IDE

**Note:** This is NOT required if using PlatformIO, the above optimisation is applied automatically there

### Installing

Once you've successfully compiled the firmware, installation on the board is trivial.

-   Plug in your Mega 2560 to a free USB port
-   If you're running an older version of **Windows** and this is the first time you've used an Arduino, you may need to install drivers for the Arduino serial chip (USB-UART or "USB adapter chip").

Most official boards and many non-official versions use the ATMega16U2 or 8U2, whereas many of the Mega2560 clone boards utilize the CH340G IC. Both types work well. The serial chips can generally be identified by appearance:

* **ATMega16U** - This has a square IC near the USB connector - drivers are included in Windows 7+, MacOS and Linux.
* **WCH CH340G** - This has a rectangular IC near the USB connector- uses "CH341" drivers from [WCH](http://www.wch.cn/downloads/file/65.html) for Windows
  * WCH-original CH340/CH341 drivers for other systems (Mac, Linux, Android, etc) may be found [here](http://www.wch.cn/downloads/CH341SER_ZIP.html).

-   In Arduino IDE; select the Mega2560: *Tools &gt; Board*
-   Select your system's serial port to upload: *Tools &gt; Serial Port*
-   Hit the *Upload* button from the top left corner 

### Older firmware releases

If required, older firmware releases and details can be found at [Firmware History](Firmware_History "wikilink")

### Verifying Firmware

The firmware is now loaded onto your board and you are now able to move onto [Connecting to TunerStudio](Connecting_to_TunerStudio "wikilink").

Optionally, you may perform a manual verification of the firmware by using the Arduino IDE's Serial Monitor. This can be started by selecting 'Serial Monitor' from the Tools menu.

In the window that appears, enter a capital "S" (no quotes) and press *Enter*. The Mega should respond with the year and month of the code version installed (xxxx.xx):

    Speeduino 2017.03

**NOTE**: Ensure the baud rate is set to 115200

You can also enter "?" for a list of queries from your Mega.

### Troubleshooting

#### Incorrect Arduino board selected

If you see the following (or similar) errors when trying to compile the firmware and the solutions:

    scheduler.ino:317:7: error: ‘OCR4A’ was not declared in this scope
    scheduler.ino:323:8: error: ‘TIMSK5’ was not declared in this scope
    scheduler.ino:323:25: error: ‘OCIE4A’ was not declared in this scope

You may have the wrong kind of Arduino board selected. Set the board type by selecting *Tools &gt; Board &gt; Arduino Mega 2560* or Mega ADK

#### Entire Speeduino project is not opened

The following can occur if you have only opened the speeduino.ino file rather than the whole project.

`speeduino.ino:27:21: fatal error: globals.h: No such file or directory`

Make sure all the files are contained within the same directory, then select File-&gt;Open and find the speeduino.ino file. If you have opened the project correctly, you should have multiple tabs along the top:

![speeduinoIDE.png](/img/TunerStudio/speeduinoIDE.png){.align-center width=500}

If you see only a single file or a small number of files then you haven't opened the entire project.