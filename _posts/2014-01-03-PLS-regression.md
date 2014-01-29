---
layout: post
category : algorithms
tags : [streaming data,regression,online learning,concept drift,adaptive algorithms]
title : PLS regression 
---
{% include JB/setup %}

<head>
<script type="text/javascript"
 src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
</head>

Partial Least Squares (PLS) regression is popular in chemometrics, but not so well known in data streams. It is a linear regression model. Data is projected into lower dimensional space, and a regression model is produced. 

PLS regression has nice properties for streaming data analysis. It can be updated recursively, and it can adapt over time.

**Batch model.** There is no closed form solution for producing a model, therefore, an iterative optimization procedure is used. 

Let $$\mathbf{X}$$ be a $$n \times r$$ matrix of input data, where each line is an observation. Let $$\mathbf{y}$$ be an $$n \times 1$$ vector of the target values, corresponding to the observations in $$\mathbf{X}$$. Assume that the data is standardized prior to the analysis to zero mean and unit variance. Let $$k$$ be a parameter indicating the dimensionality of the projected data, such that $$0 < k < r$$.

Initialize: $$\mathbf{E}_0 = \mathbf{X}$$ and $$\mathbf{u}_0 = \mathbf{y}$$.

Loop: repeat the following steps for $$i=1$$ to $$k$$: 

1. $$\mathbf{w}_i = \mathbf{E}^T_{i-1}\mathbf{u}_{i-1}/(\mathbf{u}_{i-1}^T\mathbf{u}_{i-1})$$
2. $$w_i \gets w_i/ |w_i|$$
3. $$\mathbf{t} = \mathbf{X}\mathbf{w}_i$$
4. $$q = \mathbf{u}^T_{i-1}\mathbf{t}/(\mathbf{t}^T\mathbf{t})$$
5. $$\mathbf{u}_i = \mathbf{u}_{i-1}$$
6. $$\mathbf{p}_i = \mathbf{E}^T_{i-1}\mathbf{t}/(\mathbf{t}^T\mathbf{t})$$
7. $$\mathbf{E}_i = \mathbf{E}_{i-1} - \mathbf{t}\mathbf{p}_i^T$$
8. $$\mathbf{u}_i = \mathbf{u}_{i-1} - \mathbf{t}q_i$$

Collect the results into matrixes:
$$\mathbf{W} = (\mathbf{w}_1,\ldots,\mathbf{w}_k)$$, 
$$\mathbf{P} = (\mathbf{p}_1,\ldots,\mathbf{p}_k)$$, and
$$\mathbf{q} = (q_1,\ldots,q_k)^T$$.

In Python the iterative optimization procedure can be implemented as follows, assuming data and labels are in the numpy array format.

	import numpy as np
	def nipals(data,labels,k):
	r = np.shape(data)[1]
	W = np.zeros((k,components))
	P = np.zeros((k,components))
	Q = np.zeros(components)
	for i in range(k):
		w = np.dot(data.T,u)*1.0/np.dot(u.T,u)
		wnorm = np.sqrt(np.dot(w.T,w))
		w = w*1.0 / wnorm
		t = np.dot(data,w)
		tt = np.dot(t.T,t)
		q = np.dot(t.T,labels)*1.0/tt
		u = labels
		p = np.dot(data.T,t)*1.0/tt
		data = data - np.outer(t,p)
		labels = labels - t*q
		W[:,i] = w
		P[:,i] = p
		Q[i] = q
	return P,W,Q

**Prediction.** Predictions for unseen data can be made as $$\hat{y} = \mathbf{x}^T\beta$$, where $$\beta = \mathbf{W}(\mathbf{P}^T\mathbf{W})^{-1}\mathbf{q}$$.

In Python prediction can be implemented as follows.

	model = np.dot(np.dot(W,np.linalg.pinv(np.dot(P.T,W))),Q)

**Online update.** For updating the regression model with new observations we need to store $$\mathbf{P}$$ and $$\mathbf{q}$$. When a new labeled observation $$\mathbf{x},y$$ arrives, a training dataset is constructed as 
$$\mathbf{E}_0 = (\mathbf{P},\mathbf{x})^T$$ and $$\mathbf{u}_0 = (\mathbf{q},y)^T$$. Then the batch learning procedure (specified above) is applied to the constructed dataset. 

In Python:

	def update_PLS(P,Q,data,labels):
		k = np.shape(P)[1]
		data_new = np.vstack((P.T,data))
		label_new = np.hstack((Q,labels))
		P,W,Q = nipals(data_new,label_new,k)
		return P,W,Q

**Online adaptation.** When data distribution is evolving over time, it may be useful to include a forgetting factor. In such a case the update procedure is the similar, but the training datasets are constructed as
$$\mathbf{E}_0 = (\alpha\mathbf{P},\mathbf{x})^T$$ and 
$$\mathbf{u}_0 = (\alpha\mathbf{q},y)^T$$, 
where $$\alpha \in (0,1)$$ is the forgetting factor. 
$$\alpha = 1$$ would correspond to no forgetting at all. 
The lower $$\alpha$$, the faster the forgetting.

In Python:

	def update_PLS(P,Q,data,labels):
		k = np.shape(P)[1]
		data_new = np.vstack((alfa*P.T,data))
		label_new = np.hstack((alfa*Q,labels))
		P,W,Q = nipals(data_new,label_new,k)
		return P,W,Q

**More details** can be found in, for instance, [this paper](http://cariparo.dei.unipd.it/documents/corso_psc_07-08/identificazionetermodinamica/articolipls/recursive-pls-algorithms-for-adaptive-data-modeling.pdf) by S. Qin from 1998.