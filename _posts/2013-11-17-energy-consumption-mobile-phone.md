---
title : How much energy does a mobile phone consume?
category : smart-cities
layout: post
tags : [TrafficSense,mobile sensing,energy]
---
<head>
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
  tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
});
</script>
<script type="text/javascript"
 src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
</head>

We have a new project, called [TrafficSense](https://cse.aalto.fi/research/groups/distributed-systems-group/projects/trafficsense/). One of the goals is to infer and predict movement patterns of people using mobile sensing for better efficiency in transportation. 

But mobile sensing itself consumes energy. I've been looking how to calculate how much energy a mobile phone is consuming while collecting location and movement data. 

The simplest way is as follows. The electric charge of a mobile phone battery $Q$ is given in mAh (milliampere-hour), Ah is a unit of electric charge (like flow in pipes). There is also voltage $V$ in V (volt). Volt is a unit of electrical potential (like pressure in pipes). 

The electric charge Q(mAh) in milliampere-hours (mAh) is equal to the energy E(Wh) in watt-hours (Wh) times 1000 divided by the voltage V(V) in volts (V):
Energy $E$ in Wh (watt-hours) can be calculated as 

$$E_{(Wh)} = Q_{(mAh)} \times V_{(V)} / 1000.$$

This gives approximately the energy consumed during one battery discharge from 100% to 0%.

A simplest way to calculate how much energy has been used in a certain time period is to look at the level of battery (in percentage) at the start and at the end of the period.

One can collect more exact data about battery discharge and voltage using, for instance, the Open Sensing Framework [FUNF](http://www.funf.org/).


