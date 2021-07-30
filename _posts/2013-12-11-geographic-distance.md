---
layout: post
category : cities
tags : [algorithm,cities]
title : Distance between two geographical coordinates
mathjax : true
---

Suppose we have two objects with known geographic coordinates in [WGS84](http://en.wikipedia.org/wiki/World_Geodetic_System). Here is a simplified formula for calculating the Earth distance $$D$$ between these two objects in kilometres.

$D = 6378.137 \times \arccos(S),$

$S = \cos\big(R(\phi_1)\big) \cos\big(R(\phi_2\big) \cos\big(R(\lambda_2-\lambda_1)\big) + \sin\big(R(\phi_1)\big) \sin\big(R(\phi_2)\big),$

$R(x) = \frac{x\pi}{180}.$

Here $\phi_1$ is the latitude of object $1$, $\lambda_1$ is the longitude of object $1$, and $\phi_2$, $\lambda_2$ are the coordinates of object $2$ correspondingly. Function $R()$ converts degrees to radians.

More information can be found [here](http://www.mapanet.eu/EN/resources/Script-Distance.htm).

**Example**

Helsinki $\lambda_1 = 60.1708$, $\phi_1 = 24.9375$

Vilnius $\lambda_2 = 54.6833$, $\phi_2 = 25.2833$

$\cos\big(R(\phi_1)\big) = 0.90677$

$\cos\big(R(\phi_2)\big) = 0.90420$

$\cos\big(R(\lambda_2-\lambda_1)\big) = 0.99542$

$\sin\big(R(\phi_1)\big) = 0.42163$

$\sin\big(R(\phi_2)\big) = 0.42709$

$S = 0.99622$

Distance $D = 6378.137\times\arccos(S) = 554.742$ km

**R code**

	deg_to_radians <- function(degrees)
	{
	  return(degrees*pi/180)
	}

	compute_geo_distance <- function(lat1,lon1,lat2,lon2) #in km
	{
	  rearth = 6378.137 #Earth Radius in km
	  fi1 <- cos(deg_to_radians(lat1))*cos(deg_to_radians(lat2))*cos(deg_to_radians(lon2-lon1))
	  fi2 <- sin(deg_to_radians(lat1))*sin(deg_to_radians(lat2))
	  dist = rearth*acos(fi1+fi2)
	  return(dist)
	}
	
	compute_geo_distance(24.9375,60.1708,25.2833,54.6833)
