---
title: Реперный диск Субару Subaru 36-2-2-2
description: 
published: true
date: 2021-01-04T18:14:44.645Z
tags: 
editor: undefined
dateCreated: 2021-01-02T06:58:37.737Z
---

## Реперный диск Субару Subaru 36-2-2-2

Колесо 36-2-2-2 распространено на многих 4 цилиндровых двигателях Subaru с 2000 и далее. Оно использует колесо коленвала, содержащее номинальные 36 зубьев, отстоящих друг от друга на 10 градусов кривошипа и 3 группы из 2 отсутствующих зубьев. Эти недостающие группы зубьев позволяют определять синхронизацию в пределах не более 1/2 поворота кривошипа.

Ранние колеса приводились в действие VR, однако после переключения на изменяемые фазы газораспределения Subaru переключилась на датчики Холла. Большинство конфигураций спарены с одним или двумя 4-1 кулачковыми датчиками, однако они не требуются для синхронизации на Speeduino.

### Шаблон реперного диска Trigger Pattern
3 набора из 2 отсутствующих зубов расположены таким образом, что одна группа расположена сама по себе, а две другие расположены рядом друг с другом, между которыми расположен один зуб. Синхронизацию можно определить, обнаружив отсутствующие 2 зуба, а затем увидев, есть ли другой набор отсутствующих зубов сразу после него.

Сжатие ВМТ в цилиндре 1 происходит на четвертом зубе после одиночного зазора. Speeduino наблюдает за любым отсутствующим периодом зуба, затем ждет, чтобы подтвердить, следует ли за ним другой. Поэтому синхронизация может быть определена таким образом в 2 точках при одном вращении кривошипа.

![36-2-2-2.png](/img/decoders/36-2-2-2.png){.align-center width=90%}

**Примечание:** Многие диаграммы и изображения триггерных колес, доступные в Интернете, показывают колесо с задней стороны, что делает его вращающимся против часовой стрелки. Для правильной ориентации при взгляде на переднюю часть двигателя колесо крутится по часовой стрелке.