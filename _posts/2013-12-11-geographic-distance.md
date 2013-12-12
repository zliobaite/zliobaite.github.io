---
layout: post
category : applications
tags : [GIS, transportation]
title : Distance between two geographical coordinates
---
{% include JB/setup %}
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

Suppose we have two objects with known geographic coordinates in [WGS84](http://en.wikipedia.org/wiki/World_Geodetic_System). Here is a simplified formula for calculating the Earth distance $D$ between these two objects in kilometers.
$$
D = 6378.137 \times \arccos(S)
$$
$$
S = \cos\big(R(\phi_1)\big) \cos\big(R(\phi_2\big) \cos\big(R(\lambda_2-\lambda_1)\big) + \sin\big(R(\phi_1)\big) \sin\big(R(\phi_2)\big)
$$
$$R(x) = \frac{x\pi}{180}$$
Here $\phi_1$ is the latitude of object $1$, $\lambda_1$ is the longitude of object $1$, and $\phi_2$, $\lambda_2$ are the coordinates of object $2$ correspondingly. Function $R()$ converts degrees to radians.

**Example.**

Helsinki $\lambda_1 = 60.1708$, $\phi_1 = 24.9375$

Vilnius $\lambda_2 = 54.6833$, $\phi_2 = 25.2833$

$\cos\big(R(\phi_1)\big) = 0.90677$

$\cos\big(R(\phi_2)\big) = 0.90420$

$\cos\big(R(\lambda_2-\lambda_1)\big) = 0.99542$

$\sin\big(R(\phi_1)\big) = 0.42163$

$\sin\big(R(\phi_2)\big) = 0.42709$

$S = 0.99622$

Distance $D = 6378.137×arccos(S) = 554.742 km


More information can be found [here](http://www.mapanet.eu/EN/resources/Script-Distance.htm).
