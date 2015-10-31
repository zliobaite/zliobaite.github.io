---
layout: post
category : puzzles
tags : [bias,paradox,indirect discrimination]
title : Oversampling paradox
---
{% include JB/setup %}

A recent [study](http://cad.sagepub.com/content/early/2014/09/26/0011128714549655.abstract) in criminology points out a major flaw in interpretation by previous studies, which have been suggesting that 50% of offenders released from state prisons return to prison within 3 to 5 years. The study points out that 2/3 of the prisoners actually never return. The figures are overstated due to sampling procedure. If a survey targets prisoners currently serving their sentence, it is biased towards returning prisoners, and not representative of all prisoners. 

Here is an example. Suppose there are only two types of crimes in the society: small and big. For a small crime the sentence is 1 year, and for a big crime the sentence is 9 years. Suppose from all the criminals in the society only 10% are big criminals, and 90% comit small crimes. Suppose every year 100 criminals are caught. From those 10 get the sentence of 10 years, and 90 get the sentence of 1 year. After 1 year those 90 are released, but new 100 are caught. From those 10 get 10 years, and 90 get 1 year. So now in prison there are 20 big criminals and 90 small criminals. And so on. This continues, and at year #9 there are 90 big criminals and 90 small criminals. If researchers conduct a survey in prison now, it will appear that 50% of the criminals are big criminals, and 50% are small criminals. This highly exaggerates the actual percentage of big criminals in the society, just because big criminals stay in prison longer. 

This relates to so called [oversapling paradox](http://allendowney.blogspot.fi/2015/08/the-inspection-paradox-is-everywhere.html). Suppose that one wants to estimate an average size of clases in the country. Suppose in reality there are only two types of classes, and 50% of the classes have 15 kids, another 50% have 35 kids. So an average class is 25 kids. 

Suppose a researcher asks 100 kids chosen at random, what the size of their class is. But in this sampling procedure the researcher will be more likely to encounter kids from large classes. Actually, in the sample 70 kids are expected to be from large classes, and 30 kids from small classes. If the researcher averages the answers of all respondents, the outcome will be that an average size of a class in the country is (30 * 15 + 70 * 35)/100 = 29. That is, th researcher will conclude that an average size is 29 kids, while in reality is it 25.