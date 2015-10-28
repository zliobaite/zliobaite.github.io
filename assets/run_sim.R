# 2015 10 01 I.Zliobaite

# comparing dissimilarities
plot_name_res <- 'fig_similarity.png'
library(vegan)

M = 100
N1 = 100
N2 = 100
n = 100

# "manhattan", "euclidean", "canberra", "bray", "kulczynski", "jaccard", "gower", "morisita", "horn", "mountford", "raup" , "binomial" or "chao".

temp <- n
res <- c()
for (n in 0:500)
{
  s1 <- c(rep(1,M),rep(1,N1),rep(0,N2),rep(0,n))
  s2 <- c(rep(1,M),rep(0,N1),rep(1,N2),rep(0,n))
  s <- rbind(s1,s2)
  raup <- 1-vegdist(s, method="raup")  
  jacc <- M / (M + N1 + N2)
  dice <- 2*M / (2*M + N1 + N2)
  sim <- M / min((N1+M),(N2+M))
  forb <- M*(M+N1+N2+n)/((M+N1)*(M+N2))
  pr <- ((M+N1)*(M+N2) + (n+N2)*(n+N1))/((M+N1+N2+n)*(M+N1+N2+n))
  kap <- ((M+n)/(M+n+N1+N2) - pr)/(1-pr)
  res <- rbind(res,c(n,raup,jacc,dice,sim,forb,kap))
} 
n <- temp

temp <- N2
res2 <- c()
for (N2 in 0:200)
{
  s1 <- c(rep(1,M),rep(1,N1),rep(0,N2),rep(0,(n-N2+temp)))
  s2 <- c(rep(1,M),rep(0,N1),rep(1,N2),rep(0,(n-N2+temp)))
  s <- rbind(s1,s2)
  raup <- 1-vegdist(s, method="raup")  
  jacc <- M / (M + N1 + N2)
  dice <- 2*M / (2*M + N1 + N2)
  sim <- M / min((N1+M),(N2+M))
  forb <- M*(M+N1+N2+n)/((M+N1)*(M+N2))
  pr <- ((M+N1)*(M+N2) + (n+N2)*(n+N1))/((M+N1+N2+n)*(M+N1+N2+n))
  kap <- ((M+n)/(M+n+N1+N2) - pr)/(1-pr)
  res2 <- rbind(res2,c(N2,raup,jacc,dice,sim,forb,kap))
} 
N2 <- temp

temp <- M
res3 <- c()
for (M in 0:400)
{
  Nnew <- max(0,(N1 + N2 + 100 - M)/2)
  nnew <- n + N1 + N2 + 100 - 2*Nnew - M
  s1 <- c(rep(1,M),rep(1,Nnew),rep(0,Nnew),rep(0,nnew))
  s2 <- c(rep(1,M),rep(0,Nnew),rep(1,Nnew),rep(0,nnew))
  s <- rbind(s1,s2)
  raup <- 1- vegdist(s, method="raup")  
  jacc <- M / (M + Nnew + Nnew)
  dice <- 2*M / (2*M + Nnew + Nnew)
  sim <- M / min((Nnew+M),(Nnew+M))
  forb <- M*(M+Nnew+Nnew+nnew)/((M+Nnew)*(M+Nnew))
  pr <- ((M+Nnew)^2 + (nnew+Nnew)^2)/((M+Nnew+Nnew+nnew)^2)
  kap <- ((M+nnew)/(M+nnew+Nnew+Nnew) - pr)/(1-pr)
  #print(c(M,Nnew,nnew,pr,kap))
  res3 <- rbind(res3,c(M,raup,jacc,dice,sim,forb,kap))
} 
M <- temp

res4 <- c()
for (x in seq(0,2,0.01))
{
  s1 <- c(rep(1,M*x),rep(1,N1*x),rep(0,N2*x),rep(0,n*x))
  s2 <- c(rep(1,M*x),rep(0,N1*x),rep(1,N2*x),rep(0,n*x))
  s <- rbind(s1,s2)
  raup <- 1-vegdist(s, method="raup")  
  jacc <- M / (M + N1 + N2)
  dice <- 2*M / (2*M + N1 + N2)
  sim <- M / min((N1+M),(N2+M))
  forb <- M*(M+N1+N2+n)/((M+N1)*(M+N2))
  res4 <- rbind(res4,c(x,raup,jacc,dice,sim,forb))
} 


png(plot_name_res)
par(mfrow=c(2,2))
plot(res[,1],res[,2],col = 'black',type = 'l',lwd = 3,ylim=c(0, 1.5),xlab="no. species nowhere",ylab = 'similarity')
lines(res[,1],res[,3],col='blue',lwd = 3)
points(res[,1],res[,4],col='red',lwd = 3)
lines(res[,1],res[,5],col='green',lwd = 3)
lines(res[,1],res[,6],col='brown',lwd = 3)
lines(res[,1],res[,7],col='yellow',lwd = 3)
lines(res[,1],res[,2],col='black',lwd = 3)
plot(res2[,1],res2[,2],col = 'black',type = 'l',lwd = 3,ylim=c(0, 1.5),xlab="no. species in B but not in A",ylab = 'similarity')
lines(res2[,1],res2[,3],col='blue',lwd = 3)
points(res2[,1],res2[,4],col='red',lwd = 3)
lines(res2[,1],res2[,5],col='green',lwd = 3)
lines(res2[,1],res2[,6],col='brown',lwd = 3)
lines(res2[,1],res2[,7],col='yellow',lwd = 3)
lines(res2[,1],res2[,2],col='black',lwd = 3)
plot(res3[,1],res3[,2],col = 'black',type = 'l',lwd = 3,ylim=c(0, 1.5),xlab="no. species in A and B",ylab = 'similarity')
lines(res3[,1],res3[,3],col='blue',lwd = 3)
points(res3[,1],res3[,4],col='red',lwd = 3)
lines(res3[,1],res3[,5],col='green',lwd = 3)
lines(res3[,1],res3[,6],col='brown',lwd = 3)
lines(res3[,1],res3[,7],col='yellow',lwd = 3)
lines(res3[,1],res3[,2],col='black',lwd = 3)
plot(res4[,1],res4[,2],col = 'black',type = 'l',lwd = 3,ylim=c(0, 1.5),xlab="size of the species list (x)",ylab = 'similarity')
lines(res4[,1],res4[,3],col='blue',lwd = 3)
points(res4[,1],res4[,4],col='red',lwd = 3)
lines(res4[,1],res4[,5],col='green',lwd = 3)
lines(res4[,1],res4[,6],col='brown',lwd = 3)
lines(res4[,1],res4[,2],col='black',lwd = 3)
legend(0.1,1.54,c('Raup','Jacc','Dice','Sim','Forb','Kapp'),col = c('black','blue','red','green','brown','yellow'),lty = 1, cex = 0.4)
dev.off()

