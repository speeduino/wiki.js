---
title: Прокрутка при запуске - Cranking
description: 
published: true
date: 2021-01-04T17:08:47.797Z
tags: 
editor: undefined
dateCreated: 2021-01-02T04:23:28.580Z
---

Обзор
--------

Условия прокрутки во время запуска обычно требуют многократной регулировки управления топливом и зажиганием для обеспечения плавного и быстрого запуска. Настройки в этом диалоговом окне определяют, когда Speeduino будет рассматривать двигатель в состоянии прокрутки/запуска и какие регулировки должны быть применены в течение этого времени.

Настройки
--------


![cranking.png](/img/warmup/cranking.png){.align-center width=450}

-   **Cranking RPM** - При этом устанавливается пороговое значение для того, будет ли Speeduino устанавливать свой статус "прокрутка" или "запуск". Любая частота вращения выше 0 и ниже этого значения будет считаться прокруткой, и будут применены все регулировки, связанные с прокруткой. Как правило, лучше всего установить, чтобы это было около 100 об/мин выше, чем ваша обычная скорость прокрутки, чтобы учесть всплески и обеспечить более плавный переход к нормальному холостому ходу
-   **Flood Clear level** - Очистка от перелива используется для удаления избыточного топлива, поступившего в цилиндры. В то время как очистка от перелива активна, все события, связанные с топливом и зажиганием, будут остановлены, и двигатель может быть выключен на несколько секунд без риска запуска или дальнейшего перелива топлива. Для сброса потока обороты должны быть **ниже** чем указанная настройка частоты вращения прокрутки и ДПДЗ (TPS) должен быть **больше** порогового значения этого параметра
-   **Fuel pump prime duration** - При первом включении питания Speeduino выход топливного насоса будет включаться в течение этого количества секунд для создания давления в топливной системе. Если двигатель будет запущен за это время, насос будет просто продолжать работать, в противном случае он будет выключен по истечении этого периода времени. Если у вас есть подключение USB, Speeduino остается включенным даже без сигнала 12 В.
-   **Priming Pulsewidth** - При включении питания Speeduino будет запускать все инжекторы в течение этого периода времени. Этот импульс НЕ предназначен для пусковой топливной нагрузки, а предназначен для удаления воздуха, который мог попасть в топливопроводы. Он должен быть коротким, чтобы избежать перелива двигателя топливом.
-   **Cranking enrichment** - При активной прокрутке (см. выше "Частота вращения прокрутки") нагрузка на топливо будет увеличена на эту величину. Следует отметить, что в качестве стандартного значения коррекции это пополнение при прокрутке **является дополнением** к любым другим корректировкам, которые в настоящее время активны. Это включает обогащение прогревом и т.д.
-   **Cranking Bypass** - Этот вариант предназначен специально для систем зажигания, которые имеют аппаратный вариант зажигания прокрутки. Эти системы использовались на протяжении 80-х и начала 90-х годов и позволяли фиксировать опору зажигания и управлять ею самой системой зажигания, когда она активна (через входной провод). С помощью этой опции можно указать выходной вывод, который будет установлен как HIGH при прокрутке системы. Указанный номер контакта - это номер контакта ARDUINO.
-   **Fix cranking timing with trigger** - Некоторые (обычно с низким разрешением) триггерные схемы предназначены для совмещения одного из их импульсов с желаемым опережением прокрутки. Обычно это 5 или 10 градусов BTDC. Если этот параметр включен, Speeduino будет ждать этого синхронизированного входного импульса перед запуском соответствующего выходного сигнала зажигания (коэффициент запаса при задержке по-прежнему применяется, если этот импульс не обнаружен). Эта опция доступна только в том случае, если выбран шаблон триггера, поддерживающий эту функцию (Смотри [Trigger Setup](/configuration/Trigger_Setup "wikilink"))
