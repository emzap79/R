setwd("/home/zapata/Unimaterialien/Sommer2014/R")
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
sapply(subset(dat.orig,sex==0,"age"),mean) #Durchschnittsalter der M�nner

#b
age <- dat$age; wrate <- dat$wage/dat$hours; sex <- dat$sex
lwrate <- log10(wrate); lwrate[1:5]
dat <- cbind(dat,wrate,lwrate); dat[1:5,]

##i
wr0 <- subset(dat,sex==0,wrate); wr0[1:5,]
wr1 <- subset(dat,sex==1,wrate); wr1[1:5,]
mwg <- mean(dat$wage); mwg
mwr <- mean(dat$wrate); mwr
maxw <- max(dat$wrate); maxw
ltm <- length(dat$wrate[dat$wrate <= mwr]); ltm
ltm/length(dat$wrate)*100
# 69,027% der Personen erhalten weniger als der Durchschnittsstundenlohn

##ii
cwage <- cut(wrate, breaks=c(0,mean(wrate),max(wrate)), include.lowest=T, labels=c("mies","gut"))
prop.table(table(sex,cwage),2)
prop.table(table(sex,cwage),2)[2,1]*100
# vom Anteil der schlechter verdienenden sind 56,26% Frauen

##iii
cwage <- cut(wrate, breaks=quantile(wrate,(seq(0,1,.1))), include.lowest=T, labels=1:10)
prop.table(table(sex, cwage),2)
prop.table(table(sex, cwage),2)[1,9]*100
# 60.28% des 90% quantils sind M�nnlich. Somit sind Frauen in dieser
# Gehaltsklasse deutlich unterrepr�sentiert!

quantile(wrate, seq(0,1,.1))
quantile(wrate, .9)
prop.table(table(sex))
# das appendix +03 zeigt an, um wieviel einheiten das komma nach links verschoben wurde

# Insgesamt gesehen liegt der M�nneranteil in diesem Quantil mehr als 23% �ber
# dem Durschnitt. Der Anteil der M�nner in der Untersuchung insgesamt
# betr�gt dagegen nur knapp die H�lfte (~49%).

#c
##i
wage <- dat$wage
cor(wrate, wage)

##ii
w1 <- subset(dat, sex==1, wage)
cor(w1, wr1)

##iii
w0 <- subset(dat, sex==0, wage)
cor(w0, wr0)

##iv
#Begr�ndung: Frauen arbeiten in der Regel �fter in Teilzeit als M�nner, daher
#ist die Korrelation zwischen Jahreslohn und Stundenlohn bei M�nnern st�rker
#ausgepr�gt (0.94 zu 0.75).


#Aufgabe 2
#a
table(dat$sector)
tapply(wrate, dat$sector, mean)

#b
median(wrate)
sector <- dat$sector
cwage <- cut(wrate, breaks=c(0,median(wrate),max(wrate)),
             include.lowest=T,prob=T, labels=1:2); levels(cwage)
prop.table(table(cwage,sector),2)
prop.table(table(cwage,sector),2)[1,]
# Prozentualer Anteil Arbeitnehmer mit Unterdurchschnittsverdienst, aufgeteilt
# nach Sektoren.

#c
sd(wrate)/mean(wrate)
# Variationskoeffizient: 2.485

#Aufgabe 3

#a
n <- nrow(dat)
u <- rnorm(n)
est.wr <- lm(wrate+u ~ age); est.wr
#Mit jedem zus�tzlichen Lebensjahr verdient ein Mann 41 Cent mehr.

#b
est.lwr <- lm(lwrate+u ~ age); est.lwr
summary(est.lwr)
# Mit jedem zus�tzlichen Lebensjahr steigt der logarithmierte Lohn um 0.0079, dh.
# der Lohn steigt im Mittel j�hrlich um ~0.008%.

#c
d <- rep(0:1,n)
lwdummy <- lwrate+u+d
lm(lwdummy ~ age)$fitted.values

#Aufgabe 4
summary(lwrate)



