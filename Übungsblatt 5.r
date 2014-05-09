  1:9
a <- (1:9)
mean(a)
b1<- rep(1,3)
b2<- rep(2,3)
b3<- rep(3,3)
b<- c(b1, b2, b3)
c<-rep(1:3,3)
d<-rep(1:4,c(1,2,3,3))
d
d<-rep(1:4, c(1:3,3))
d
A<-matrix(c(a,b,c,d),nrow=4, ncol=9, byrow=T)
A
dat1<-data.frame(a,b,c,d)
dat1
names(dat1)<-c("x1","x2","x3","x4")
dat1
x<-as.logical(dat1[,2]==2)
x

2+3*(4+5*(6+7*(8+9)))

2^11

log(2)

log10(2)

333^(-2)

i<-1:20

sum(0.1*(i^3))

i<-1:20
prod(i^0.4)
x<-77617
y<-33096
(1335/4)*y^6+x^2*(11*x^2*y^2-y^6-121*y^4-2)+(11/2)*y^8

a<-1:4
b<-c("Susi","Carmen","Herbert","Karl")
c<-c(1,1,0,0)
d<-c(22,24,21,27)

dat<-data.frame(a,b,c,d)
dat

names(dat)<-c("pid","name","sex","age")
dat

dat2<- dat[,2]
dat2

dat2<-subset(dat,,c("name","age"))
dat2

dat2<-data.frame(c(dat["name"],dat["age"]))
dat2

dat3<- subset(dat,name=="Susi",,)
dat4<- subset(dat,name=="Karl",,)
dat3<- rbind(dat3,dat4)
dat3

write.table(dat,file=="daten")
dat

write.table(dat,file="test.dat")

save(dat,file="dat.Rdata")

rm(dat)

dat<-read.table("test.dat")
dat

write.csv2(dat,file="test.scv")

rm(dat)

read.csv2("test.csv")

a<-1:4
b<-c("Susi","Carmen","Herbert","Karl")
c<-c(1,1,0,0)
d<-c(22,24,21,27)

dat<-data.frame(a,b,c,d)
dat

write.table(dat,file="test.csv")
rm(dat)
dat<-read.table("test.csv")
dat

names(dat)<-c("pid","name","sex","age")

o<-order(dat$age)
dat[o,]

o<-order(-dat$age)
dat[o]

d<- read.csv("usa.csv")
summary(d)

#Übungsblatt 4

#Aufgabe 1

#a
set.seed(123); x <- round(rlnorm(1000)*1000)
mean(x)
hist(x,prob=T,nclass=50)  
summary(x)
# prob für erlative Anteile nclass Nummer der Klassen
# Unterschied zwischen mean und median deutet auf eine schiefe Verteilung 

#b
summary(x)

#c
quantile(x,p=1:9/10)

#d
IQR(x)
quantile(x, 0.75)-quantile(x,0.25)
#IQR - da liegen die mittlere 50% der Verteilung
sd(x)
#sd für standardabweichung
sqrt(1/n-1)*sum((x-mean(x))^2))
#achte (n-1)
mean(abs(x-median(x)))
1/length(x)*sum(abs(x-median(x)))

#e
#Schiefe

mean((x-mean(x))^3)/sd(x)^3
# verteilung stark nach links verschoben
#Kurtosis
# x <- rnorm(100000)
mean((x-mean(x))^4)/sd(x)^4-3
# 3 abziehen wegen der Verteilungsform
#je näher zu Null desto näher zu normalverteilung


#Aufgabe 2
x<-rep(1:3,4)
y<-rep(1:2,6)
z<-c(1:2,1:3,1:4,3:5)

#a
table(x,y)
table(x,z)
table(z,y)

#b
tab <- table(x,y,z)
tab

#addmargins(table(x,y))
#Addmargins für Randhäufikeiten der Tabelle

#c
#Randverteilung 
margin.table(tab,1:2)
#Margins von den Variablen Nummer 1 und 2 - x und y

addmargins(margin.table(tab,c(1,2)))
#für die Angabe der bestimmten Variablen der mehrdimensionallen Tabelle addmargins(margin.table(table,c(1,2)))

#d
a<-table(x,y,z)
a
b<-table(z,y,x)
b
#Musterlösung
tabxyz<- table(x,y,z)
tabxzy<- table(x,z,y)
tabxyz
tabxzy

#e
ftabxyz<-ftable(x,y,z);ftabxyz
ftabxzy<-ftable(x,z,y);ftabxzy
#... usw

