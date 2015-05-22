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

The problem was that those redlined neighbourhoods were typically populated by racial minorities. Even though banks were not using race information for denying credits directly, the policy was affecting racial minorities worse than others.  

Digital redlining is the same but with algorithms. For example, nowadays banks are not allowed to use age in credit scoring models. So the first thing a bank decides is to remove the age variable from the intputs (true story). 

All is fine if the other input variables are independent from age, but that's rarely the case. Age may be correlated, for instance, with income. Income is a valid predictor for credit scoring, so it can be part of the model. What happens next?

If there was no age bias in the hitorical credit risk data then no problem. But if in there is an undesired age bias beyond what is explained by income, for instance, due to biased decisions in the past, then the credit scoring model would pick up those biases from the data even if age is removed from the model. 

Here is a toy example. Suppose credit risk historically has been decided by human analysts presuming that younger clients have higher risk, clients with higher income have lower risk. The older the person, the highr the income, as in the pictures. 

![fig1](http://zliobaite.github.io/assets/fig_risk_age.png)
![fig2](http://zliobaite.github.io/assets/fig_risk_income.png)
![fig3](http://zliobaite.github.io/assets/fig_income_age.png) 

Now the bank is making a model for deciding upon credit risk automatically. 

income is distributed uniformly from 1000 to 6000. Suppose credit risk recorded in the historical data has been decided by human analysts according to an implicit rule: 

	risk = 0.8*(6000-income)/5000 + 0.2(age - 30)/50. 

The higher the income, the lower the risk. The older the person, the higher the risk. Toy example. 




Income serves as a digital red line. 
Therefore, removing the protected characteristic is not enough to ensure 

