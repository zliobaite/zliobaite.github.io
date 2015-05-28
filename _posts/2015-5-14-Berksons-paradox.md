---
layout: post
category : puzzles
tags : [bias,paradox,indirect discrimination]
title : Berkson's paradox
---
{% include JB/setup %}

[Berkson's paradox](http://en.wikipedia.org/wiki/Berkson%27s_paradox) describes a situation when two independent events become negatively correlated after one of them occurs. Here is an illustration.  

A few weeks ago [Peter Norvig](https://youtu.be/DdmyUZCl75s) said that "being a winner at one of these programming contests was actually a negative factor for performing well on the job". As a possible expalantion he mentioned that the winners are used to hacking a solution fast and moving to a next thing, which may not necessarily be good for the job. 

![Toy example](http://zliobaite.github.io/assets/fig_Berksons.png)

Suppose a university is selecting candidates for a master programme. Performance at contests is evaluated from 0 to 100, and performance at jobs is also evaluated from 0 to 100. Students with a combined score of 150 or more are accepted, as illustrated. The correlation between the contest score and job score among those accepted would be about -0.48, meaning that if somebody among the accepted candidates is good in contests, it is likely that s/he was bad at jobs. 

This happens because sample selection is biased in a way that candidates that are bad at both are eliminated. This does not mean that the selection procedure is flawed. This effect happens *within* the pool of selected candidates. It ilustrates dangers of making conclusions from a biased sample.





