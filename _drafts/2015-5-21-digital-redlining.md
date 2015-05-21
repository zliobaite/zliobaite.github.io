---
layout: post
category : discrimination
tags : [redlining,lending,data mining]
title : Digital redlining
---
{% include JB/setup %}

Back in the days American banks used to draw maps redlining the areas in which they don't want to lend. Hence the term *redlining*.

![Redlining](http://zliobaite.github.io/assets/redlining.jpg) 
*<small> "Home Owners' Loan Corporation Philadelphia redlining map". Licensed under Public Domain via [Wikipedia](http://en.wikipedia.org/wiki/File:Home_Owners%27_Loan_Corporation_Philadelphia_redlining_map.jpg#/media/File:Home_Owners%27_Loan_Corporation_Philadelphia_redlining_map.jpg)</small>*

The problem was that those redlined neighbourhoods were typically populated by black people. Even though banks were not using race information for denying credits directly, the policy was affecting racial minorities worse than others.  

Digital redlining is the same but with algorithms. For example, nowadays banks are not allowed to use age in credit scoring models. So the first thing a bank decides to remove the age variable from the intputs (true story). 

All is fine if the other input variables are independent from age, but that's rarely the case. Age may be correlated, for instance, with income. Income is a valid predictor for credit scoring, so it can be part of the model. What happens next?

If in the historical data the credit risk that we are trying to predict is independent from age, then no problem. But if credit risk is at the same time correlated with age and income, then the model will pick up some undesired biases even after age is removed. 

plots


