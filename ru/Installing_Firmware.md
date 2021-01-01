---
title: Speeduino Firmware setup
description: Setting up the Speeduino firmware on your board
published: true
date: 2021-01-01T17:04:36.320Z
tags: 
editor: markdown
dateCreated: 2021-01-01T15:47:32.110Z
---

# Загрузка прошивки Speeduino
## Обзор
Прошивка Speeduino - это программный код, который должен быть установлен на плату перед использованием ЭБУ. Новые версии прошивок выпускаются регулярно (примерно каждые 2 месяца), с добавлением новых функции, исправлением ошибок и улучшением производительности, поэтому настоятельно рекомендуется при регулярно обновлять прошивку. 

Процесс компиляции и установки встроенного ПО достаточно прост. Большинство пользователей будут использовать метод SpeedyLoader для установки прошивки


## Установка с помощью - SpeedyLoader

Самый простой и рекомендуемый метод установки встроенного ПО Speeduino на стандартную модель Arduino Mega 2560 осуществляется утилитой SpeedyLoader. SpeadingLoader обеспечивает загрузку встроенного ПО и его установку на Arduino без необходимости самостоятельно компилировать любой код вручную. Можно выбрать самую новую прошивку или одну из старых, при желании. SpeedyLoader также загрузит INI-файл и дополнительно базовую настройку параметров прошивки чтобы можно было загрузить ваш проект в TunerStudio.

-   **Windows:** [32-bit](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader-ia32.exe) / [64-bit](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader-x64.exe)
-   **Mac:** [SpeedyLoader.dmg](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader.dmg)
-   **Linux:** [SpeedyLoader.AppImage](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader.AppImage) (Необходимо сделать исполняемым после загрузки)
    -   Linux требуется установить библиотеки libusb. EG если на Debian/Ubuntu:
            `sudo apt-get install libusb-1.0-0 libusb-0.1-4:i386`
-   **Raspberry Pi** [SpeedyLoader.AppImage](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader-armv7l.AppImage)
    -   Raspberry Pi / Raspbian пользователи могут устанавливать необходимые библиотеки с помощью:
            `sudo apt-get install libusb-1.0-0 libusb-0.1-4`

После установки прошивки обеспечения на плате, смотри [Connecting to TunerStudio](/Connecting_to_TunerStudio) дополнительные сведения о настройке TunerStudio

## Установка с помощью Самостоятельной Компиляции
> Обратите внимание, что компиляция прошивки **НЕ** трубуется для установки Speeduino, самый простой (и рекомендуемый большинству пользователей) способ - использовать SpeedyLoader как описано выше.
{.is-warning}

Если вы хотите самостоятельно скомпилировать прошивку или внести какие-либо изменения в код, то исходные тексты программного обеспечения как прошлых, так и самых последний версий находятся в свободном доступе.

### Требования

