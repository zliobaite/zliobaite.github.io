---
layout: post
category : applications
tags : [northern lights, Aurora Borealis, Svalbard, detection]
title : Detecting auroras in all-sky camera images
---
{% include JB/setup %}

In February, while on winter holiday trip, I visited aurora researchers at [The University Centre in Svalbard (UNIS)](http://www.unis.no/). We talked about machine learning and stuff. They recently set up a color camera at [Kjell Henriksen Observatory](http://kho.unis.no/), and are interested in detecting and recognizing auroras from images in real time. 

While on a plane I tried a few quick solutions based on pixel thresholding and pixel clustering, they seem to be working reasonably well. 

Here is an example of a threshold based detection:

![Routes1](http://zliobaite.github.io/assets/ex1_aurora_detection.png)

If somebody is interested to explore, I put the code on [GitHub](https://github.com/zliobaite/Aurora-detection).