---
layout: post
category : fairness
tags : [bias,indirect discrimination]
title : Propensity models
---
{% include JB/setup %}

Propensity models are used in clinical studies and in marketing to account for differences in treatment and control groups. Often assignment to treatment is not a random procedure, but somebody decides. Propensity score is the probability for a person to be assigned to treatment. Propensity score comes from a model.

![Heimdall](http://zliobaite.github.io/assets/Heimdall.jpg) 
*<small>Illustration form [Marvell database](http://marvel.wikia.com/)</small>.*

For example, imagine Heimdall the gatekeeper. When a creature approaches the gate, Heimdall decides whether the creature can enter the palace and drink ambrosia (ok ok, different mythology, but let it be for illustration). A curious researcher wants to find out whether the ambrosia adds strength, so s/he measures the strength of those who drank ambrosia, and those who haven't and statistically compares the two samples. 

![Ambrosia](http://zliobaite.github.io/assets/ambrosia.jpg)
*<small>Illustration: "[WLANL - MicheleLovesArt - Museum Boijmans Van Beuningen - Istoriato schotel, de maaltijd der Goden op de Olympus" by MicheleLovesArt - Museum Boijmans Van Beuningen - Istoriato schotel: de maaltijd der Goden op de Olympus](http://commons.wikimedia.org/wiki/File:WLANL_-_MicheleLovesArt_-_Museum_Boijmans_Van_Beuningen_-_Istoriato_schotel,_de_maaltijd_der_Goden_op_de_Olympus.jpg#/media/File:WLANL_-_MicheleLovesArt_-_Museum_Boijmans_Van_Beuningen_-_Istoriato_schotel,_de_maaltijd_der_Goden_op_de_Olympus.jpg). Licensed under CC BY-SA 2.0 via Wikimedia Commons.</small>*

The problem is that nobody knows how the gatekeeper decides, who gets in and gets the drink. Maybe the gatekeeper decides by the amount of muscles? If so, then perhaps the drinking group is stronger anyway, ambrosia or no ambrosia. 

Propensity models are for modeling the decisions of the gatekeeper. Typically, a logit or some other discreete choice model is used on the data recording who was let in, and characteristics of those arriving at the gate (for example, whether somebody has horns or not). Then the strength is compared in small groups, in which, according to the model, creatures have a similar probability to be let in. 

Propensity models can be used in discrimination-aware data mining in an interesting way. [Toon](http://cs.ulb.ac.be/members/tcalders/doku.php) and colleagues [have used](http://web.lums.edu.pk/~akarim/pub/controlling_attribute_effect_icdm2013.pdf) propensity models for estimating the probability of being a women. The final goal is to remove gender bias from the predictive model of salary. Bias is removed separately within each group of persons having similar propensities of being a woman. 

The idea of using propensity models in discrimination-aware data mining makes sense. Maybe some woman has a job profile more typical for men and other way around. So probability of being a woman actually serves as a proxy for similar job profiles.