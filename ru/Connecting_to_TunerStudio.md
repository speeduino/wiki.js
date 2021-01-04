---
title: Подключение к TunerStudio
description: How to create and connect to your ECU within TunerStudio
published: true
date: 2021-01-04T17:02:49.967Z
tags: 
editor: markdown
dateCreated: 2021-01-04T16:44:00.758Z
---

# Подключение к Tuner Studio

Tuner Studio программное обеспечение интерфейса настройки, используемое Speeduino. Он работает под управлением Windows, Mac и Linux и предоставляет возможности настройки, настройки и ведения журнала.

Как только прошивка будет скомпилирована и загружена в Arduino, вы будете готовы к настройке Tuner Studio in order to configure and monitor it. If you haven't yet compiled and uploaded the firmware, refer to the [Installing Firmware](/Installing_Firmware) page.

## Загрузка Tuner Studio

Если вы еще не сделали этого, возьмите копию Tuner Studio из: http://www.tunerstudio.com/index.php/downloads
Tuner Studio доступен для Windows, Mac и Linux и будет работать на большинстве ПК, так как требования к системе довольно низкие.

Текущая минимальная версия TunerStudio - 3.0.7, но рекомендуется последняя версия.

Если вы найдете Tuner Studio to be useful, пожалуйста, рассмотрите возможность оплаты лицензии. Это фантастическая программа от единого разработчика, которая соперничает с лучшим в мире ПО для тюнинга, платная версия имеет множество полезных особенностей.

## Настройка вашего проекта

### Создать новый проект Create new project

При первом запуске TunerStudio, вам будет нужен к установке новый проект, который содержит параметры настройки, регистрации и т.д. На экране запуска выберите 'Create new project'

![TS_1.png](/img/TunerStudio/TS_1.png){.align-center width=450}

Присвойте проекту имя и выберите каталог, в котором будет храниться проект. Tuner Studio для связи с arduino требуется файл определения прошивки. Отметьте 'Other / Browse'

![TS_2.png](/img/TunerStudio/TS_2.png){.align-center width=400}

Затем перейдите в исходный каталог Speeduino, введите справочную подпапку и выберите файл speeduino.ini

![TS_3.png](/img/TunerStudio/TS_3.png){.align-center width=400}

### Параметры конфигурации Configuration options

Обратиться к [Configuring TunerStudio project options](/Configuring_TunerStudio) странице для этого

### Параметры связи Comms settings

Выберите параметры соединений. Точное имя порта будет зависеть от используемой операционной системы и будет таким же, как в среде IDE Arduino. Скорость передачи должна быть 115200.

![Comms Settings](/img/TunerStudio/TS_comms_settings.png){.align-center width=400}

> **Примечание:** `Detect` и `Test port` опции требуют Tuner Studio версию 3.0.60 или выше для правильной работы
{.is-info}


### Загрузить базовый файл настроек Load base tune

После создания проекта необходимо загрузить в него базовый файл настроек, чтобы все значения были хотя бы несколько разумными. Неспособность сделать это может привести к очень странным проблемам в вашем файл настроек.

![TS_6.png](/img/TunerStudio/TS_6.png){.align-center width=400}

В Speeduino reference папке, вы найдете базовый файл настроек для открытия:

![TS_7.png](/img/TunerStudio/TS_7.png){.align-center width=400}

И все! Tuner Studio теперь следует попытаться подключиться к Arduino и отобразить отображение ЭБУ в реальном времени.