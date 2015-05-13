#homework

myopia <- read.csv("./data/MYOPIA-fixed.csv",header=T)
str(myopia)
summary(myopia)

library(ggplot2)
ggplot(data=myopia,aes(x=SPHEQ,y=MYOPIC))+
    geom_point()
myopia.fit <- glm(MYOPIC~SPHEQ,data=myopia,family=binomial)
myopia$fitted <- myopia.fit$fitted.values

ggplot(data=myopia,aes(x=SPHEQ,y=MYOPIC))+
    geom_point()+
    geom_line(aes(y=fitted))

myopia.fit$dev

logLik(myopia.fit)
