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

Suppose we have two objects with known geographic coordinates in [WGS84](http://en.wikipedia.org/wiki/World_Geodetic_System). Here is a simplified formula for calculating the Earth distance $D$ between these two objects in kilometres.
$$
D = 6378.137 \times \arccos(S)
$$
$$
S = \cos\big(R(\phi_1)\big) \cos\big(R(\phi_2\big) \cos\big(R(\lambda_2)- R(\lambda_1)\big) + \sin\big(R(\phi_1)\big) \sin\big(R(\lambda_2)\big)
$$
$$R(x) = \frac{x\pi}{180}$$
Here $\phi_1$ is the lattitide of object $1$, $\lambda_1$ is the longitude of onject $1$, and $\phi_2$, $\lambda_2$ are the coordinates of object $2$ correspondingly. Function $R()$ converts degrees to radians.

More information can be found [here](http://www.mapanet.eu/EN/resources/Script-Distance.htm).