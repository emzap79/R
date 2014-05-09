setwd("/home/zapata/Unimaterialien/Winter12-13/CompStat")
#Klausur: R
#Jonas Petong
#ES0222415903

dat.orig <- read.csv("usa.csv", row.names=1)
dat <- read.csv("usa.csv", row.names=1)

#Aufgabe 1
#a
dat.orig[1:5,]
mean(dat.orig$age)
sapply(subset(dat.orig,sex==1,"age"),mean) #Durchschnittsalter der Frauen
sapply(subset(dat.orig,sex==0,"age"),mean) #Durchschnittsalter der Männer

#b
age <- dat$age; wrate <- dat$wage/dat$hours; sex <- dat$sex
lwrate <- log10(wrate); lwrate[1:5]
dat <- cbind(dat,wrate,lwrate); dat[1:5,]

##i
w0 <- subset(dat,sex==0,wrate); w0[1:5,]
w1 <- subset(dat,sex==1,wrate)
meanw <- mean(dat$wrate); meanw
maxw <- max(dat$wrate)
ltm <- length(dat$wrate[dat$wrate <= meanw])

ltm/length(dat$wrate)*100

##ii
cwage <- cut(wrate, breaks=c(0,mean(wrate),max(wrate)), include.lowest=T, labels=1:2); cwage
prop.table(table(sex,cwage),2)[1,1]*100

##iii
cwage <- cut(wrate, breaks=quantile(wrate,(seq(0,1,.1))), include.lowest=T, labels=1:10)
prop.table(table(sex, cwage),2)[1,9]*100

#c
##i
wage <- dat$wage
cor(wrate, wage)

##ii
wage1 <- subset(dat, sex==1, wage)
cor(wage1, w1)

##iii
wage0 <- subset(dat, sex==0, wage)
cor(wage0, w0)

##iv
#Begründung: Frauen arbeiten in der Regel öfter in Teilzeit als Männer, daher
#ist die Korrelation zwischen Jahreslohn und Stundenlohn bei Männern stärker
#ausgeprägt (0.94 zu 0.75).


#Aufgabe 2
#a
table(dat$sector)
tapply(wrate, dat$sector, mean)

#b
median(wrate)
sector <- dat$sector
cwage <- cut(wrate, breaks=c(0,median(wrate),max(wrate)),
  include.lowest=T,prob=T, labels=1:2); cwage
prop.table(table(cwage,sector),2)[1,]

###
mwr <- median(dat$wrate)
quantile(dat$wrate,prob=.5)
table(dat$wrate<=mwr)
apply(dat$wrate, dat$sector) <= tapply(dat$wrate, dat$sector, median)
###

#c
sd(wrate)/mean(wrate)

#Aufgabe 3

#a
n <- nrow(dat)
u <- rnorm(nrow(dat))
lm(wrate+u ~ age)
#Mit jedem zusätzlichen Lebensjahr verdient ein Mann 40 Cent mehr.

#b
summary(lm(lwrate+u ~ age))
#Mit jedem zusätzlichen Lebensjahr steigt der logarithmierte Lohn um 0.008.

#c
d <- rep(0:1,n)
lwdummy <- lwrate+u+d
lm(lwdummy ~ age)$fitted.values

#Aufgabe 4
summary(lwrate)



