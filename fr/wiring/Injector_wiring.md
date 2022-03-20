---
title: schéma injecteur
description: schéma injecteur
published: true
date: 2020-10-18T01:16:58.333Z
tags: 
editor: undefined
dateCreated: 2020-10-18T01:16:52.303Z
---

# Schéma des injecteurs
## Survol
Speeduino comporte 4 circuits de contrôle d'injecteurs et il est  possible de supporter jusqu'a 8 injecteurs (et cylindres) avec ceux-ci.

## Injecteurs supportés 
Speeduino supporte les injecteurs de type 'High-Z' (aka 'haute-impédance' ou 'saturés') nativement. Les injecteurs Low-Z sont  supportés avec l'ajout de résistances câblés en série avec les cables des signaux. Les injecteurs 'High-Z' sont typiquement ceux avec une résistance plus grande que 8 Ohms.

Si des injecteurs "Low-Z" ("peak et hold" ou PWM-controlled) qui ont une impédance plus basse sont utilisés, le câblage devra comporter des résistances câblées en série pour éviter d'endommager le plaque suite à un courant excessif. La résistance et le wattage peuvent être calculés grâce à la loi d'Ohm ou avec l'utilisation d'un calculateur comme celui-ci:  [Calculateur de résistance Speeduino](http://efistuff.orgfree.com/InjectorResistorCalculator.html).

## Disposition
Il y a un nombre de façons que les injecteurs peuvent être branchés... ceci dépend de votre préférence et ou votre configuration. 

### 1, 2 et 3 injecteurs

Pour ces configurations, chaque injecteur est branché sur sa propre sortie sur la plaque.

### 4 injecteurs

Pour 4 cylindres/injecteurs, il y a 2 façons qu'ils peuvent être branchés sur le Speeduino:

#### Méthode 1 (en paires)

La méthode standard est la même pour 6 et 8 cylindres, où 2 injecteurs sont branchés à chaque canal d'injection. Dans cette configuration, seulement deux canaux sont utilisés. La paire d'injecteur doit avoir le point haut mort (TDC) avec 360 degrés de différence.

![inj_4Cyl_semi-seq.png](/img/wiring/inj_4Cyl_semi-seq.png){.align-center width=450}

#### Méthode 2 (Séquentiel complet)

Cette méthode est seulement disponible avec des applications 4 cylindres / 4 injecteurs et vous permet de prendre un canal par injecteur. Les canaux d'injection font toujours feu dans l'ordre numérique (ex 1, 2, 3, 4) donc vos injecteurs doivent être branchés selon VOTRE ordre de feu. Dans Tuner Studio, cette option peut être changée en sélectionnant:

`Settings -> Engine Constants -> Injector Timing -> Sequential`

![inj_4Cyl_seq.png](/img/wiring/inj_4Cyl_seq.png){.align-center width=450}

> **Note:** L'utilisation du mode séquentiel demande un signal d'arbre à cames compatible en plus du signal du vilebrequin. Si aucun signal d'arbre à cames n'est fournit, le système ne pourra pas se synchroniser.
{.is-warning}


### 5 injecteurs

Les montage de 5 cylindres devraient être câblés les 4 canaux d'injection en plus d'une paire qui partage un canal. Le \#3. Pour l'ordre de feu typique d'un 5 cylindres en ligne (1-2-4-5-3), les injecteurs 4 et 3 seraient câblés ensemble sur la sortie numéro 3.

### Plus de 5 injecteurs

Pour les cas avec plus de 4 injecteurs, le nombre de sorties utilisées sera égal à la moitié du nombre d'injecteurs.

#### 6 Cylindres
![inj_6Cyl_semi-seq.png](/img/wiring/inj_6Cyl_semi-seq.png){.align-center width=450}

Pour un V6 avec un ordre de feu de (1,4,2,5,3,6) les injecteurs seront câblés en trois groupes. (1,5), (4,3) et (2,6) car ces cylindres ont des angles de feu qui sont séparés par 360 degrés. 

#### 8 Cylindres
![inj_8Cyl_semi-seq.png](/img/wiring/inj_8Cyl_semi-seq.png){.align-center width=450}

Suivant ce qui a été écrit plus haut, cette configuration demande que chaque sortie d'injection soit câblée à deux injecteurs.
Les injecteurs doivent être groupés en paires opposées. Donc avec un injecteur qui a un ordre de feu qui est séparé de 360 degrés!