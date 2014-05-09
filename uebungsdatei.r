#####################################
### Übung ## Einführung in R #####
#####################################
Jonas Petong
Wintersemester 2012/13

#Computergestützte Statistik: Übungsaufgaben WS12/13

### Verzeichnis setzen ###
setwd("Z:/Zapata/CompStat/") #Arbeitsordner setzen 
setwd("C:/Users/jonas.petong/CompStat") #Handelsraum
setwd("/home/zapata/Unimaterialien/Winter12-13/CompStat/") #zu Hause

### Laden der Pakete ###
library(MASS)  #Laden des Buches

### Kopieren als PDF ###
### g ## Kopieren von Grafiken als PDF
dev.copy(device = pdf, file = "fig3.pdf",
  width = 4, height = 3, pointsize = 12, 
  onefile = FALSE, paper = "special");
  dev.off()  

### Aufgabenblatt 1 ###
#######################

#Aufgabe 1
### a
a <- (1:9);a

### b
b <- rep(1:3, each=3);b

### c
f <- rep(1:3,3);f

### d
d <- rep(1:4, c(1,2,3,3));d

### e
A <- matrix(c(a,b,f,d), nrow=4, ncol=9, byrow=F);A
A <- matrix(c(a,b,f,d), nrow=4, ncol=9, byrow=T);A  #Korrekter Lösungsweg

m <-cbind(a,b,c,d);m
class(m)

### f
dat1 <- data.frame(a,b,f,d);dat1 

#Korrekte Lösung:
dframe <- data.frame(a,b,f,d);dframe
dframe <- as.data.frame(m);dframe
class(dframe)

### g
names(dframe) <-c("x1","x3","x3","x4");dframe
names(dframe)


### Exkurs: Data-Frame
z <- list(c(1:3),c(5:7),c(7:9))
x <- as.data.frame(do.call(rbind,z))
names(x)=c("one","two","three")

### h
logi <- (dframe$x2 == 2);logi
as.numeric(logi)

# Aufgabe 2
#alleine Rechnen!

#Aufgabe 3
sum((1:20)^3*0.1)
prod((1:20)^0.4)

x <- 77617
y <- 33096
1335/4*y^6+x^2*(11*x^2*y^2-y^6-121*y^4-2)+11/2*y^8

### Aufgabenblatt 2 ###
#######################
#Aufgabe 1
### a
pid <- c(1,2,3,4);pid
name <- c("Susi","Carmen","Herbert","Karl")
sex <- c(1,1,0,0);sex
age <- c(22,24,21,27)
dat1 <- data.frame(pid,name,sex,age);dat1
dat2 <- subset(dat1,,c("name","age"));dat2 #Wählt die Spalten Name und Age
	#alt1: dat2 <- subset(dat1,,c("name","age"));dat2
	#alt2: dat2 <- subset(dat1,select=c(name,age));dat2 

### b
dat3 <- dat1[c(1,4),]
#bzw.
#dat3 <- subset(dat1,name==c("Susi","Karl"));dat3

### c
write.table(dat1, file = "test.r")
rm(dat1); dat1
dat1 <- read.table("test.r"); dat1

### d
write.table(dat1, file = "test.csv", sep = ";", dec=",", col.names =NA)
rm(dat1); dat1
dat1 <- read.csv2("test.csv", row.names=1); dat1
 
### e ## Sortieren einer Matrix
oage <- order(dat1$age);oage
dat1[oage,]

# Aufgabe 2
# Datensatz ###
d <- read.csv("usa.csv", row.names = 1); d[1:5,]

### a 
dim(d)

### b
names(d)

### c
wagerate <- d$wage/d$hours
dat <- cbind(d,wagerate); dim(dat)

### d
logwagerate <- log10(dat$wagerate)
dat <- cbind(dat,logwagerate); dat[1:5,]
dim(dat) #Variablen

### e
write.csv(dat, file = "usa2.csv")
	#alt1: write.csv2(d2, file = "usa2.csv")
	#alt2: write.table(d2, file = "usa2.csv", sep = ";", dec = ",", col.names= NA)

### f
rm(dat)
dat <- read.csv("usa2.csv", row.names=1); dat[1:5,]

### g
dim(d); names(d)

### Aufgabenblatt 3 ###
#######################
#Aufgabe 1
### a
set.seed(1)
x <- c(rnorm(500),rnorm(500,mean=5,sd=4))
y <- 2*x+rnorm(1000)

