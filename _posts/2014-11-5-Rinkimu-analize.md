---
layout: post
category : open-data
tags : [Seimo rinkimai, mds, clustering]
title : Seimo rinkimų balsavimo analizė
---
{% include JB/setup %}

This post is about analysis of voting data from Lithuanian Parliament elections in 2012. It is in Lithuanian, since, perhaps, it is of little interest to non-Lithuanian speakers. 

Per 2012 Seimo rinkimus, kai buvo kalbų apie balsų pirkimą, greituoju būdu buvau darius pirmumo balsų pasiskirstymo analizę. Dabar aptvarkiau kodą, komentarus ir  sudėjau į [gitHub](https://github.com/zliobaite/Rinkimu-analize-2012).

Analizės esmė - rasti kandidatus, kurių gaunami balsai pasiskirsto panašiai. Tokiu būdu galima aptikti kandidatus, kurie, pvz. kartu vykdo rinkiminę kampaniją, bet taip pat gali pasimatyti, jeigu kas "perka" balsus, pvz. pateikdami užpildytas rinkėjo korteles su tais pačiais 5 kandidatais. Aišku, kiekybinė analizė pasakys tiktai kas su kuo susiję, nepasakys - kodėl.

Analizės santrauka ir rezultatai [aprašyti čia](https://github.com/zliobaite/Rinkimu-analize-2012/blob/master/1_communication/Zliobaite_seimo_2012.pdf?raw=true) 