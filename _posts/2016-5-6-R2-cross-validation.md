---
layout: post
category : collaborations
tags : [R2,cross-validation,paleontology]
title : Normalizing R2 for using with cross-validation
mathjax : true
---

The coefficient of determination, denoted as $$R^2$$, is commonly used in evaluating the performance of predictive models, particularly in life sciences. It indicates what proportion of variance in the target variable is explained by model predictions. 

$$R^2$$ takes values between minus infinity and one, the higher – the better. 
If tested on the same data as the model was fitted, zero means that the performance is the same as naïve baseline always predicting a constant.

When using $$R^2$$ with leave-one-out cross-validation, we need to normalise the score as otherwise the naïve baseline is below zero (more details can be found in our [ArXiv note](http://arxiv.org/abs/1605.01703)). 
The normalisation depends only on the number of data points in cross-validation, and is 

$R^2_{\mathit{CV}} = \frac{R^2 - R^2_N}{1 - R^2_N}$,

where 

$R^2_N = 1 - \frac{n^2}{(n-1)^2}$,

where $n$ is the number of data points.
