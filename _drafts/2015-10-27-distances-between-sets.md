---
layout: post
category : collaborations
tags : [paleontology]

title : Measuring similarity of communities in ecology
---
{% include JB/setup %}

Dice, Jaccard, Simpson, Raup-Criek and many other similarity measures used in ecology are symmetric measures. Similarity of a site of interest to the reference site is the same as similarity of the reference site to the site of interest. This is useful, for instance, if  the goal is to analyze overall distribution of species in some areas. 

Often the goal is to compare species occurrence to specific reference sites. That is, researchers may be interested in how species from the reference sites are reflected in other sites. Since other sites may have different amounts of extra species, which will show as deviations in the standard (symmetric) similarity measures, commonly used measures are not the most informative for this purpose.

Thus, for measuring asymmetric similarity the Tversky index [1] can be used. It compares a variant to a prototype. The Tversky index is computed as 

$$T = M / (M + a*N0 + b*N1)$$,

where M is the number of species shared between the compared sites, 
N0 is the number of species occurring in the reference site (prototype) but not in the new site, N1 is the number of species occuring in the new site but not in the reference site, and a,b >=0 are user defined weights. 

Interestingly, the Tversky index is a generalization of Dice and Jaccard coefficients, where setting the weights to a=b=0.5 gives Dice, and a=b=1 gives Jaccard. 


[1] Tversky, Amos (1977). "Features of Similarity". Psychological Reviews 84 (4): 327–352.