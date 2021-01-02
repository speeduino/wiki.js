---
title: Аппаратные Требования
description: 
published: true
date: 2021-01-02T09:06:30.478Z
tags: 
editor: markdown
dateCreated: 2021-01-02T07:58:44.060Z
---

# Обзор Аппаратных Требований
На этой странице представлены основные требования к аппаратному обеспечению системы Speeduino, а также некоторые возможные варианты. Здесь не описаны все возможные варианты, но информации достаточно для начального ознакомления. 

Arduino
-------

В качестве основного контроллера Speeduino использует R3 Arduino Mega 2560. Все официальные платы Arduino Mega 2560 и их копии будут работать нормально, но рекомендуется использовать платы, которая имеет последовательный интерфейс 16u2, а не более дешевый CH340. Какой чип используется платой, как правило, можно найти в списке информации/спецификации от большинства розничных продавцов, но если есть сомнения, спросите продавца, у которого вы хотите купить.

Входные сигналы
------

### Датчик Коленвала/ Датчик Распредвала
Это самые важные датчики для правильной работы Speeduino. Сигнал, поступающий на Arduino, должен представлять собой серию импульсов в виде квадратной волны 0v-5v (показана ниже), представляющих зубья на колесе, работающем со скоростью коленвала (или распредвала). Многие датчики Холла и "opto" датчики выдают подобный сигнал. Если используется только реперный диск коленчатого вала (без репера распредвала), реперный диск коленвала должен иметь "отсутствующий" зуб, чтобы обеспечить информацию о угловом положении, а также об оборотах двигателя. Самые испытанные в настоящее время реперные диски имеют варианты 4-1, 12-1, 36-1 и 60-2.

Для получения информации вариантах синхросигналов см. [Trigger Patterns and Decoders](/decoders) страницу.

Как альтернатива (необходимо для полного последовательного впрыска) добавляется сигнал распредвала. Это обозначается дополнительно значением "/x ", например 60-2/1, для 60-зубчого репера с 2 отсутствующими зубьями и 1-сигналом распредвала за цикл.

