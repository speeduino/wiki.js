---
title: Интерфейс ввода/вывода GPIO_for_Speeduino
description: 
published: true
date: 2021-01-04T16:38:16.862Z
tags: 
editor: undefined
dateCreated: 2021-01-04T15:47:47.591Z
---

Интерфейс ввода/вывода общего назначения (general-purpose input/output) GPIO for Speeduino
==================

Даррен Сиепка

### Что это?

GPIO для Speeduino - это семейство универсальных программируемых модулей ввода и вывода, которые могут использоваться как совместно с ECU двигателя Speeduino, так и автономно. Модули программируются через Tunerstudio либо через последовательный порт, либо через интегрированную сеть CanBus (только некоторые варианты)

Модули могут использовать несколько различных типов плат процессоров, в том числе arduino, tensy и stm32.

Операции ввода-вывода программируются логическими, & lt;, & gt;, = и побитовыми И. некоторые варианты предлагают 2 или даже 3 логических условия соединения.

### Версии

### GPIO MINI V0.001

Данное микропрограммное обеспечение поддерживает до 16 выходных каналов, 16 входных каналов и 16 аналоговых каналов от локальных источников, на которые распространяется функция MCU. В настоящее время поддерживаются MCU Arduino Pro-Mini, Arduino Uno и Arduino Mega2560. Выходные каналы могут быть активированы через одно условие с логическими операциями & lt;, & gt; и = В этой версии поддерживаются только встроенные (локальные) io.

### GPIO MINI V0.002

Это микропрограммное обеспечение имеет те же функции, что и V0.001, но с возможностью доступа к значениям данных выходного канала от ECU Speeduino, подключенного непосредственно с помощью поддержки Speeduino Serial3. В настоящее время эта микропрограмма поддерживается только Arduino Mega2560

### GPIO MINI V0.003

Это встроенное ПО позволяет Speeduino получать доступ к входам устройства GPIO (как цифровым, так и аналоговым), отображаемым в TunerStudio или регистрируемым в журнале. Опять же в этой версии устройство GPIO все еще подключено непосредственно к Speeduino через Serial3.This прошивку в настоящее время поддерживает только Arduino Mega2560

Установка программного обеспечения
---------------------

Последние версии GPIO можно загрузить здесь <https://github.com/Autohome2/Speeduino-GPIO>

Если вы устанавливаете одну из версий с помощью CANBUS, вам потребуется установить библиотеки в Arduino IDE, если вы не установили текущую версию. Библиотеки включены в загрузку.

Используемые библиотеки:

