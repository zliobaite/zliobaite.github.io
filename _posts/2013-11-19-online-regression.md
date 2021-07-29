---
layout: post
category : data-streams
tags : [data streams,regression,algorithm]
title : Online regression 
---
{% include JB/setup %}



Linear regression models assume that the relationship between $r$ input variables $X = (x_1,x_2,\ldots,x_r)$ and the target variable $y$ is linear in the form
$$
y = b_1x_1 + b_2x_2 + \ldots + b_kx_k + e = XB + e,
$$where the vector $B = (b_1, b_2,\ldots,b_r)^T$ contains the parameters of the linear model (regression coefficients), and $e$ is a random error.

Simple and common way to estimate the regression parameters from data is to minimize the empirical mean squared error. We take a historical dataset of $n$ observations, where 
$\mathbf{X}  = (X_1^T, X_2^T, \ldots, X_n^T)^T$ and
$\mathbf{y} = (y_1,y_2,\ldots,y_n)^T$, and have a closed form solution, which is 
$$
\hat{B} = (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T\mathbf{y}.
$$

What if data arrives as a stream and we do not have time or resources to wait for a complete historical dataset? We can estimate the regression coefficients recursively, and update the estimates every time a new observation is available. 

All we need to keep in memory is the vector of regression coefficients $B$ (which needs to be stored in any case for making predictions), and an estimate of the covariance matrix $\mathbf{S}^{-1}$ (storage space is quadratic to the number of input variables). 

When at time $t$ observation $X_t$ with the corresponding  true target value $y_t$ becomes available, the model is updated as follows:
$$
\mathbf{S}_t^{-1} = \mathbf{S}_{t-1}^{-1}
- \frac{\mathbf{S}_{t-1}^{-1}X_t^TX_t\mathbf{S}_{t-1}^{-1}}{1 + X_t\mathbf{S}_{t-1}^{-1}X_t^T},
$$
and
$$
\hat{B}_t = \hat{B}_{t-1} + \mathbf{S}_t^{-1}X_t^T(y_t  - X_t\hat{B}_{t-1}).
$$
More information can be found, for instance, in [M. Jordan's lecture notes](http://www.cs.berkeley.edu/~jordan/courses/294-fall98/readings/rls.ps). 

This solution comes from the times, when computations had to be done by hand, so it is computationally efficient. There is even no need to invert the covariance matrix $\mathbf{S}$, which is a computationally intensive procedure, the matrix comes already inverted. 