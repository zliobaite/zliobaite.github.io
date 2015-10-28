---
layout: post
category : collaborations
tags : [paleontology,Tversky index,Raup-Crick]

title : Measuring similarity between sets in paleontological analysis
---
{% include JB/setup %}

<head>
<script type="text/javascript"
 src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
</head>

### Symmetric similarity measures ###

One big topic in paleontological data analysis is comparing similarities of sets of species found in different geographc areas and coming from different times. A set of species, for example, is {wolf, rabbit, raindeer}. For measuring similarity, standard and specifically developed indices are used, the most popular of which are: Dice, Jaccard, Simpson, Raup-Crick. 

Suppose we have two sets A and B. 

Jaccard index is computed as $$\frac{|A \cap B|}{|A \cup B|}$$.

Dice is computed as $$\frac{2|A \cap B|}{|A| + |B|}.$$
Dice is the same as F1 score in inrofmation retrieval. 

Simpson intex is computed as $$\frac{|A \cap B|}{\mathit{min}(|A|,|B|)}$$.

Raup-Crick index is computed using a randomization procedure and is based on the probability of observing at least $$|A \cap B|$$  shared species in the compared communities. 

More details are available in the [PAST manual](http://folk.uio.no/ohammer/past/), which is a softwae for paleontological data analysis.


Anyaway, those similarity measures are symmetric. Similarity of a site of interest to the reference site is the same as similarity of the reference site to the site of interest. This is useful, for instance, if  the goal is to analyze overall distribution of species in some areas. 

### Comparing to a prototype ###

Often the goal is to compare species occurrence to specific reference sites. That is, researchers may be interested in how species from the reference sites are reflected in other sites. Since other sites may have different amounts of extra species, which will show as deviations in the standard (symmetric) similarity measures, commonly used measures are not the most informative for this purpose.

Thus, for measuring asymmetric similarity the Tversky index [1] can be used. It compares a variant to a prototype. The Tversky index is computed as 

$$\frac{|A \cap B|}{|A \cap B| + a|A - B|+ b|B - A|}$$,

where $|A - B|$ is the number of species in A, but not in B, and $a,b \geq 0$ are user defined weights. 

Interestingly, the Tversky index is a generalization of Dice and Jaccard coefficients, where setting the weights to $a=b=0.5$ gives Dice, and $a=b=1$ gives Jaccard. 

Suppose A is the reference site, and B is a new site. Then Tversky index for comparing to the reference site uses $a=0.5$ and $b=0$, which means that the measure is similar to Dice, except that the extra species on the new sites are not included. This serves the purpose to focus on comparison to prototype sites.

[1] Tversky, Amos (1977). Features of Similarity. Psychological Reviews 84 (4): 327–352.

### Taking into account absence ###

All the indexes above, except for Raup-Crick, are based only on observed presence, but not on absence. That is, species that are present in neither, but possible, are not considered. 

Possible measures to take into account absence in paleontology are based on Forbes index [2]

$$\frac{|A \cap B||C|}{|A||B|}$$,

where C is a set of all species, including spcies in A, species in B, and species in neither A and B. Forbex index can go above 1. 

In principle, classification accuracy measures could be used to capture absence. For example, the Kappa statistic.

[2] Alroy, John (2015). A new twist on a very old binary similarity coefficient. Ecology 96:575–586.

### Performance ###

I did a simulation to check how all these simmetric measures (no Tversky) perform. There is a base model where $$|A| = 200x$$, $$|B| = 200x$$, $$|C| = 400x$$, $$|A \cap B| = 100x$$, $$x = 1$$, and for each test some assumption is relaxed. [Here](http://zliobaite.github.io/assets/run_sim.R) is my code in R. 

![](http://zliobaite.github.io/assets/fig_similarity.png)

The figure shows that the sensitive area of Raup-Crick is very narrow, it basically acts as a classifier saying similar or not similar. Forbes sometimes goes off the chart. Kappa goes negative in cases the verlap is less than would be expected at random. Dice, Simpson and Jaccard act consistently and similarly. I would perhaps use Dice in many cases. Dice is the same as F1. 
