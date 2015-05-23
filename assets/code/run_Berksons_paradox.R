# 14.5.2015 I.Zliobaite
# Berlin
# toy example, Berkson's paradox

set.seed('1981') 
contests <- runif(500, 0, 100)
jobs <- runif(500, 0, 100)
cojo <- contests + jobs
ind <- which(cojo>=150)

png('fig_Berksons.png',width = 260,height = 300)
plot(contests,jobs,xlab = 'score of jobs',ylab = 'score of contests')
abline(a = 150,b = -1,col='red',lwd=2)
points(contests[ind],jobs[ind],col='red',cex=0.5)
dev.off()

print(cor(jobs[ind],contests[ind]))