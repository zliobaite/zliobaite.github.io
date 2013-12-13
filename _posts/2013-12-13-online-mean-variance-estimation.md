---
layout: post
category : algorithms
tags : [streaming data,online learning,adaptive algorithms]
title : Online adaptive estimation of mean and variance
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

Suppose we have a random variable $x$. Observations arrive in a stream, $x_t$ indicates the observation at time $t$. If we have access to all the historical observations, the mean is $\bar{x}_t = \frac{1}{t}\sum_{i=1}^t x_i$.

If we do not have access to all the historical data, the mean can be estimated online recursively. Using $\bar{x}_{t-1} = \frac{1}{t-1}\sum_{i=1}^{t-1} x_i$ we get
$$
\bar{x}_t = \frac{1}{t}\sum_{i=1}^t x_i = \frac{1}{t} \left(\sum_{i=1}^{t-1} x_i + x_t \right) = \frac{t-1}{t}\bar{x}_{t-1}+ \frac{1}{t} x_t.
$$
We need to keep in memory only the previous estimate $\bar{x}_{t-1}$ and the counter $t$. 

This recursive estimate does not have any forgetting mechanism. When $t$ gets large, the contribution of the next $x_t$ to the estimate becomes very small. In addition, it may happen that the distribution of data changes over time. Therefore, we may want to have an adaptive mean estimate $\bar{x}_t^\star$, which can be recursively computed using a simple exponential smoothing
$$
\bar{x}_t^\star = (1-\alpha)\bar{x}_{t-1}^\star + \alpha x_t,
$$ 
here $\alpha \in (0,1)$ is the smoothing weight. The larger $\alpha$, the faster the forgetting.


Similarly, we can estimate the variance $\mathit{Var}(x)$. If we have access to  all the historical data, sample variance is estimated as $\mathit{Var}(x)_t = \frac{1}{t-1}\sum_{i=1}^t (x_i - \bar{x})^2$, where $\bar{x}$ is the mean. 

Online recursive estimation is given by 
$$
\mathit{Var}(x)_t = \frac{1}{t-1}\sum_{i=1}^t (x_i - \bar{x})^2 = 
\frac{1}{t-1} \left( \sum_{i=1}^{t-1} (x_i - \bar{x})^2  + (x_t - \bar{x})^2 \right) = \frac{t-2}{t-1} \mathit{Var}(x)_{t-1} + \frac{1}{t-1} (x_t - \bar{x})^2.
$$

Adaptive online estimation is given by 
$$
\mathit{Var}(x)_t^\star = (1-\alpha)\mathit{Var}(x)_{t-1}^\star + \alpha (x_t - \bar{x})^2,
$$
where $\alpha \in (0,1)$ is the smoothing weight.