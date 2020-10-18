---
title: Schéma allumage
description: Schéma allumage
published: true
date: 2020-10-18T01:44:32.151Z
tags: 
editor: markdown
dateCreated: 2020-10-18T01:44:32.151Z
---

# Câblage allumage
## Survol
Les câble de l'allumage peut être l'une des partie les plus difficile du câblage de Speeduino. C'est aussi l'une de celle qui porte le plus à confusion. Une grande partie de cette complexité provient du grand nombre de type d'allumage disponible. Plusieurs changements sont survenus dans les années 80 et 90 ce qui a mené aux nouveaux designs.

Même si ce guide ne couvre pas tous les type d'allumage ni tous les type de matériel, il couvre quand même la plupart des scénarios. Généralement (quand possible) l'utilisation du nouveau type de bobines (tel que 'smart' Coil-on-Plug ou Coil-Near-Plug)est recommandé versus les module d'allumage.

## Allumage perdue (Wasted Spark)
L'allumage perdu est une façon courante qui requiert seulement la moitié du nombre de sortie d'allumage que de nombre de cylindres. Ex:
* Moteur 4 cylindres ont besoin de 2 sorties d'allumage
* Moteur 6 cylindres ont besoin de 3 sorties d'allumage
* Moteur 8 cylindres ont besoin de 4 sorties d'allumage

L'allumage perdue a comme avantage de ne pas avoir besoin d'un signal d'arbre à cames car il n'est pas nécessaire de savoir dans quelle phase le moteur est actuellement. Ceci est possible car le feu se fait que le moteur soit en compression ou en expulsion. 

Quand on utilise l'allumage perdue, il est impératif que les paires correspondantes (modules et ou bougies) soient câblées ensemble. 

Il y a plusieurs modules à doubles pôles qui sont disponibles avec ou sans modules d'allumage intégrées. Les deux sont compatibles avec Speeduino mais l'utilisation d'un module avec module d'allumage intégré est recommandé.
![ign_4Cyl_COP_wasted-spark.png](/img/wiring/ign_4Cyl_COP_wasted-spark.png){.align-center width=500}

> Note: L'exemple ci-haut utilise des 'smart coils' avec un module d'allumage intégré. NE JAMAIS brancher des dumb COPs (2 fils) sans l'ajout d'un module d'allumage externe.
{.is-warning}

### Coil on Plug 
Une alternative au double pôles à allumage perdue, des bobines individuelles peuvent être installées dans le mode d'allumage perdue.

![ign_4Cyl_COP_wasted-spark.png](/img/wiring/ign_4Cyl_COP_wasted-COP.png){.align-center width=500}

> Note: L'exemple ci-haut utilise des 'smart coils' avec un module d'allumage intégré. NE JAMAIS brancher des dumb COPs (2 fils) sans l'ajout d'un module d'allumage externe.
{.is-warning}


## Séquentiel (COPs)
L'allumage séquentiel utilise des bobines de type Coil-on-Plugs qui simplifient dramatiquement le câblage. Avec cette configuration, chaque bobine (donc chaque cylindre) connecte à une seule sortie d'allumage du Speeduino selon l'ordre de feu. 


![ign_4Cyl_COP_seq.png](/img/wiring/ign_4Cyl_COP_seq.png){.align-center width=500}

> Note: L'exemple ci-haut utilise des 'smart coils' avec un module d'allumage intégré. NE JAMAIS brancher des dumb COPs (2 fils) sans l'ajout d'un module d'allumage externe.
{.is-warning}

## Distributeur
Si un distributeur reste en fonction, seulement une simple sortie est nécessaire depuis le Speeduino. Celle-ci devra être branchée sur un module d'allumage simple canal qui lui alimentera l'allumage (tel le module commun Bosch 124). 
![ign_Basic-distributor.png](/img/wiring/ign_Basic-distributor.png){.align-center width=500}