---
layout: post
category : industry
tags : [prediction,adaptive algorithms,streaming data,Yandex,traffic]
title : Adaptive learning for traffic prediction by Yandex
---
{% include JB/setup %}

Yandex provides [congestion maps](maps.yandex.ru/traffic), that include traffic jam forecasts. They are using adaptive learning for that, predictive models are updated daily. Here is some more information about the [algorithmic solution](http://habrahabr.ru/company/yandex/blog/153631/) (in Russian). 

**Setting.** Road map is a graph. Crossings are nodes, streets are edges. Each edge has two attributes: length (fixed) and speed (varies over time). The goal is to predict speed in the future. 

**Data.** GPS_tracks from users of Yandex maps and navigation service. GPS-tracks are mapped onto the road graph. Average speed over each edge at a give time interval is taken.

**Predictive model.** Linear autoregression that takes current and near past speeds on the same edge as inputs, as well as speeds in the neighborhood. 

**Learning, adaptation and prediction.** A new model is learned once per day. Different models are used for different times of day. New prediction are casted every 10 min taking new incoming GPS-traces into consideration. 

**Computational complexity.** The size of the road graph (static) is about 100 GB. The size of historical data being stored is in tens of TB. Model update using one server would take about two weeks. They use a cluster of 30 servers to perform daily model updates.