graphics.off()
par(las=1, mfrow=c(3,1), cex = .7, mar = c(5, 4, 4, 2) + 0.1)  
	#Setzt Anzahl der Fenster, Beschriftungs- und Fenstergröße.

hist(x, breaks = "Sturges", main = "Sturges")$breaks
hist(x, breaks = "scott", main = "Scott")$breaks
hist(x, breaks = "FD", main ="FD", xaxs = "s", yaxs = "s")$breaks

nclass.Sturges(x); hist(x)
	#Empfohlene Klassengröße, basierend auf Spannweite der Daten.
nclass.scott(x); hist(x)  
	#Empfohlene Klassengröße, basierend auf Varianz.
nclass.FD(x); hist(x)  
	#Empfohlene Klassenbreite, basierend Interquartilsabstand (IQR).

### b
hist(x, nclass=5, main="nclass=5")  
hist(x, nclass=15, main="nclass=15")
hist(x, nclass=30, main="nclass=30")  #Histogramm

### c ## XY -Streudiagramm
cor(x,y); cov(x,y); plot(x); plot(y); plot(x,y)

plot(x,y, main = "DiagrTitel")
plot(x,y, main = "DiagrTitel", col = "green", type = "p", pch = 3, ylab = "Preis", xlab = "volatility")

### d
abline(lm(y ~ x), lwd = 2, col = 4)  #Liniengraphik
lines(x, lm(y ~ x)$fitted.values, lwd = 3, col = 2)
plot(1:1000,x,type="l", main="Zeitreihe",xlab="Zeit")  #Zeitreihe

### e
par(las=1, mfrow=c(2,1), mar = c(3,2,2,1))
xy <- as.data.frame(cbind(x,y)); class(xy)
boxplot(xy, main="Ein Boxplot für zwei Verteilungen", col="grey",
    sub="Boxplots bieten viele Inormationen auf engem Raum", 
    cex.sub=0.8)

names(boxplot.stats(x))
boxplot.stats(x)$stats #Whisker, Quantil(1), Median, Quantil(3), Whisker(oben)

### f
legend(0.45,35, c("Oberer Whisker","Quantil 3","Median","Quantil 1", "Unterer Whisker"), ncol = 1, pch = "-+", bty = 3, col = 2, cex = 0.6)


### g ## Kopieren von Grafiken als PDF
dev.copy(device = pdf, file = "fig1.pdf",
  width = 4, height = 3, pointsize = 12, 
  onefile = FALSE, paper = "special");
  dev.off()        


#Aufgabe 2
d <- read.csv("usa2.csv", row.names=1); d[1:5,]

### a
hist(d$wage)
hist(d$wage, nclass=1000)

### b
hist(d$wagerate, nclass=1000)

### c
hist(d$logwagerate, nclass=100)

### d
10^1.2
median(d$wagerate)

### e
age <- d$age+runif(nrow(d),c(-0.3,0.3))
plot(d$age, d$logwagerate, pch=20, cex=0.6)
plot(age, d$logwagerate, pch=20, cex=0.6)

### Aufgabenblatt 4 ###
#######################
#Aufgabe 1
### a
par(las=1, mfrow=c(3,1), mar=c(5,4,4,2)+.1)
set.seed(123) #Initialisierung des Zufallsgenerators 
x <- round(rlnorm(1000)*1000) #Generieren (gerundeter) initialisierter Zufallswerte

truehist(x, nbins=300)
hist(x, prob=T, nclass=50)
hist(x, breaks = "Sturges", main = "Sturges")
hist(x, breaks = "Scott", main = "Scott")
a <- hist(x, breaks = "FD", main = "FD");a

### b
summary(x)
boxplot.stats(x)$stats
    #Die Starke Abweichung des arithm. Mittels vom Median
    #weist auf eine Schiefe Verteilung hin!

### c
qa <- quantile(x, seq(0.1, 0.9, 0.1)); qa #Dezile der Verteilung
    #alt1: quantile(x, probs=seq(0.1, 0.9, 0.1))
    #alt2: quantile(x,p=1:9/10)

### d
IQR(x) #Quartilsabstand
	#alt1: IQR(x)
	#alt2: quantile(x,0.75)-quantile(x,0.25) 
	#In diesem Bereich liegen die mittleren 50% der Verteilung.

sd(x) #Standardabweichung
mean(abs(x-median(x)))
  #alt1: mean(abs(x-median(x)))
  #alt2: 1/length(x)*sum(abs(x-median(x))))
  #Mittlere Absolute Abweichung vom Zentralwert.
  