#f
Randverteilung von Y, Z
margin.table(tab,c(1,2))
table(y,z)
#mit Randsummen
addmargins(margin.table(tab,2:3))
addmargins(table(y,z))
# bei beiden Varianten kommt das gleiche raus
'Relativ
prop.table(margin.table(tab,2:3))
prop.table(table(y,z)
#bedingt auf Y=y
prop.table(margin.table(tab,2:3),1)
prop.table(table(y,z),1)

#Aufgabe 3
setwd("Z:/compstat") 
dat<-read.csv("usa.csv")
#dat[zeilen,spalten]
dim(dat)
dat

daher als in der originaldatei semikolon und komma als trennzeichen verwendet werden, müssen wir read.csv nehmen, sonst read.table

#a
summary(dat)
summary(dat[,2])
#39340
mean(dat$wage)

#b
a<-dat[,2:3]
summary(a)
names(a)
b<-subset(dat, 'sex'=0, c('wage', 'sex'))
summary(b)
summary(a)

a<-subset(dat, sex==0, c("wage"))
b<-subset(dat, sex==1, c("wage"))
c<-mean(b)/mean(a)
c

names(dat)
#tapply(dat$wage,dat$sex,mean)
(11:15)[1:5==3] 
dat$sex[1:15]
(mean(dat$wage[dat$sex==1]/mean(dat$wage[dat$sex==0])-1)*100
wm<-dat$wage[dat$sex==0];length(wm)
#wm für wage männer
ww<-dat$wage[dat$sex==1];length(ww)
#ww für wage women
mean(wm)/mean(ww)*100-100
# alternativ 
(mean(wm)/mean(ww)-1)*100
# 82,3%

#c
names(dat)
wagerate<-dat[,2]/dat[,5]
summary(wagerate)
dat1<-data.frame(dat,wagerate)
summary(dat1)
wrm<-subset(dat1, sex==0, c("wagerate"))
wrw<-subset(dat1, sex==1, c("wagerate"))
mean(x)/mean(y)*100-100

#d
missing<-subset(dat,pid==0, c("wage"))
agriculture<-subset(dat,pid==1, c("wage"))
energy<-subset(dat,pid==2, c("wage"))
mining<-subset(dat,pid==3, c("wage"))
manufacturing<-subset(dat,pid==4, c("wage"))
construction<-subset(dat,pid==5, c("wage"))
trade<-subset(dat,pid==6, c("wage"))
transport<-subset(dat,pid==7, c("wage"))
bank<-subset(dat,pid==8, c("wage"))
services<-subset(dat,pid==9, c("wage"))

names(dat)
table(dat$sector)
summary(dat1$wagerate)
w1<-dat1$wagerate[dat1$sector==1];length(w1)
mean(w1)
#19,66€
#logischerweise sollte man an der stelle eine schleife anwenden
sv<-0:7;sv
erg<-rep(0,8);erg
for (i in 1:8) {
#i<-1
  wi<-dat1$wagerate[dat1$sector==sv[i]]
    erg[i]<-mean(wi)
    }
 erg
 
tapply(dat1$wagerate,dat1$sector,mean)
#kommand tapply kann man alternativ zu einer schleife verwenden: geht schneller

#myf für "my function"
myf<-function(a)mean(abs(a-median(a)))    
myf    
myf(1:100)
tapply(dat1$wagerate,dat1$sector,mean)
tapply(dat1$wagerate,dat1$sector,myf)
#Sektor 3 enthält hohe streuung der löhne

tappply(dat1$wage,dat1$sector,mean)
nams<-c("Missing","Agric","Manufact","Construction","Trade","Transport","Bank","Services")
sec<-round(tapply(dat1$wage,dat1$sector,mean));sec

#e

#?cut
#eine Gruppierungsvariable wird als factor betrachtet
#range of x - spannnweite. Wird in intervalle unterteilt. Dem wird code zugeordnet
#right=true heiss der rechte wert des Intervalls gehört noch zu diesem Intervall (zB 10 bis 20, 20 gehört dazu)

w<-dat1$wagerate
cwage<-cut(w,breaks=quantile(w,0:3/3),labels=1:3, include.lowest=T)
table(cwage)
length(cwage)
length(w)
summary(cwage)

#f
table(dat2$sex)
table(dat2$cwage)
table(dat2$sector)

#i.
wwomen<-dat2$wagerate[dat2$sex==1]
summary(wwomen)
cwwomen<-cut(wwomen,breaks=quantile(w,0:3/3),labels=1:3,include.lowest=T)
table(cwwomen)
perc_women<-length(cwwomen[1])/length(cwwomen)
perc_women
length(cwwomen)
1726
tab3<-table(dat2$sex,cwwomen)
summary(tab3)
prop.table(margin.table(dat2,dat2$sex==1)

w<-dat1$wage
cwage<-cut(w,breaks=quantile(w,0:3/3),labels=1:3, include.lowest=T)

sex<-dat2$sex
sector<-dat$sector
table(cwage[sex==1]/sum(sex==1)
#sollte an der stelle so funktionieren, vlt habe ich zu der zeit schon  was an der dataframe geändert
#42,35,22%

#ii.
table(cwage[sex==0])/sum(sex==0)
#oder mit table sex,wage
table(sex,cwage)
prop.table(table(sex,cwage),1)
#prop.table für proportional rates tabelle verteilt nach der ersten variable

#iii.
table(sex[cwage==3])/sum(cwage==3)
#vektor, enthält nur die geschlechtangaben der personen im obersten einkommensdrittel
prop.table(table(sex,cwage),2)
mean(sex==0)

#iv.
table(sector[cwage==3])/length(sector[cwage==3]) 
#anteile der personen in unterschiedlichen sektoren vom obersten einommensdrittel
table(sector[cwage==1])/length(sector[cwage==1])

tab<-cbind(
  hoch=round(table(sector[cwage==3])/length(sector[cwage==3]),2),
  niedrig=round(table(sector[cwage==1])/length(sector[cwage==1]),2))
  rownames(tab)<-nams;tab 
  #oder wieder in der zweidimensionaler tabelle
  
table(cwage,sector)  
tab<-round(t(prop.table(table(cwage,sector),1))[,-2],2);tab 
rownames(tab)<-nams
tab
#das "T" vor der prop.table bedeutet transponierte tabelle


#Verteilungen

#  d für density
dnorm(0)
x<-seq(-4,4,0.1)
fx<-dnorm(x)
plot(x,fx,main="Standardnormalverteilung",lwd=2,col=2,type="1")

#p für probability
pnorm(1.96)
Fx<-pnorm(x)
plot(x,Fx,main="Standardnormalverteilung",lwd=2,col=2,type="1")

#q quantilen
qnorm(0.975)
p<-seq(0.01,0.99,0.01)
Qp<-qnorm(p)
plot(p,Qp,main="Standardnormalverteilung",lwd=2,col=2,type="1")

#r für random, zufallzahl
z<-rnorm(100000,2,2)
#100.000 normalverteilten zufallszahlen
hist(z,prob=T,nclass=100, ylim=c(0,0.45))
lines(x,fx,lwd=1.5,col=2)
mean(z)
sd(z)
z<-sort(z)
fz<-dnorm(z,mean(z),sd(z))
lines(z,fz,col=3,lwd=2)
#col für color, lwd für line width

plot(0:10,dpois(0:10,2),col=2,lwd=2)
#Dichte der Poisson-Verteilung

plot(0:10,dpois(0:10,2),col=2,lwd=2,type="h")
#für diskrete Darstellugn der Poisson-Verteilung

lines(z,dt(z,5),col=4,lwd=1)
#Dichte der t-Verteilung
lines(z,dt(z,50),col="pink",lwd=1)

#Kürzel für  Verteilungen

# d density
# p probability
# q quantiles
# r random numbers

hist(runif(1000,-5,1))
dnorm(0)
#unif für Uniform

#Übungsblatt 5
setwd("Z:/compstat")

#Aufgabe 1
set.seed(123)
n<-120
x<- rnorm(n,20,4)
plot(density(x),col="red",lwd="2")
#a
dnorm(18,20,4)

#b
Fx<-pnorm(18,20,4)
Fx

#c
sum(x<=18)/n
mean(x<=18)
1-Fx

#d
hist(x)
points(qnorm(0.1,20,4),0)
points(qnorm(0.9,20,4),0)
points(qnorm(0.1,20,4),dnorm(qnorm(0.1,20,4),20,4), pch=21, col=4, lwd=2)
points(qnorm(0.9,20,4),dnorm(qnorm(0.9,20,4),20,4), pch=21, col=4, lwd=2)

#e
sum(x>=qnorm(0.1,20,4)||x<=qnorm(0.9,20,4))/n

# Aufgabe 2

#a 
d<-read.csv("usa.csv")
summary(d)

#b 
logwage<-log(d$wage)
d<-cbind(d,logwage)
summary(d)
summary(d$logwage)
mean(d$logwage)
var(d$logwage)
sd(d$logwage)^2

#c
hist(d$logwage,mean(d$logwage),sd(d$logwage), col=2, lwd=2, freq=F)
x<-seq(6,14,0.01)
density<-dnorm(x,mean(d$logwage),sd(d$logwage))
lines(x,density)

#d
?ecdf
plot.ecdf(d$logwage)

lines(x,pnorm(x,mean(d$logwage),sd(d$logwage)), col=2)