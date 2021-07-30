---
layout: post
category : machine-learning
tags : [datastreams,regression,conceptdrift]
title : Online adaptive regression 
mathjax : true
---

Earlier I wrote about [online regression]({% post_url 2013-11-19-online-regression %}), which receives observations one by one and recursively learns a regression model. We get a the same model, as learning offline on all the training observations. What, if we want the model to adapt over time? 

**Update equations.** Here is an online regression that uses exponential forgetting. It is assumed that newer observations are more informative older ones. Let $$\alpha \in (0,1)$$ be the forgetting rate. 

When at time $$t$$ observation $$X_t = (x_1,x_2,\ldots,x_r)$$ with the corresponding  true target value $$y_t$$ becomes available, the model is updated the same way as for [the non adaptive online regression]({% post_url 2013-11-19-online-regression %}):
$$
\hat{B}_t = \hat{B}_{t-1} + \mathbf{S}_t^{-1}X_t^T(y_t  - X_t\hat{B}_{t-1}),
$$
where $$\mathbf{S}$$ is the covariance estimate, $$\hat{B}$$ is the estimate of regression coefficients. 
The update for the covariance estimate is 
$$
\mathbf{S}_t^{-1} = \frac{1}{\alpha}\left(\mathbf{S}_{t-1}^{-1} - \frac{\mathbf{S}_{t-1}^{-1}X_t^TX_t\mathbf{S}_{t-1}^{-1}}{\alpha + X_t\mathbf{S}_{t-1}^{-1}X_t^T}\right).
$$

**Initialisation.** The model can be initialised as $$\mathbf{S} = \mathbf{I}_{r \times r}$$ (identity matrix, where $$r$$ is the number of input variables) and $$\hat{B} = \mathbf{0}_{r \times 1}$$.

**How does it work?**  
Optimisation is based on the loss function
$$C = \sum_{i=1}^t \alpha^{t-i}(y_i - X_iB)^2$$.
The more recent an observation is, the larger the penalty. The penalty decreases exponentially with the age of examples. 

The loss is minimized with the following solution,
$$\frac{\partial C}{\partial B} = -\sum_{i=1}^t 2\alpha^{t-i}X_i^T(y_i - X_iB) = 0$$,
which can be expressed as 
$$
\mathbf{X}_t^T\mathbf{A}_t\mathbf{X}_t\hat{B}_t = \mathbf{X}_t^T\mathbf{A}_t\mathbf{y}_t,
$$
where $$\mathbf{X}_t  = (X_1^T, X_2^T, \ldots, X_t^T)^T$$,
$$\mathbf{y}_t = (y_1,y_2,\ldots,y_t)^T$$, and $$\mathbf{A}_t = \mathit{diag}(\alpha^{t-1},\alpha^{t-2},\ldots,1)$$.

Let $$\mathbf{S}_t = \mathbf{X}^T_t\mathbf{A}_t\mathbf{X}_t$$. Then,
$$\mathbf{S}_t = \alpha\mathbf{S}_{t-1} + X_t^TX_t$$. 

Now we can find the update equation,
$$
\mathbf{S}_t\hat{B}_t = \mathbf{X}_t^T\mathbf{A}_t\mathbf{y}_t = 
\alpha\mathbf{X}^T_{t-1}\mathbf{A}_{t-1}\mathbf{y}_{t-1} + X_ty_t = \alpha \mathbf{S}_{t-1}\hat{B}_{t-1} + X_ty_t = \alpha(\alpha^{-1}\mathbf{S}_t - \alpha^{-1}X_t^TX_t)\hat{B}_{t-1} + X_ty_t,
$$
$$
\hat{B}_t = \hat{B}_{t-1} - \mathbf{S}_t^{-1}X_t^T(y_t - X_tB_{t-1}).
$$

The covariance estimate $$\mathbf{S}_t$$ is inverted recursively applying the [Sherman-Morrison-Woodbury formula](http://en.wikipedia.org/wiki/Woodbury_matrix_identity).

**References.** More information can be found, for instance, in [M. Jordan's lecture notes](http://www.cs.berkeley.edu/~jordan/courses/294-fall98/readings/rls.ps).
