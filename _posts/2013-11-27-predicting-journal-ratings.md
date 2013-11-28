---
layout: post
category : applications
tags : [prediction, JUFO ranking, publications]
title : Predicting rating of an academic journal based on its title
---
{% include JB/setup %}

I was wondering, if a title of an academic journal or conference somehow reflects the (perceived) quality. So I did an experiment. 

**Setting.** The goal is to predict a rating of a journal or conference based only on the title. If we can build a model that would predict the rating accurately, then we can conclude, that the title tells something about the (perceived) quality of the venue. 

**Data** comes from two sources. The first source is rating of publication venues produced by the Federation of Finnish Learned Societies, so called [JUFO ranking](http://www.tsv.fi/julkaisufoorumi/english.html). Here rating has four levels: 1 - basic, 2 - leading, 3 - top, and 0 - no rating. The second source of data is [a list of "predatory" academic journals](http://scholarlyoa.com/individual-journals/), compiled by Jeffrey Beall from the University of Colorado Denver. I add these "predatory" journals to the dataset and encode their rating as -1. 

A complete dataset with rankings is [available here](https://github.com/zliobaite/predictJUFO/blob/master/JUFOdataset.csv). It consists of 22301 journal/conference titles. The distribution of ratings is: 1% (-1), 7% (0), 73% (1), 14% (2) and 5% (3).

The dataset is split into training and testing subsets (50:50%) at random.

**Preprocessing.** Input vectors consist of binary indicators, which indicate presence or absence of a word from the dictionary in a given title. The dictionary is formed of 1000 most frequent words in the training data. Then 300 features, that have the strongest relation to the target variable, are selected. 

No stemming or stop word removal is used. This is intuitive. If stemming helped, it would mean that journals in one topic should have the same rating.  In fact, I expect the opposite. Within each topic there should be better journals, and not so good journals. I tried experimenting with stemming and stop word removal, indeed, that made predictions worse. 

Three extra features are used: the number of words in the title, the number of symbols in the title and mean length of word in the title. Intuitively, lower rated journals may have longer titles and more short connecting words.

**Predictive models.** The task can be approach as multi-class classification, or regression, since the target is ordinal. I tried several options from both, and ended up with [Naive Bayes classifier for multivariate Bernoulli models](http://scikit-learn.org/stable/modules/generated/sklearn.naive_bayes.BernoulliNB.html). 

**Outcome.** The classification accuracy is above random, but not very high. [The kappa statistic](http://en.wikipedia.org/wiki/Cohen's_kappa) is 20% (0 means the same as random classification, 1 corresponds to perfect classification). 

Here are more detailed results. The recall of rating 2-3 journals is quite low, i.e., not much of them are retrieved and identified correctly. 
	
	labels	precision	recall	f1-score
	-1		0.61		0.45	0.52
	0		0.52		0.46	0.49
	1		0.76		0.95	0.84
	2		0.32		0.03	0.05
	3		0.27		0.02	0.04
	
	avg		0.65      	0.73	0.66

The above results are based on the assumption that any misclassification is equally bad. We can also compute cost-weighted classification error, where the cost of misclassification is defined as |true - predicted|. For example, misclassifying a journal of rating 2 as rating 1 carries cost of 1, but misclassifying the same journal as rating 0 carries cost 2. 

The mean cost weighted error of our classifier is 0.33, while random classifier gives 0.57. This means that our classification is about 50% better than random, so there is some predictive power in the titles after all. 

**What are the most informative title words?** Here are 20 most informative words and the probabilities of classes if these words are present. These probabilities are based on the fitted model. The first feature (#symbols) shows that the longer the title the higher the probability of low rating (-1 or 0). 

				P(-1)	P(0)	P(1)	P(2)	p(3)
	#symbols	61%		23%		2%		6%		8%
	vision		25%		46%		9%		7%		13%
	promotion	19%		11%		15%		15%		41%
	av.sym/word	48%		27%		3%		9%		13%
	#words		26%		15%		6%		12%		41%
	disease		73%		15%		4%		3%		5%
	nuclear		46%		18%		12%		9%		15%
	transfer	75%		7%		4%		4%		1%
	smart		66%		13%		3%		1%		9%
	neural		42%		24%		3%		8%		22%
	botany		69%		7%		3%		3%		18%
	scandinavian17%		9%		11%		25%		39%
	limnology	15%		25%		2%		1%		31%
	za			32%		2%		17%		16%		15%
	mechanics	2%		7%		12%		19%		42%
	ergonomics	9%		57%		6%		8%		21%
	metal		44%		8%		3%		9%		35%
	surgery		73%		7%		7%		3%		1%
	mental		15%		51%		21%		9%		4%
	hospitality	58%		1%		11%		13%		8%