Также могут использоваться датчики VR (переменного сопротивления), однако, поскольку плата не содержит какого-либо формирователя сигнала для преобразования синусоидальной волны (ниже) в требуемую квадратную волну, потребуется дополнительный модуль. 8-контактный DIP-разъем расположен на официальных платах серий v0.3.x и v0.4.x для этой цели, как IC3. Микросхема MAX9926 была протестирована для работы с большинством типов входных сигналов и доступна в [Speeduino Store](https://speeduino.com/shop/index.php?id_product=17&controller=product), однако любой аналогичный модуль, который выводит квадратную волну 0v-5v (LM1815, LM358, SSC/DSC, множество OEM-модулей и т.д.), также должен хорошо работать с сигналами датчиков VR.

![vr_wave.gif](/img/vr/vr_wave.gif =400x){.align-center}

Рекомендуется принимать меры предосторожности при монтаже и выборе провода для датчиков коленчатого вала и распределительного вала. Максимальное удаление от электрически шумных компонентов, таких как генератор переменного тока, и свечей зажигания может помочь. Использование экранированного кабеля также может помочь (привязать экран только к стороне ECU). Можно использовать программную фильтрацию, но ничто не передает чистый сигнал от источника. 

Если сигнал кривошипа/кулачка потерян и опции EMI/фильтрации исчерпаны, убедитесь, что соединения + 12 В и GND платы Speeduino также свободны от шума. Шум на главной шине питания может вызывать помехи.

### Датчик положения дросселя

Датчик положения дросселя (TPS) должен быть трехпроводным потенциометрическим, а не двухпроводным выключателем, установленных на некоторых дросселях. Если ваш TPS является датчиком 3 провода, то он, скорее всего, будет работать, однако вам нужно будет подтвердить, что это датчик потенциометрического (переменного) типа.

При использовании TPS с неизвестными соединениями; рекомендуется протестировать TPS с помощью измерителя сопротивления для каждого контакта без риска повреждения путем случайного применения мощности датчика. Это может быть выполнено на стенде или при выключенном двигателе и отключенном TPS:

-   Назначте букву каждому контакту.
-   Подсоедините измеритель сопротивления к 2 контактам и поворачивайте дроссель с закрытого (холостого) на широко открытый (WOT), зафиксировав результаты..
-   Найдите пару контактов, сопротивление которых существенно не изменяется с холостого хода на WOT. Это два контакта питания.
-   Оставшиеся контакты являются **Сигнал**.
-   Для определения контакта питания **V+** и земли **GND**, измерьте сопротивление контакта **Сигнал** и одним контактом питания.
-   В положении закрытия; если сопротивление мало то этот контакт питания **Земля**. Если велико, то это контакт **V+**.

Большинство используемых датчиков TPS имеют 3 контакта. Если TPS имеет различное количество контактов, то, ссылаясь на исходную схему подключения двигателя, эта функция может быть отображена, может ли она использоваться или какие контакты использовать для Speeduino. Для датчиков TP, которые работают "назад", и провода не могут быть изменены, простая модификация кода доступна на [Forums](https://speeduino.com/forum/viewtopic.php?f=19&t=1159#p18146) для использования этого типа TPS.

### Датчик давления во впускном тракте MAP 

Рекомендуемый датчик MAP является MPX4250 от Freescale, однако многие датчики MAP поддерживаются. Если вы хотите использовать тот, который не включен в список (Under Tools-&gt;Map Calibration in TunerStudio), сделайте новую ветку на форуме, запросив это. Другие датчики могут и будут работать просто хорошо, но вам нужно будет откалибровать их в TunerStudio по другому набору значений.

### Температурные датчики ( Охл. жидкость (CLT) и температура во впускном тракте (IAT) )

Для этих температурных функций можно использовать любой стандартный двухпроводной термисторный датчик. Датчики имеют 1 сторону, соединенную с землей (предпочтительно от ЭБУ), а другая сторона соединена к сигнальной линии. Эти датчики не имеют полярности, поэтому ориентация этих проводов не имеет значения.

Детали см. [Sensor Calibration - Калибровка Датчиков](/configuration/Sensor_Calibration) page

### Датчики кислорода в выхлопных газах (O2 и WBO2)

Тип датчика кислорода O2 (узко или широкополосный) должен быть выбран в TunerStudio в *Tools &gt; Calibrate AFR Table*.

#### Узко-полосные

Сигналы датчиков NBO2 считываются непосредственно Speeduino. TunerStudio автоматически применяет стандартные нелинейные значения от 0 вольт до 1 вольт для всех стандартных датчиков NBO2 при калибровке. После калибровки Speeduino будет использовать назначенный NBO2 для регулировки соотношения воздух-топливо в соответствии с записями в таблице AFR (*Tuning &gt; AFR Table*),и датчик выбран для типа и параметров (или отключен) в *Tuning &gt; AFR/O2*. Следует отметить, что узкополосные датчики изначально были спроектированы для поддержания на стехиометрических AFR (Lambda 1.0) для эффективного каталитического контроля выбросов и, как правило, не являются достаточно точными или подходящими для настройки максимальной экономичности или высокой мощности. Хотя и не рекомендуется; имеются соответствующие методы настройки, позволяющие осуществлять ограниченную и приблизительную настройку с использованием датчика NBO2.

#### Широко-полосные

Широкополосные кислородные (WBO2) датчики могут обнаруживать и сообщать о более широком диапазоне лямбда (ƛ) или АФР, чем узкополосные, и с большей точностью, примерно от 10:1 до 20:1 (примерно от 0,7 до 1,3 лямбда), в зависимости от конкретной версии датчика и контроллера. Speeduino не может использовать WBO2 датчики напрямую, требуя внешнего контроллера для обработки сигнала и применения управления нагревом датчика. Введите марку контроллера и модель из отображаемого списка. Если сигнал контроллера является общим 

После установки *Tools &gt; Calibrate AFR Sensor*, Speeduino может использовать назначенный WBO2 чтобы сообщать lambda/AFR в TunerStudio для прямых показаний. После выбора датчика по типу и параметрам *Tuning &gt; AFR/O2* он может корректировать значения на ходу в соответствии с записями, которые вы делаете в AFR таблице (*Tuning &gt; AFR Table*), и для автоматической настройки в TunerStudio, или MegaLogViewer в реальном времени или по логам. Параметры также включают опцию отключения. Хотя Speeduino может использовать WBO2 информацию значительной коррекции топлива; настоятельно предлагается не использовать его для компенсации плохой настройки.

### Специфичные входные данные

То что пользователи Speeduino нашли полезными для реализации определенных функций.

#### Датчик "Flex Fuel"

См [Flex Fuel](/configuration/Flex_Fuel) для получения подробной информации об аппаратных средствах и конфигурации гибких установок топлива.


#### 12V Входной Сигнал

Некоторые датчики положения выдают сигнал 12В. Чтобы исправить это и избежать повреждения Arduino, можно построить цепь, подобную той, что на диаграмме. Резистор R1 не всегда требуется, но гарантирует, что любой выход, который не является высоким, затянется на низкий уровень. Наряду с этой схемой используйте перемычку на Speeduino. Это позволит эффективно преобразовать сигнал 0v/12v в сигнал 0v/5v.
*Спасибо PSIG за информацию и диаграмму.*

#### GM 7 / 8 контактный модуль Дистрибутор

Модули GM 7/8 pin использовались в широком спектре двигателей GM от 4 цилиндра до V8s (малый и большой блок). Распределитель 8 контактов также широко использовался в морских применениях компаниями Indmar, Mercruiser и другими.

<center>
GM 7-контактный модуль   <img src="https://raw.githubusercontent.com/speeduino/wiki/master/hardware/GM_7-pin.png" title="Fig. 1 GM 7-pin module" width="400"/>

</center>

<center>
GM 8-контактный модуль зажигания   <img src="https://raw.githubusercontent.com/speeduino/wiki/master/hardware/GM_8-pin.png" title="Fig. 2 GM 8-pin module" width="370"/>

</center>

Модули с 7 и 8 контактами функционально эквивалентны и в значительной степени имеют одинаковую проводку. Штифт 7 используется в больших распределителях катушки в крышке, в то время как штифт 8 используется в распределителях малой крышки с дистанционно установленными катушками. Контакт 8 имеет один дополнительный вывод, который обеспечивает заземление датчика. Оба модуля обеспечивают заземление змеевика через металлические решетки, используемые для крепления их к распределителю.

Эти модули обеспечивают простое средство для управляемой компьютером синхронизации при удержании распределителя. Они были разработаны для использования с двигателями впрыска корпуса дросселя и впрыска через порт и обеспечивают автоматическое ограничение тока катушки (7,5 ампер был спецификацией GM) и автоматическое управление задержкой. Устройство может быть приспособлено для других распределительных применений, в которых используются датчики либо переменного типа, либо типа холла.

##### Описание контактов

• "**+**" : Напряжение батареи от коммутируемого источника зажигания. Обеспечивает питание для работы модуля.

• "**C-**" : Отрицательное соединение катушки зажигания.

• "**P & N**" : Positive and Negative of the distributor reluctor. Polarity is important. GM distributor connectors can only be connected one way. For use with other distributors, verify polarity of the reluctor leads.

• "**B**" : Ignition bypass. When cranking, grounding this line bypasses computer control of timing. The timing iscontrolled by the module only. This can be done using the Speeduino Cranking Bypass pin function (see below).

• "**R**" : Reference or tach signal. This outputs a 5 volt square wave that serves as the RPM1 input for the Speeduino. To use this, connect it to RPM1 and set JP2 to Hall and JP4 connected (ie, 5 volt pull up).

• "**E**" : Timing control signal. When pin B has 5 volts on it, the module allows Speeduino to control the timing using this pin. The output of Ign1 should be connected to this pin.

• "**G**": *(8 pin only)* Signal ground. Should be connected to the Speeduino sensor ground. (Module ground is provided through the metal mounting grommets)

A timing bypass circuit must be constructed to utilize the Speeduino ignition timing control. The small circuit below should be built in the proto area.

<center>
<img src="https://raw.githubusercontent.com/speeduino/wiki/master/ignition/GM7_pin_bypass.png" title="Fig. 3 Bypass circuit" width="40%"/>

</center>
In addition, the cranking bypass should be turned on and the bypass pin should be set to pin 3 in the Cranking Settings dialog (under Starting / Idle in TunerStudio):

<center>
<img src="https://raw.githubusercontent.com/speeduino/wiki/master/warmup/cranking_bypass.png" title="Fig. 4 Bypass settings" width="40%"/>

</center>
Trigger settings (under Starting / Trigger Setup in TunerStudio) should be as shown below. You will need to adjust the trigger angle to get correct timing. Instructions for this are in the wiki.

<center>
<img src="https://raw.githubusercontent.com/speeduino/wiki/master/ignition/GM7_pin_triggerSettings.PNG" title="Fig. 5 Trigger settings" width="35%"/>

</center>
Timing control is set in the Spark / Spark Settings dialog:

<center>
<img src="https://raw.githubusercontent.com/speeduino/wiki/master/ignition/GM7_pin_sparkSettings.png" title="Fig. 6 Spark settings" width="30%"/>

</center>
The module works well, however, some applications result in a noisy trigger signal. This shows as an unstable RPM (either at idle, or more frequently, at higher speeds). Trigger filtering may help, but a modification may be necessary to clean up the signal. The circuit below effectively cleans/filters the signal, allowing use with no trigger filtering by the Speeduino. It has been tested with single and 8-pole reluctors and modules from GM, Transpo and a no-name generic.

<center>
<img src="https://raw.githubusercontent.com/speeduino/wiki/master/ignition/GM7_pin_filter.png" title="Fig. 7 Filter circuit" width="40%"/>

</center>
*Many thanks to apollard for this outline information.*

Outputs
-------

### Injectors

Speeduino injector drivers use on/off (not PWM) control and are designed to work with "High-Z" injectors. This type of injectors are also known as "saturated" or "high-impedance" that use full battery voltage to control the injector open cycle, and generally the impedance is greater than about 8 Ohms. If you are running "Low-Z" ("peak and hold" or PWM-controlled) injectors that are lower impedance, you will need to install series resistors on these to avoid damaging the board with excessive current. The resistor ohms and watt rating can be calculated by Ohm's Law, or use an Internet calculator page such as the [Speeduino Injector Resistor Calculator](http://efistuff.orgfree.com/InjectorResistorCalculator.html).

Speeduino can drive up to 2 High-Z injectors per output channel.

The 0.4v boards have 2 pins per injector channel allowing each injector to be directly connected to the board without splicing in the harness. If the application has less than 4 injectors using any pin connected to the proper channel will work. 

### Coils

Current versions of the Speeduino use low-power output signals, designed to work with external small-signal ignition coil drivers, whether a separate type (module or ICM, igniter, IGBT, etc.), or built into the coil assembly ('smart' coils). This method permits Speeduino to have great flexibility to control most types of ignition systems. Attaching the Speeduino outputs directly to a traditional high current passive ("dumb" or 2-pin) ignition coil without an ignition coil driver WILL cause damage to your Arduino.

***How Speeduino controls ignition circuit power*** In prior history, the coil driver was a set of mechanical contact points ("points"), simply replaced today by an electronic version. The added coil driver can be anywhere from inside the Speeduino to inside the coil assembly; though near or in the coil reduces electrical noise.

In the example animated image below, the Speeduino ignition signal is normally low (near ground or 0V) while Speeduino calculates the time to the next coil firing. At the proper time, Speeduino switches the ignition output to high (near 5V or 12V selectable) in order to switch the coil driver (example IGBT) on, allowing current to flow through the coil to ground. This is called the 'dwell' period. During dwell an increasing energy field is generated around the ignition coil core and wire windings.

At the end of the dwell period and therefore at the proper time for spark; Speeduino switches the coil driver off, stopping current flow, which collapses the energy field to create high voltage and the resulting spark:

<img src="http://efistuff.orgfree.com/images/Speedy_Ignition_Sequence.gif" title="Fig. 1 Typical IDI Ignition" />

In TunerStudio, the setting for this example would be to fire the spark "*going low*". The dwell setting is highly variable depending on coil type, voltage levels, etc. Too little dwell will give weak or no spark and excess dwell will rapidly increase heat, possibly damaging any of the ignition components, but usually the ignition coil or coil driver.

The wasted-spark version is below to show how it is identical in operation, but with the high-voltage spark returning through the second spark plug to complete the circuit:

<img src="http://efistuff.orgfree.com/images/SpeedyIgnitionDiagramWASTED.jpg" title="Fig. 2 Typical ISI-WS Ignition" />

A good run down of 'smart' coil types can be found at: [<http://www.megamanual.com/seq/coils.htm>](http://www.megamanual.com/seq/coils.htm). There are many ignition modules available that Speeduino can use to control standard coils, or for smart coils you can generally use 4 or 5-pin types as these will always be logic level, although some 3-pin coils are also of this variety. GM LS1/2 coils are an example of powerful smart coils that are commonly used and can usually be obtained easily and cheaply.

*(Note: In the past, some ignition control modules with current limiting or dwell control features (e.g., 1970s GM HEI, Bosch '024' types, and Ford DS1) were referred-to as "smart" modules. While still true, common terminology of individual ignition coils with at least a driver integrated, or newer technology with greater controls (e.g., controlled spark duration or multi-spark) are all considered "smart" coils. You must know the control requirements of the specific drivers, control modules, or coils you intend to use in order to operate them properly with Speeduino.)*

### Aux Outputs

#### Low Current

Most Speeduino versions have low-current (LC) signal outputs directly from the MEGA processor to (usually) the prototyping (proto) area of the board. These outputs are generally not suited to control power devices directly in this form, and need suitable output circuits built on the proto area to enable their use. Alternatively, the output functions such as Fuel Pump or Fan are re-assignable to other pins and components, such as the existing high-current (HC) output MOSFETs - see "Medium Current" section below for more.

Some Speeduino versions include an 8-channel ULN2803A Darlington transistor array IC that is capable of switching up to 1/2 amp per channel. These auxiliary outputs are sufficient to switch small devices directly, or to switch power-handling devices, such as power MOSFETs or automotive relays. Configuration and settings of these outputs is described in the [Configuration](/Configuration_Index) section. Additional information for using a ULN2803A on v0.4-series boards may be found [here](https://speeduino.com/forum/viewtopic.php?f=19&t=1023&p=16588#p16588). Similar output options and pin assignments may be used on other board designs.

#### Medium Current

v0.3x and later boards include medium-power MOSFET auxiliary outputs to switch up to 3 amps directly. These are labeled "HC" in schematics and some references. These outputs are commonly used to operate idle valves, boost-control valves, VVT solenoids, etc., or to control relays for handling much larger loads, such as electric radiator fans. Configuration and settings of these outputs is described in the [Configuration](/Configuration_Index) section.

Auxilary IO
-----------

On Arduino Mega2560 based Speeduino boards (official or just running current firmware) git commit 13f80e7 support is available for the external connection of 8 16bit analog inputs via [Serial3](/Secondary_Serial_IO_interface)

CanBus
------

As the Arduino mega2560 has no CanBus interface a seperate "co-processor" interface has been designed. More information about this unit can be found here <https://github.com/Autohome2/Speeduino-can-interface>. This uses the functionality provided by the Serial3 port and connects via that port.

On the upcoming Teensy3.5 variant of Speeduino the CanBus code will be incorporated into the main system firmware as the Teensy3.5 has integrated CanBus and only requires a transceiver module added.

Third Party Addon's
-------------------

In This section you will find information about third party designed hardware designed to be used in conjunction with the Speeduino ECU

GPIO for Speeduino
------------------

There are several variants of the GPIO , The firmware can be downloaded here <https://github.com/Autohome2/Speeduino-GPIO>

More information [GPIO_for_Speeduino](/GPIO_for_Speeduino "wikilink")