# 14.5.2015 I.Zliobaite
# Espoo
# toy example, redlining

set.seed('1981') 
N <- 500

age <- runif(N,20,40)
income <- runif(N,0,10000)
th <- (age-20)/20/2 + 0.5
income <- income*th
risk <- 0.8*(10000-income)/10000 + 0.2*(40-age)/20 

png('fig_risk_income.png',width = 6, height = 7.5, units = 'cm', res = 160)
plot(income,risk,cex = 0.5,cex.lab=0.5, cex.axis=0.5,xlab = 'income',ylab = 'risk')
dev.off()

png('fig_risk_age.png',width = 6, height = 7.5, units = 'cm', res = 160)
plot(age,risk,cex = 0.5,cex.lab=0.5, cex.axis=0.5,xlab = 'age',ylab = 'risk')
dev.off()

png('fig_income_age.png',width = 6, height = 7.5, units = 'cm', res = 160)
plot(income,age,cex = 0.5,cex.lab=0.5, cex.axis=0.5,xlab = 'income',ylab = 'age')
dev.off()

data <- as.data.frame(cbind(risk,income,age))
fit_all <- lm(risk ~ income + age, data=data)
fit_inc <- lm(risk ~ income, data=data)
pr_inc <- predict 

