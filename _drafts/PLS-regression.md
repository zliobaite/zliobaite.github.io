---
layout: post
category : algorithms
tags : [streaming data,regression,online learning,concept drift,adaptive algorithms]
title : PLS regression 
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

Partial Least Sqares (PLS) regression is popular in chemometrics, but not so well known in data streams. It is a linear regression model. Data is projected into lower dimensional space, and a regression model is produced. 

PLS regression has nice properties for streaming data analysis. It can be updated recursively, and it can adapt over time.

**Batch model.** There is no closed form solution for producing a model, therefore, an iterative optimization procedure is used. 

Let $\mathbf{X}$ be a $n \times r$ matrix of input data, where each line is an observation. Let $\mathbf{y}$ be an $n \times 1$ vector of the target values, corresponding to the observations in $\mathbf{X}$. Assume that the data is standardized prior to the analysis to zero mean and unit variance. Let $k$ be a parameter indicating the dimensionality of the projected data, such that $0 < k < r$.

Initialization: $\mathbf{E}_0 = \mathbf{X}$, $\mathbf{u}_1 = \mathbf{y}$. 

Loop: repeat the following steps for $i=1$ to $k$: 

1. $\mathbf{w}_i = \frac{\mathbf{E}_{i-1}^T\mathbf{u}_i}{\mathbf{u}_i^T\mathbf{u}_i}$ (size $k \times 1$)
2. $\mathbf{t}_i = \frac{\mathbf{E}_{i-1}\mathbf{w}_i}{\mathbf{w}_i^T\mathbf{E}_{i-1}^T\mathbf{E}_{i-1}\mathbf{w}_i}$ (size $n \times 1$)
3. $q_i = 
4. $\mathbf{p}_i = \frac{\mathbf{E}_{i-1}^T\mathbf{t}_i$ (size $k \times 1$)
5. 



**More details** can be found in, for instance, [this paper](http://cariparo.dei.unipd.it/documents/corso_psc_07-08/identificazionetermodinamica/articolipls/recursive-pls-algorithms-for-adaptive-data-modeling.pdf) by S. Qin from 1998.