median(x) #Median

### e
### Wölbung ###
mean(((x-mean(x))/sd(x))^3)
    #Die Verteilung ist Steil.

### Kurtosis ###
set.seed(123); x <- rnorm(100000)
mean(((x-mean(x))/sd(x))^4)-3
    #Die Verteilung ist linkssschief (da < 0).

#Aufgabe 2
### a
x <- rep(1:3,4); y <- rep(1:2,6); z <- c(1:2,1:3,1:4,3:5); o <- seq(5,38,3)
table(x,y); table(x,z); table(y,z)
    #Zur Veranschaulichung: rbind(x,z); table(x,z)
    #Gemeinsames Auftreten der Zahlen beider Vektoren.

### b
tab <- table(x,y,z); tab
addmargins(table(x,z))

### c
#Randverteilung x,y
margin.table(table(x,y,z), c(1,3))
    #Die Funktion stellt aus den 3 Dimensionen
    #der Tabelle (=Quader) nur Dimension 1 und 3 dar.

### d
tabxyz <- table(x,y,z);tabxyz
tabxzy <- table(x,z,y);tabxzy
tabyxz <- table(y,x,z);tabyxz
tabyzx <- table(y,z,x);tabyzx #... usw. 
    #Auf diese Weise lassen sich alle
    #Permutationen der drei Vektoren darstellen.

### e
ftabxyz <- ftable(x,y,z);ftabxyz 
    #Darstellung nach der 'z' Ausprägung
ftabxzy <- ftable(x,z,y);ftabxzy  
ftabyxz <- ftable(y,x,z);ftabyxz #... usw.

### f
#Randverteilung von Y,Z
margin.table(table(x,y,z,o),c(2,3)) 
    #entspricht: table(y,z)

#mit Randsummen
addmargins(margin.table(tab,2:3)) 
    #entspr.: addmargins(table(y,z))
    #An die Tabelle werden die Randverteilungen hinzugefügt.

#Relativ
as.data.frame(rbind(y,z))
prop.table(margin.table(tab,2:3))

#Bedingt auf Y=y
as.data.frame(rbind(y,z))[y==2]
prop.table(table(y,z),1) 
   	#Gegeben dass Y (= bedingte Variable) den Wert 1 hat, haben 16% aller Ausprägungen den Wert 5. Die Stichprobengröße verringert sich die hälfte der Beobachtungen.
    
#Aufgabe 3
### a
tab <- read.csv("usa2.csv", row.names=1); tab[1:5,]
mean(tab$wage)

### b
#alt1:
w0 <- colMeans(subset(tab,sex==0,"wage"))
w1 <- colMeans(subset(tab,sex==1,"wage"))

#alt2:
w0 <- mean(tab$wage[tab$sex==0])
w1 <- mean(tab$wage[tab$sex==1])

#alt3:
w0 <- tapply(tab$wage,tab$sex,mean,simplify=F)$"0"; w0
w1 <- tapply(tab$wage,tab$sex,mean,simplify=F)$"1"#Zeigt arithm. Mittel der Frauen.

w0/w1*100 
    #Das Mittlere Jahreseinkommen der Männer liegt um 82,3% über dem der Frauen.
    
### c
w0 <- mean(tab$wagerate[tab$sex==0])
w1 <- mean(tab$wagerate[tab$sex==1])
w0/w1*100
    #Der Unterschied ist weniger deutlich, da viele Frauen nur Teilzeit arbeiten.

### d
#Manuelle Lösung
tab[1:5,]
datsec0 <- mean(subset(tab,sector == 0,c("wagerate"))); datsec0
datsec1 <- mean(subset(tab,sector == 1,c("wagerate"))); datsec1
datsec2 <- mean(subset(tab,sector == 2,c("wagerate"))); datsec2
datsec3 <- mean(subset(tab,sector == 3,c("wagerate"))); datsec3
datsec4 <- mean(subset(tab,sector == 4,c("wagerate"))); datsec4
datsec5 <- mean(subset(tab,sector == 5,c("wagerate"))); datsec5
datsec6 <- mean(subset(tab,sector == 6,c("wagerate"))); datsec6
datsec7 <- mean(subset(tab,sector == 7,c("wagerate"))); datsec7
datsec <- c(datsec0,datsec1,datsec2,datsec3,datsec4,datsec5,datsec6,datsec7)
names(datsec) <- c(1:8); datsec

