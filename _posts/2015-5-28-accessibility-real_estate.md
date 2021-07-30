---
layout: post
category : smart-cities
tags : [TrafficSense,traffic,banking,Helsinki,mobile sensing]
title : Apartment prices in Helsinki relate to accessibility by public transport
---

Traditionally, apartment prices are considered to relate to the apartment characteristics and its location. We had a hypothesis that accessibility of a neighbourhood perhaps is even more important than its location. So we did a [pilot study](http://www.zliobaite.com/paper_realestate.pdf) in Helsinki region to check that. 

First we define static and dynamic points of interest in the city. Static points of interest are supposed to capture community centres. We find them by locating H&M stores in Helsinki region. Dynamic points of interest are supposed to capture where people go at different times of day. We find those centres by clustering [FourSquare](https://foursquare.com/) check-ins. 

![POI1](http://zliobaite.github.io/assets/points_of_interest1.png) 
![POI2](http://zliobaite.github.io/assets/points_of_interest2.png)
*<small> Right plot: blue 2:00-6:00, violet 6:00-10:00, red 10:00-14:00, brown 14:00-18:00, orange 18:00-22:00.</small>* <br>
*<small>Maps are credited to © [OpenStreetMap](http://www.openstreetmap.org/copyright) contributors.</small>*

Apartment data with offered sales prices comes from advertisements at [Oikotie](http://asunnot.oikotie.fi/). 
We define two types of accessibility features for each apartment: air distance to points of interest, and travel time by public transport to the nearest point of interest. For computing travel times we use the [Reititin tool](http://blogs.helsinki.fi/saavutettavuus/tyokaluja/metropaccess-reititin/). 

Travel times give quite a different perspective to the neighbourhoods than just considering a distance to the city centre. For example, here is a [map of travel times](http://mak.hsl.fi/) to CS building in Otaniemi at 9 o'clock in the morning. 
 
![Travel times](http://zliobaite.github.io/assets/travel_times.png) 

*<small> Colours correspond to travel minutes. </small>*

In our study we found that the air distance to the city centre (Stockmann) is more informative about apartment prices than the travel time by public transport to the centre. However, accessibility to the local centres (fixed centres H&M and dynamic centres FourSquare) by public transport is more informative than just the air distance to those centres. In other words, it seems that an apartment
price relates to the overall geographical location, but accessibility
to local centres of interest is more important than just the geographical distance to those centres.

Here is the paper:

* Žliobaitė, I., Mathioudakis, M., Lehtiniemi, T., Parviainen, P., Janhunen, T. (2015). [Accessibility by public transport predicts residential real estate prices: a case study in Helsinki region](http://www.zliobaite.com/paper_realestate.pdf). Proc. of the 2nd workshop on Mining Urban Data (MUD2).

And we have made [our dataset](http://www.zliobaite.com/datahel.zip) publicly available for research.

