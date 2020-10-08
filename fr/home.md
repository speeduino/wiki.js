---
title: Home
description: 
published: true
date: 2020-10-08T04:06:27.577Z
tags: 
editor: markdown
dateCreated: 2020-10-08T04:06:27.577Z
---

# Introduction
Ce manuel couvre le matériel (capteurs, câblage, etc.), la configuration logicielle et les éléments de réglage liés au fonctionnement d'une unité Speeduino. Lorsque vous commencez avec Speeduino, en particulier si c'est la première fois que vous installez et configurez un système de gestion de moteur, ce manuel vous aidera à comprendre les capacités de Speeduino et comment il doit être installé, à la fois en termes de matériel et de logiciel / micrologiciel.

Bien que ce document puisse aider à fournir des informations relatives à la configuration de Speeduino, il ne couvre pas le réglage avancé du moteur, les stratégies de carburant / d'allumage, etc. .

### Commencer

Pour débuter avec Speeduino, cela peut aider à comprendre les différents composants qui composent le système:

1. **Une carte Speeduino** - C'est le muscle de l'ECU Speeduino et contient tous les pilotes et circuits IO. C'est peut-être l'une des cartes génériques (comme la v0.4) ou une carte PNP pour un modèle de voiture spécifique
2. **Un Arduino** - C'est le cerveau de Speeduino et contient le processeur, la mémoire et le stockage. Il se branche sur la carte Speeduino afin de s'interfacer avec le câblage du véhicule. Généralement un Arduino Mega 2560.
3. **Firmware** - Il s'agit du logiciel système qui s'exécute sur la carte Arduino et alimente son fonctionnement. Un nouveau firmware est publié régulièrement avec des mises à jour, des améliorations de performances et des corrections de bogues.

Comme point de départ, il est généralement recommandé de télécharger d'abord le micrologiciel sur votre Arduino et de le connecter au logiciel de réglage (Tuner Studio) avant de passer à l'assemblage matériel ou au câblage, etc. L'installation et la configuration du logiciel sur Speeduino peuvent être effectuées sans le besoin de tout matériel supplémentaire (au-delà de l'arduino lui-même) et cela permet d'explorer les logiciels et les options disponibles avant soit une dépense de fonds importants, soit un investissement de temps important.

Plus de détails sur les exigences matérielles et les fonctionnalités spécifiques de Verson peuvent être trouvés sur la page de mise en route. (https://wiki.speeduino.com/en/Getting_Started)

### À propos de ce manuel

En tant que projet open source, cette documentation ne cesse de croître et cela signifie que vous pouvez rencontrer des lacunes dans la documentation où peu d'informations sont actuellement fournies. N'hésitez pas à poster sur le forum s'il manque quelque chose dont vous avez besoin de manière critique (ou même pas si critique).

De plus, si vous souhaitez contribuer à la documentation Speeduino, nous serions ravis de vous entendre! La méthode préférée pour demander l'accès au wiki est soit via Slack (https://speeduino.com/forum/app.php/page/slack)