#Automatische Lösung: Tapply
sort(unique(tab$sector))
tapply(tab$wagerate,tab$sector,mean)

### e
w <- tab$wagerate; w
cwage <- cut(w, breaks=quantile(w, seq(0,1,1/3)), labels=1:3, include.lowest=T); cwage
table(cwage); length(cwage)
    #Dieser Vektor zeigt uns, zu welchem Lohndrittel eines Sektors eine Person gehört.
    
### f
tab2 <- table(tab$sex,cwage); tab2
ftab <- ftable(tab$sex,cwage,tab$sector);ftab

###################################################################
###################################################################
cwage <- cut(tab$wagerate, breaks=(quantile(tab$wagerate, seq(0,1,1/3))), include.lowest=T, label=1:3)
wr <- tab$wagerate
sex <- tab$sex
tab <- read.csv("usa2.csv", row.names=1); tab[1:5,]
tab2 <- table(tab$sex,cwage); tab2
ftab <- ftable(tab$sex,cwage,tab$sector);ftab

#i. Wieviel Prozent der Frauen liegen im untersten Einkommensdrittel?
prop.table(table(sex,cwage),2)[1,1]

#ii. Wieviel Prozent der Männer liegen im obersten Einkommensdrittel?
prop.table(table(sex,cwage),1)[1,3]

#iii. Wie hoch ist der Anteil der Männer im obersten Einkommensdrittel, wie hoch insgesamt?
prop.table(table(sex,cwage),2) #59,7%
addmargins(prop.table(table(sex,cwage))) #48,8%

#iv. Vergleichen Sie die sektorale Beschäftigungsstruktur der Personen im obersten Einkommensdrittel mit der im untersten Einkommensdrittel. Was fällt Ihnen besoners auf?
addmargins(prop.table(table(sex,cwage)))
prop.table(table(sex,cwage),2)


###################################################################
###################################################################

#(i) Wieviel % der Frauen liegen im untersten Einkommensdrittel?
tabprop <- prop.table(table(tab$sex,cwage),1)
tabprop[2,1]
    #Wahrscheinlichkeitsverteilung der
    #relativen Häufigkeiten (Männer). 

#(ii) Wieviel % der Männer liegen im untersten Einkommensdrittel?
tabprop[1,1]
#oder
table(tab$sex[cwage==1])/sum(cwage==1) 
 
#(iii) Wie hoch ist der Anteil der Männer im obersten Einkommensdrittel
table(tab$sex[cwage==3])/sum(cwage==3) 
mean(tab$sex==0)
    #alt1: table(sex[cwage==3])/sum(cwage==3)
    #alt2: prop.table(table(sex,cwage),2)

#(iv) Vergleichen Sie die sektorale Beschäftigungsstruktur der Personen im obersten Einkommensdrittel mit der im untersten Einkommensdrittel. Was fällt Ihnen besoners auf?
sex <- tab$sex
sector <- tab$sector
nams <- c("A","B","C","D","E","F","G","H")

