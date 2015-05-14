# 14.5.2015 I.Zliobaite
# Berlin
# toy example, Berkson's paradox

set.seed('1981') 
contests <- runif(400, 0, 100)
jobs <- runif(400, 0, 100)
cojo <- contests + jobs
ind <- which(cojo>=150)

pdf('fig_Berksons.pdf',width = 6/2.54, height = 7.5/2.54)
plot(contests,jobs,cex = 0.5,cex.lab=0.5, cex.axis=0.5,xlab = 'score of jobs',ylab = 'score of contests')
abline(a = 150,b = -1,col='red',lwd=2)
points(contests[ind],jobs[ind],col='red',cex=0.5)
dev.off()

print(cor(jobs[ind],contests[ind]))