Canbus от CoryJFowler (for spi canbus modules)[1](https://github.com/coryjfowler/MCP_CAN_lib)

Flexcan от Pawelsky (for Teensy onboard Can)[2](https://github.com/pawelsky/FlexCAN_Library)

Библиотека flexcan включена в установку Teensyduino в Arduino IDE[3](https://www.pjrc.com/teensy/td_download.html)

Файл Tunerstudio INI и базовая настройка находятся в папке ссылок для конкретного варианта, который вы хотите установить при загрузке. ПРИМЕЧАНИЕ. Очень важно установить правильный ini и базовый msq для выбранного микропрограммного обеспечения (прошивки).

Организация данных в реальном времени
--------------------------

Некоторые версии GPIO поддерживают возможность удаленного доступа к данным в реальном времени с портов ввода-вывода GPIO через порт Serial3 или Canbus (см. версии модели). Данные структурированы как адрес смещения для устройства GPIO real canID.

1 - 32

Цифровые входы от 1 до 32. Они посылают значение 1023, если включено, и 0, когда выключено.

33 - 64

Цифровые выходы от 1 до 32. Они имеют значение ON, равное 1023, и значение Off, равное 0.

65 - 81

Аналоговые входы от 0 до 15. Эти команды посылают значение в диапазоне от 0 до 1024.

пример: если GPIO real canID = = 0x105 для запроса аналогового 0, вы бы запросили данные от 261dec + 65dec = = 326dec = = 0x146

Данные находятся в байтах 0 и 1 из 8 переданных данных, 0 - lsb 1 - msb.

Конфигурация
-------------

### Конфигурация устройства

Конфигурацию устройства можно найти в Tunerstudio закладке "Settings" затем выберите "device configuration"

![](Gpio_config.jpg "Gpio_config.jpg")

-   **Device Real CanID** - Адрес HEX 11bit Can устройства GPIO
-   **Board Pin Layout** - Компоновка Mcu и платы, используемая GPIO

<img src="Board_pin_layout.jpg" title="Board_pin_layout.jpg" alt="Board_pin_layout.jpg" width="400" />

Выберите соответствующий тип mcu и платы для блока GPIO. Загрузка прошивки имеет несколько конфигураций плат, предварительно установленных в коде. В зависимости от того, с каким MCU будет скомпилировано микропрограммное обеспечение, зависит, доступна ли эта конфигурация для использования.

-   **Speeduino Connection Type**
    -   **Not used** - Этот параметр используется, если GPIO является автономным устройством
    -   **Via Serial3** - Эта настройка используется, если GPIO подключается непосредственно с помощью последовательного соединения к вторичному последовательному порту Speeduino (обычно Serial3).
    -   **Via CanBus** - Этот параметр устанавливается, если GPIO подключен с помощью CanBus. Предварительно установлено значение 11 бит 250 кбит/с.

<img src="Speeduino_connection.jpg" title="Speeduino_connection.jpg" alt="Speeduino_connection.jpg" width="400" />

-   **Speeduino Base CanBus Address** - Адрес HEX 11bit Can ECU Speeduino

### Программируемая конфигурация ввода/вывода

С Programmable Outputs закладки можно выбрать для настройки универсальных выходов **Universal outputs** или Внешний ввод-вывод **External IO**

<img src="Prog_outputs1.jpg" title="Prog_outputs1.jpg" alt="Prog_outputs1.jpg" width="400" />

### Настройка выходных данных

Эта страница используется для настройки универсальных выходов Universal Outputs.

<img src="Universal_outputs.jpg" title="Universal_outputs.jpg" alt="Universal_outputs.jpg" width="500" />

-   *' Output port*' - Это выходной порт устройства GPIO. Чтобы сначала выбрать порт из списка выходных портов, настройте параметр для этого порта, а затем нажмите кнопку "" Записать "", чтобы записать изменения на устройство GPIO (если оно работает).

<!-- -->

-   *' Port settings*'
    -   -   *' Enabled*' - Включает этот выходной порт
        -   *' Power on value*' - Активное состояние порта при запуске устройства GPIO
        -   *' Active value*' - Активное выходное состояние (активное высокое или активное низкое)

<!-- -->

-   *' Active conditions*' Активные условия
    -   -   *' Controller*' - Это исправлено как имя используемого устройства GPIO
        -   *' Output channel*' - Это либо выходные данные в реальном времени с локального устройства GPIO, либо данные с внешних устройств. [(see external data configuration)]((see_external_data_configuration) "wikilink")).
        -   *' Logic option*' - Логическая операция над исходным значением по сравнению с пороговым значением, выберите &lt;,&gt;, или =
        -   *' Threshold*' - Пороговое значение Trigger для выходных данных и исходных данных.
        -   ''' Hysteresis ''' - Порог и пороговое значение

### Настройка внешних источников данных

Эта страница используется для настройки внешних источников данных.

<img src="Externalio_config.jpg" title="Externalio_config.jpg" alt="Externalio_config.jpg" width="800" />

-   **External Input Channel Selection** - Включение/отключение внешнего входного канала

<!-- -->

-   **Source Base CanID** - 11-битный HEX CanID устройства, из которого должны быть получены данные.

Пример: На рисунке это значение равно 0x200, что было адресом Speeduino Base Can, установленным в "конфигурации устройства"

-   **Data from outchannel** - Номер исходящего канала (из исходящих каналов в реальном времени), данные НАЧИНАЮТСЯ в.

Если доступ к устройству осуществляется через CANBUS, то это смещение, добавленное к базовому адресу + 1 EG: на рисунке 7, это даст Can-адрес 0x208 или если прямое соединение со Speeduino собирает данные из внешнего канала 7 (tpsADC)

-   **no: of bytes** - Количество байтов, которое имеют данные, выберите 1 или 2 (значение 1 байта имеет диапазон от 0 до 254, 2 байта от 0 до 1024).

Пример: На снимке видно 1. Это происходит из-за того, что внешний канал 7 (tpsADC) имеет длину всего 1 байт со значением от 0 до 254.

### Страница тестирования аппаратных средств Hardware Test Page

Чтобы увидеть этот параметр, необходимо включить его в свойствах проекта

<img src="Project_properties_select.jpg" title="Project_properties_select.jpg" alt="Project_properties_select.jpg" width="800" />

<img src="Project_properties_gpio.jpg" title="Project_properties_gpio.jpg" alt="Project_properties_gpio.jpg" width="800" />

Затем на главном тире появится новая вкладка

<img src="Hardware_test_tab_gpio.jpg" title="Hardware_test_tab_gpio.jpg" alt="Hardware_test_tab_gpio.jpg" width="800" />

#### Аппаратное обеспечение тестового вывода Test Output Hardware

Это позволит по отдельности включать/отключать доступные выходные порты. Доступность зависит от выбранной платы и конфигурации контактов. Для запуска тестирования нажмите кнопку "Enable test mode". Выходные порты, которые могут быть протестированы, будут не серыми и могут быть включены/выключены. После тестирования нажмите кнопку "Stop test mode" или просто закройте окно. Все активированные выходы будут отключены.

<img src="Hardware_output_test.jpg" title="Hardware_output_test.jpg" alt="Hardware_output_test.jpg" width="800" />

### Создание новых компоновок плат/конфигураций контактов Creating new board layouts/pin configurations

В GPIO можно легко добавлять новые типы плат. Требуется внести изменения в два файла, "Utils.ino" и файл "Tunerstudio.ini"

#### Utils.ino
В файле utils.ino представлены отдельные конфигурации для каждой опции платы НАПРИМЕР:

`     #if defined(CORE_AVR)`
`     case 1: // mega2560 demo V0.001`
`     pinOut[1] = 2; //`
`     pinOut[2] = 3; //`
`     pinOut[3] = 4; //`
`     pinOut[4] = 5; //`
`     pinOut[5] = 255; //`
`     pinOut[6] = 255; //`
`     pinOut[7] = 255; //`
`     pinOut[8] = 255; //`
`     pinOut[9] = 255; //`
`     pinOut[10] = 255; //`
`     pinOut[11] = 255; //`
`     pinOut[12] = 255; //`
`     pinOut[13] = 13; //`
`     pinOut[14] = 255; //`
`     pinOut[15] = 255; //`
`     pinOut[16] = 255; //`

`     pinIn[1] = 6;`
`     pinIn[2] = 7;`
`     pinIn[3] = 8;`
`     pinIn[4] = 9;`
`     pinIn[5] = 255;`
`     pinIn[6] = 255;`
`     pinIn[7] = 255;`
`     pinIn[8] = 255;`
`     pinIn[9] = 255;`
`     pinIn[10] = 255;`
`     pinIn[11] = 255;`
`     pinIn[12] = 255;`
`     pinIn[13] = 255;`
`     pinIn[14] = 255;`
`     pinIn[15] = 255;`
`     pinIn[16] = 255;`
`            `
`     pinAin[1] = A0;`
`     pinAin[2] = A1;`
`     pinAin[3] = A2;`
`     pinAin[4] = A3;`
`     pinAin[5] = A4;`
`     pinAin[6] = A5;`
`     pinAin[7] = A6;`
`     pinAin[8] = A7;`
`     pinAin[9] = A8;`
`     pinAin[10] = A9;`
`     pinAin[11] = A10;`
`     pinAin[12] = A11;`
`     pinAin[13] = A12;`
`     pinAin[14] = A13;`
`     pinAin[15] = A14;`
`     pinAin[16] = A15;`
`     `
`     break;`
`     #endif `

Это запись для позиции 1 платы STD mega2560.

Для добавления новой платы создайте новый корпус со всеми вышеуказанными контактами. Убедитесь, что вы изменили определение MCU, если он не является mega2560, на MCU, с которым вы компилируете (в настоящее время поддерживается только mega2560). Все неиспользуемые контакты должны иметь значение 255. EG: добавление новой записи под названием "mynewboard" в позицию 6.

`     #if defined(CORE_AVR)`
`     case 6: // mynewboard`
`     pinOut[1] = 2; //`
`     pinOut[2] = 3; //`
`     pinOut[3] = 255; //`
`     pinOut[4] = 5; //`
`     pinOut[5] = 255; //`
`     pinOut[6] = 255; //`
`     pinOut[7] = 255; //`
`     pinOut[8] = 255; //`
`     pinOut[9] = 255; //`
`     pinOut[10] = 4; //`
`     pinOut[11] = 255; //`
`     pinOut[12] = 255; //`
`     pinOut[13] = 13; //`
`     pinOut[14] = 255; //`
`     pinOut[15] = 255; //`
`     pinOut[16] = 255; //`

`     pinIn[1] = 6;`
`     pinIn[2] = 7;`
`     pinIn[3] = 8;`
`     pinIn[4] = 255;`
`     pinIn[5] = 255;`
`     pinIn[6] = 255;`
`     pinIn[7] = 255;`
`     pinIn[8] = 255;`
`     pinIn[9] = 255;`
`     pinIn[10] = 9;`
`     pinIn[11] = 255;`
`     pinIn[12] = 255;`
`     pinIn[13] = 255;`
`     pinIn[14] = 255;`
`     pinIn[15] = 255;`
`     pinIn[16] = 255;`
`            `
`     pinAin[1] = A0;`
`     pinAin[2] = A1;`
`     pinAin[3] = A2;`
`     pinAin[4] = A11;`
`     pinAin[5] = A4;`
`     pinAin[6] = A7;`
`     pinAin[7] = A6;`
`     pinAin[8] = 255;`
`     pinAin[9] = A8;`
`     pinAin[10] = 255;`
`     pinAin[11] = A10;`
`     pinAin[12] = 255;`
`     pinAin[13] = 255;`
`     pinAin[14] = 255;`
`     pinAin[15] = A14;`
`     pinAin[16] = A15;`
`     `
`     break;`
`     #endif `

`Добавить, что в соответствующем пространстве то есть между 5 и 7 (в них существуют или в конце опции, если нет).`

Сохранение и повторная загрузка файла в GPIO. Убедитесь, что используемое положение соответствует положению, которое в ini-файле моды видят далее.

#### Файл Tunerstudio ini
Находится в "reference" в папке загрузки микропрограммного обеспечения. Не используйте блокнот MS для редактирования этого файла!! Хороший редактор - Notepad++ несколько загрузок программного обеспечения.

`#define PIN_LAYOUT = "ProMini GPIO v0.002", "Mega2560 GPIO v0.003", "STM32 BluePill GPIO V0.003", "Speeduino v0.3", "Speeduino v0.4", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID"  `

Чтобы добавить новую запись, просто удалите одну из "INVALID" и замените на имя платы НАПРИМЕР: измененный файл, добавляющий новую плату с именем "mynewboard"

`#define PIN_LAYOUT = "ProMini GPIO v0.002", "Mega2560 GPIO v0.003", "STM32 BluePill GPIO V0.003", "Speeduino v0.3", "Speeduino v0.4", "INVALID", "mynewboard", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID" `

Это показывает, что новая запись является позицией 6 (promini - позиция 0). Конфигурационный элемент платы должен находиться в положении 6 в утилите. Когда вы сохраните измененный файл и перезагрузите его в Tunerstudio, новая плата появится в качестве опции.