table(cwage,sector)
tab <- round(t(prop.table(table(cwage,sector),1)[,-2],2);tab
    #alt1: table(cwage,sector); tab <- round(t(prop.table(table(cwage,sector),1)[,-2],2);tab
    #alt2: table(sector[cwage==3])/length(sector[cwage==3])
    #      table(sector[cwage==1])/length(sector[cwage==1]) 

rownames(tab) <- nams; tab
   
   ### Grafische Verfeinerungen ###
tab <- cbind (
  hoch=round(table(sector[cwage==3])/length(sector[cwage==3]),2),
  niedrig=round(table(sector[cwage==1])/length(sector[cwage==1]),2)
  ) 
tab[1:5,]
cbind(tab,cwage)[1:5,]

### Aufgabenblatt 5 ###
#######################
###################################################################
###################################################################
n <- 120; set.seed(123)
x <- rnorm(n,20,sqrt(16))
truehist(x)
hist(x,nclass="FD", prob=1)
hist(x,nclass="FD")

#a
dnorm(18,20,4)

#b
pnorm(18,20,4)

#c
length(x[x<=18])/length(x)
	#Prozentsatz der Beobachtungen für einen Wert <= 18.

#d
hist(x, prob=1)
points(qnorm(0.1,20,4),0,pch=19,cex=2,col=2)
points(qnorm(0.9,20,4),0,pch=19,cex=2,col=2)

#e
u <- qnorm(0.1,20,4)
o <- qnorm(0.9,20,4)
mean(u<=x&o>=x)
	#86% der Realisationen liegen zwischen dem ersten und letzten Dezil der Verteilung.

#f
set.seed(123); rnorm(120,20,4)
u <- qnorm(0.1,20,4)
o <- qnorm(0.9,20,4)
mean(u<=x&o>=x)

#Aufgabe 2
#a
d <- read.csv("usa2.csv", row.names=1)
hist(d$logwagerate, prob=1, nclass="FD")
hist(d$logwagerate, nclass="FD")

#b
l <- d$logwagerate
mean(l)
var(l)

#c
rnorm(n,mean(l),sqrt(var(l)))

#d
par(las=1,mfrow=c(2,1),mar=(5,4,4,2))
hist(l, nclass="FD", prob=1)
lines(sort(l),dnorm(sort(l),mean(l),sd(l)), col=4, lwd=2)
lines(sort(l),pnorm(sort(l),mean(l),sd(l)), col=3, lwd=2)
graphics.off()

#e
ecdf(l)
plot.ecdf(l)
?ecdf
#oder
lines(sort(l),pnorm(sort(l),mean(l),sd(l)))

### Aufgabenblatt 6 ###
#######################
#Aufgabe 1
#a
set.seed(1) 
n <- 20
x <- rnorm(n)

b0 <- 1
b1 <- 0.5
xb <- b0+b1*x

set.seed(3)
u <- rnorm(n)
y <- xb + u #Lineare Verteilung mit Störthermen

#b
plot(x,y); lines(x,b0+b1*x)

#c
lm(y~x)
lines(x,lm(y~x)$fitted.values,col=2,lwd=2)

#d
set.seed(5); 
v <- rnorm(20)
points(x,xb+v, col=2, pch="x")

#e
y2 <- xb+v
abline(lm(y2 ~ x), col=3)

#f
#übersprungen


#Aufgabe 2
d <- read.csv("usa2.csv", row.names=1)

#a
plot(d$age,d$logwagerate)

#b
reg <- lm(d$logwagerate ~ d$age); reg

#c
#relative Erhöung des logarithmierten Lohnes um 0,8% bei Steigendem Alter um 1.

#d
reg2 <- summary(lm(d$wagerate ~ d$age)); reg2

### Erklärte Regression
d <- read.csv("usa2.csv")
reg3 <- lm(d$wagerate ~ d$sex + d$age)
summary(reg3)
    #Intercept: Ein nulljähriger Mann hat 8,9$ pro Stunde, mit jedem Lebensjahr gibt es 40 Cent hinzu, als Frau erhielte man 7,93$ weniger

#e
abline((lm(d$logwagerate ~ d$age)), col=3,lwd=2)


#f
rr <- reg$residuals
hist(reg$residuals, nclass="FD", col="red",prob=1)
lines(sort(rr),dnorm(sort(rr),mean(rr),sd(rr))) 







###################################################################
###################################################################
#Aufgabe 1
### a
n <- 120
set.seed(123)
x <- rnorm(n,20,sqrt(16))

### Dichte der Normalverteilung
xx <- seq(0,40,0.1)
fxx <- dnorm(xx,20,4)
plot(xx,fxx,type="l")

f.18 <- dnorm(18,20,4);f.18
segments(18,f.18,18,0) 
    #Veranschaulichung der Dichte an der Stelle 18

### b
x[1]
x[1] <= 18 #Beschreibt Logischen Wert der Variable
x <= 18
sum(x <= 18)/120 #Arithmetisches Mittel der Wahren Werte
#alt1: sum(x <= 18)/120
#alt2: mean(x <= 18)

hist(x, prob=T, nclass=12, col="pink")
    #Empirische Verteilung: prob=T sagt, dass wir Dichten 
    #wählen, anstatt absoluter Häufigkeiten.

### c
points(20,0,col=3,pch=19,cex=2.5) #Gesuchter Erwartungswert  

### d 
unten <- qnorm(0.1,20,4) #Unterer Quantilswert der Normalverteilung
oben <- qnorm(0.9,20,4) #Oberer Quantilswert
points(unten,0,pch=19,cex=2,col=2)
points(oben,0,pch=19,cex=2,col=2)

### e
m <- mean(x>=unten & x<=oben);m
text(15,0.08,round(m,3),cex=3)
    #86,7% liegen zufällig um unseren Erwartungswert.

### Alternativer Ansatz ###
###########################
### c
Fx <- pnorm(18,20,sqrt(16))
1-Fx

### d 
hist(x, lwd=2,col=2)
u <- qnorm(0.1,20,4)
o <- qnorm(0.9,20,4)
points(u,0);points(o,0)

### e 
m <- rnorm(n,20,4)
hist(x)
###########################
###########################

### f
zu Hause!

#Aufgabe 2
### a
d <- read.csv2("usa2.csv"); d[0:5,]
w <- d$logwagerate
hist(w, prob=T, nclass=25, col="pink", main="Histogramm von Logwagerate")
    #Verteilung der logarithmierten Stundenlöhne

### b
mw <- mean(w)
vw <- var(w)

### c
x <- seq(-1,4,0.1)
fx <- dnorm(x,mw,sqrt(vw))
length(x); 
lines(x,fx,col="magenta",lwd=2)

### d
?ecdf

### Empirische Verteilungsfunktion ###
plot.ecdf(w,xlim=c(-0.5,2.5))
    #Theoretische (stetige) Verteilung

### Angepasste Normalverteilung ###
Fx <- pnorm(x,mw,sqrt(vw))
lines(x,Fx,col="magenta",lwd=2)  
    #Treppenfunktion
                        

### Aufgabenblatt 6 ###
#######################
#Aufgabe 1
### a
set.seed(1) 
n <- 20
x <- rnorm(n)

b0 <- 1
b1 <- 0.5
xb <- b0+b1*x

set.seed(3)
u <- rnorm(n)
y <- xb + u #Lineare Verteilung mit Störthermen

### b
plot(x,y, pch  = 19)
lines(x,xb,lwd = 3) #Determinist. Zusammenhang mit wahren Werten

### c
reg <- lm(y~x) #x ist die erklärende Variable, y die zu erklärende.
names(reg)
y.d <- reg$fitted.values;y.d #Angepasste Gerade
lines(x,y.d, lwd = 2, col = "green")

### d
set.seed(5)
v <- rnorm(n) #Störterme
y1 <- xb + v
points(x,y1,col="magenta",pch=19) #Grafische Darstellg. der Störtherme

### e
reg1 <- lm(y1~x)
lines(x,reg1$fitted.values, col="magenta",lwd=2)

### f
#t-Wert: (b - E(b)) / s_b

### Erste Realisation mit Störterm u
sreg <- summary(reg)
sreg$coef #Matrix mit Koeffizienten
b1d <- sreg$coef[2,1]  #b1(Dach)
s1d <- sreg$coef[2,2]
t1 <- (b1d - 0.5)/s1d; t1 #Realisation einer normierten Zufallsvariable
2*pt(-abs(t1),n-2)
#Erklärung: pt(t1, n-2) #Wahrscheinlichkeit diesen, oder einen kleineren Wert zu erhalten (mit 2 Freiheitsgeraden).

### Zweite Realisation mit Störterm v
sreg1 <- summary(reg1)
sreg$coef #Matrix mit Koeffizienten
b1d <- sreg1$coef[2,1]
s1d <- sreg1$coef[2,2]
t1 <- (b1d - 0.5)/s1d; t1 #Realisation einer normierten Zufallsvariable
2*pt(-abs(t1),n-2) #51%: wir liegen nur jedes zweite mal neben der Schätzung.

#Aufgabe 2
d[1:5,]
w <- d$logwagerate
age <- d$age
summary(w)
summary(age)   #Alter liegt zw. 18 und 65 Jahren

### a
plot(age,w,pch=19,col=2)

### b
reg <- lm(w~age) #Wir regressieren den Stundenlohn auf das Alter (= age)
sreg <- summary(reg); sreg
    #Wir erklären die logarithmierte Variable (= Lohn) mit der
    #nicht-logarithmierten Variable alter

summary(lm(d$logwagerate ~ d$age))  #Signifikanztest
#Der Zusammenhang zwischen Alter und logarithmierter 
#Lohnrate ist nur mäßig signifikant.

### c
    #Personen die ein Jahr älter sind haben im Schnitt ein % mehr
    #Lohn als jüngere (= 0.00807)
    
    #Relative Erhöhung von w bei Erhöhung von age um 1.
    
### d
### e
lines(age,reg$fitted,col=4,lwd=2)

### f
names(reg)
hist(reg$residuals, col="pink", nclass=100, prob=T)
xs <- sort(reg$resid) #Sortierte X-Werte
fxs <- dnorm(xs,mean(reg$resid),sd(reg$resid)) #Dichte an der Stelle xs
lines(xs,fxs,col=2,lwd=2) 