-   Компьютер под управлением Windows, Mac или linux PC
-   Одну из следующих интерактивных средств разработки:
    -   [The Arduino IDE](http://arduino.cc/en/Main/Software). Требуется текущая минимальная версия 1.6.7, хотя рекомендуется более новая.
    -   [PlatformIO](http://platformio.org/). Может быть загружено с <http://platformio.org/platformio-ide>
-   Копия последней версии базового ПО Speeduino, смотреть ниже.
-   Копия [TunerStudio](http://www.tunerstudio.com/index.php/downloads) to test that the firmware has uploaded successfully

### Загрузка прошивки

Существует два способа получения прошивок Speeduino:

1.  Регулярные стабильные прошивки размещаются на Github по адресу: <https://github.com/noisymime/speeduino/releases>
2.  Если вам нужен самый последний и самый большой код, репозиторий git можно клонировать и обновлять. Посмотрите <https://github.com/noisymime/speeduino>

### Компиляция прошивки

-   Запустите интерактивную среду разработки (IDE), выберите *File &gt; Open*, перейдите в расположение, в которое вы загрузили код Speeduino, и откройте **speeduino.ino** файл.
-   Установка тип платы: *Tools &gt; Board &gt; Arduino Mega 2560* или Mega ADK (Это единственная поддерживаемая в настоящее время плата)
-   Щелкните значок **Verify** в верхнем левом углу (выглядит как галочка)

В результате вы должны получить скомпилированную прошивку! Если во время компиляции возникла проблема, см. [Поиск Неисправностей](http://speeduino.com/wiki/index.php?title=Compiling_and_Installing_Firmware&action=edit&section=4#Troubleshooting) раздел ниже.

Это видео показвыает весь процесс установки прошивки на вашем Arduino с самого начала:

<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/AX9URou4JTs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

#### Необязательно (но рекомендуется)

Существует возможность изменения уровня оптимизации компилятора, которая может быть улучшена. По умолчанию в интерактивной среде разработки IDE используется опция компиляции -Os, которая фокусируется на создании небольших двоичных файлов. Поскольку размер кода Speeduino не проблема, а скорость является приоритетной, изменение опции на -O3 дает лучшие результаты (приблизительно на 20% быстрее, с 40% больше размер размером двоичного кода) Для этого необходимо отредактировать файл platform.txt

-   Убедитесь, что среда разработки Arduinoне запущена
-   Откройте файл platform.txt по следующему пути:
    -   Для Windows: c:\\Program Files\\Arduino\\hardware\\arduino\\avr
    -   Для Mac: /Applications/Arduino/Contents/Resources/Java/hardware/arduino/avr/
    -   Для Linux: ...
-   В следующих 3 местах, измените Os на O3:
    -   compiler.c.flags
    -   compiler.c.elf.flags
    -   compiler.cpp.flags
-   Сохраните файлы ***Save the file*** и перезапустите среду разработки Arduino

**Примечание:** Это НЕ требуется при использовании PlatformIO, вышеуказанная оптимизация применяется автоматически

### Установка

После успешной компиляции прошивки обеспечения установка на плате становится простой задачей.

-   Подключите Mega 2560 к свободному USB порту
-   Если вы используете старую версию **Windows** и это первый раз, когда вы используете Arduino, возможно, вам потребуется установить драйверы для серийного чипа Arduino (USB-UART или "USB adapter chip").

Большинство официальных плат и многие неофициальные версии используют ATMega16U2 или 8U2, тогда как многие из Mega2560 копий используют CH340G IC. Оба типа работают хорошо. Выявить подлинники и клоны обычно можно :

* **ATMega16U** - Имеется квадратный IC около USB разъёма - драйвера включены в Windows 7+, MacOS и Linux.
* **WCH CH340G** - Имеется квадратный IC около USB разъёма - используются "CH341" драйвера скачиваемые с [WCH](http://www.wch.cn/downloads/file/65.html) для Windows
  * WCH-оригинальные CH340/CH341 драйвера для других систем (Mac, Linux, Android, etc) можно найти [здесь](http://www.wch.cn/downloads/CH341SER_ZIP.html).

-   В среде разработки Arduino IDE; выберите Mega2560: *Tools &gt; Board*
-   выберите последовательный порт в вашей системе для загрузки: *Tools &gt; Serial Port*
-   Нажмите *Upload* кнопку в верхнем левом углу 

### Старые версии прошивок

Если необходимо, старые версии прошивок с описанием можно найти здесь [История Прошивок](Firmware_History "wikilink")

### Проверка прошивки

Прошивка загружена на плату, и теперь можно перейти к [Подключение к TunerStudio](Connecting_to_TunerStudio "wikilink").

Дополнительно можно выполнить проверку прошивки с помощью последовательного монитора Arduino IDE. Для этого выберите "Serial Monitor" в меню "Tools".

В появившемся окне введите большую букву "S" (без кавычек) и нажмите *Enter*. Плата Мега должна выдать год и месяц установленной прошивки (xxxx.xx):

    Speeduino 2020.03

**Примечание**: Убедитесь, что скорость передачи установлена 115200

Также можно ввести "?" для списка запросов от Mega.

### Поиск неисправностей

#### Выбрана неправильная плата Arduino

Если при попытке компиляции прошивки появляются следующие (или подобные) ошибки:

    scheduler.ino:317:7: error: ‘OCR4A’ was not declared in this scope
    scheduler.ino:323:8: error: ‘TIMSK5’ was not declared in this scope
    scheduler.ino:323:25: error: ‘OCIE4A’ was not declared in this scope

Возможно, выбран неправильный тип платы Arduino. Установите тип платы путем выбора *Tools &gt; Board &gt; Arduino Mega 2560* или Mega ADK

#### Весь проект Speeduino не открыт

Следующее может произойти, если был открыт только файл speeduino.ino, а не весь проект.

`speeduino.ino:27:21: fatal error: globals.h: No such file or directory`

Убедитесь, что все файлы находятся в одном каталоге, затем выберите File-&gt;Open и найдите **speeduino.ino** файл. Если проект был открыт правильно, в верхней части проекта должно быть несколько вкладок:

![speeduinoIDE.png](/img/TunerStudio/speeduinoIDE.png){.align-center width=500}

Если вы видите только один файл или небольшое количество файлов, то вы не открыли весь проект.