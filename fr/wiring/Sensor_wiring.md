---
title: câblage capteurs
description: 
published: true
date: 2020-10-16T03:08:10.087Z
tags: wiring
editor: markdown
dateCreated: 2020-10-16T01:55:42.856Z
---

# Câblage des capteurs analogues
Les capteur analogues fournissent des données tel que température, position du papillon des gaz et du capteur d'oxygène à l'ordinateur 'Speeduino'. Le diagramme ci-dessous démontre un schéma de câblage typique pour ces capteurs.

![analog_sensors.png](/img/wiring/analog_sensors.png){.align-center width=500}

### Notes
* L'utilisation d'un capteur de température à 2 brins est **hautement** recommandé. Même si un capteur à un brin sera fonctionnel, ils sont considérablement moins précis. L'utilisation d'un câble de mise à la terre au moteur est lui aussi recommandé.

* Le capteur de pression externe dans le diagramme ci-dessus est optionnel et peut être omis si le capteur de la plaque 'speeduino' est utilisé. Alternativement un capteur 'baro' peut être ajouté de la même façon que sur le diagramme.

* Un capteur de position du papillon des gaz à 3 brins est nécessaire. Le type on/off n'est pas utilisable.