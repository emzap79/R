# vim:fdm=marker
#####################################
### Mitschrift ## Einführung in R ###
#####################################
# Jonas Petong
# Wintersemester 2012/13
# 1. Einführung# {{{

# Laden der Pakete# {{{

library(MASS)       # Lädt die Dokumentation
library(ggplot2)    # Zum speichern von Grafiken und Plots als PDF
library(gplots)
library(graphics)
library(plyr)

# }}}
# Setzen des eigenen Verzeichnisses# {{{

# setwd("Z:/Zapata/CompStat/")  # Arbeitsordner setzen
# setwd("/home/zapata/Unimaterialien/Winter1213/CompStat")
setwd("/home/zapata/tmp/R")

# }}}
# Vektoren und Matrizen # {{{

# Einfache Vektoroperationen# {{{

w <- c(seq(1,4,1)); w  #Setzt einen Vektor mit Elementen 1 bis 4
#alt1: c(seq(1,4,1))
#alt2: c(1:4)

cumsum(w); cumprod(w)
#Dieser Befehl kummuliert die Einträge des Vektors
#als Summe bzw. Produkt aufeinander auf.

cummin(rev(w))
#Hierbei wird solange abgezählt, bis der niedrigste Wert
#aus dem Vektor 'w' in umgekehrter Reihenfolge erreicht ist.

# }}}
# Erstellen eines Dataframe# {{{

x <- (c("Holger","Marianne","Tobias","Daniela")); x
#Setzt einen zweiten Vektor
y <- (c(15,63,23,43)); y
#Setzt einen dritten Vektor mit Alter
z <- as.logical(c(0,1,0,1));z
dat <- data.frame(x,y,z); dat
#Zusammenfügen der Vektoren zu Data-Frame
names(dat) <- c("Name","Alter","Geschlecht"); dat                  # Benennen der Variablen

# }}}
# Auswahl bestimmter Zeilen und Spalten# {{{

subset(dat, Name == c("Tobias","Daniela"), select = Alter)
#alt1: subset(dat, Name == c("Tobias","Daniela"), c(...))
#alt2: dat[c(3,4), ]                                               # Alternativer Befehl

# Gibt lediglich Daten als True aus, die größer gleich vierzig
subset(dat, Alter >= 40)
#alt1: subset(dat, y >= 40)
#alt2: dat[dat$Alter >= 40,]                                       # note that the trailing ',' is obligatory!

# }}}

# }}}
# Sortierung von Daten # {{{

# Sortieren eines Vektors# {{{

x <- c(2,3,1,4); x
order(x)                    # In welcher Reihenfolge muss zugegriffen
                            # werden, damit der Datensatz am Ende sortiert ist.
x[order(x)]                 # Als Ausgabe erhalten wir die sortierte Reihenfolge.

# }}}
# Sortierung einer Matrix# {{{

x <- c(15,63,23,43)
y <- c(212,182,175,189)
z <- c(0,1,1,1)
xyz <- data.frame(x,y,z)
names(xyz) <- c("Alter", "Größe", "Geschlecht"); xyz

ox <- rev(order(x)); ox
#alt1: ox <- order(-x); ox
#alt2: ox <- rev(order(x)); ox
#Umgekehrte Sortierung des x-Vektors

xyz.ox <- xyz[ox,]; xyz.ox
#Sortiert Zeilen des Dataframe nach der oben
#festgelegten (umgekehrten) Reihenfolge des x-Vektors.

# }}}

# }}}
# Datenexport nach Excel # {{{

# Als Beispiel exportieren wir unsere Daten "daten"
daten

#Kopie erstellen
daten.kopie <- daten

#Nur bestimmte Variablen einlesen in neuen data.frame
daten.zwei <- data.frame(daten$name, daten$x); daten
write.table(daten, file = "test.csv", sep = ";", dec=",", col.names=NA)

#Ausführlich
write.csv2(daten, file = "test.csv")

#Daten wieder einlesen
read.csv("test.csv", row.names=1)
read.csv2("test.csv", row.names=1)
read.table(daten, file = "test.csv", sep = ";", dec=",", col.names=NA)
#Die Endung "csv2" steht für die in Deutschland übliche Trennung mit
#Semikolon. Für die amerikan. Schreibweise reicht 'read.csv'.

# }}}
# Zusammenführen von Daten # {{{

# Hinzufügen von Zeilen und Spalten# {{{

Blutgruppe <- (c("A","B","0","AB")); Blutgruppe
dat <- cbind(dat, Blutgruppe); dat

dat[,1] <- as.character(dat[,1]); dat
dat[,3] <- as.character(dat[,3]); dat
dat <- rbind(dat, c("Thomas",22,FALSE,"B"));dat
#Fügt vorher festgelegten Vektor (= Blutgruppe) zu Matrix als Spalte hinzu. Für das Anbinden von Zeilen gilt analog: 'rbind'

cbind(8, rbind(9, 1:3, 17:19, c("Thomas","Marian","Anna")))
#Kombination aus beiden Befehlen

dat <- dat[-5,]; dat
dat[,4] <- NULL; dat
#alt1: dat[,4] <- NULL
#alt2: dat <- dat[,-4]
#Mit diesem Befehl lässt sich die hinzugefügte Zeile bzw. Spalte wieder entfernen.

# }}}
### Zusammenfügen von Datenfiles nach identifizierenden Variablen# {{{

dat2 <- read.csv2("usa2.csv")[1:5,]
dat3 <- read.csv2("usa2.csv")[6:9,3:9]
library(plyr); dat2;dat3
merge(dat2,dat3, by.x="pid", by.y="sector")
#alt1: merge(dat2,dat3, by.x="pid", by.y="sector")
#alt2: join(dat2,dat3, by.x="pid", by.y="sector") [dazu muss
#zunächst das Paket 'plyr' geladen sein.]

#Vereint den ersten Dataframe mit dem Zweiten, indem übereinstimmungen der Variable 'pid' mit der Variable 'sector' gefunden werden.

# }}}

# }}}

# }}}
# 2. Graphiken# {{{

# Randomisierten Datensatz vorbereiten# {{{

set.seed(123)
x <- rchisq(1000,5)
#Vektor mit 1000 (zufälligen) Einträgen
par(las=1, mfrow=c(3,1), cex = .7, mar = c(5, 4, 4, 2) + 0.1)
#Drei Grafiken pro Seite (von oben nach unten)

# }}}
# Histogramme# {{{

hist(x)   #Histogramm erstellen
length(hist(x)$breaks)    #Zeigt die Anzahl der Klassen im Histogramm.

#Truehist 1
truehist(x, nbins=5, main = "Truehist1")
#Histogramm mit anderen Voreinstellungen (Klassenbreiten, Farben etc.). Evtl. muss vorher das Paket 'Mass' geladen werden: library(MASS)

#Truehist 2
truehist(x, h = 0.25, main = "Truehist2")
#alt1: truehist(x, h = 0.25)
#alt2: truehist(x, breaks = seq(0,20,0.25))

#Truehist 3
truehist (x, main = "Truehist3", breaks = c(-1,2, seq(3,7,0.5),8,20), prob=TRUE)
#Mit dem Argument 'prob=TRUE' wird gewährleistet, dass die Histogrammfläche den Wert 1 annimmt und an der y-Achse die Dichte abgetragen wird. Diese wächst proportional zur Fläche einer Klasse.

# }}}
# Optimale Klassenwahl (S. 26):# {{{

nclass.Sturges(x)
#Empfohlene Klassengröße, basierend auf Spannweite der Daten.

nclass.scott(x); hist.scott(x, main="Scott")
#Empfohlene Klassengröße, basierend auf der Varianz.

nclass.FD(x); hist.FD(x, main="Freedman-Diaconis (FD)")
#Klassenbreite zurückgehend auf Spannweite und Quartilsabstand. Zahl der breaks, entspricht Zahl der Klassen +1.

# }}}
# Erstellen des Barplots (S. 27 ff.)# {{{

# Barplot 1# {{{

par(las=1,mfrow=c(3,1))
x <- sample(1:4, size = 1000, replace = T, prob = rev(seq(0.1,0.8,0.2)))
#Somit erstellen wir 1000 Realisationen aus dem Ziehen und Zurücklegen der Werte eins bis vier.

HV.x <- table(x); HV.x
#Auszählung der Häufigkeiten der vier versch. Ausprägungen.
barplot(HV.x, main = "Ein einfacher Barplot", sub ="Multinomialverteilung", col = c("black","grey30","grey70","white"), xlab ="Ausprägungen", ylab = "Häufigkeit", width = c(1,2,3,4), space = 1)
legend(15,350, c("eins", "zwei", "drei", "vier"), cex = 0.9, fill = c("black","grey30","grey70","white"), ncol = 2)
#Barplot mit weiteren Einstellungen zu Farbe, Überschrift, Achsenbeschriftung etc.

# }}}
# Barplot 2# {{{

y <- sample(0:1, size = 1000, replace = TRUE, prob = c(0.3,0.7))
HV.xy <- table(x,y); HV.xy
#Häufigkeitsverteilung der zweiten Variable mit 1000 Realisationen einer Binomialverteilten Stichprobe.

barplot(HV.xy, col = c(2,4,6,8), main = "Ein anderer Barplot", sub ="Binomialverteilung", xlab ="Ausprägungen", ylab = "Häufigkeit", names.arg = c("Nullen","Einsen"))
legend(0.5,600, c("eins", "zwei", "drei", "vier"), cex = 0.9, fill = c(2,4,6,8), ncol = 2)
#Barplot der Binomialverteilung mit Legende.

# }}}
#Barplot 3 # Alle Farben# {{{

z <- sample(1:8, size = 1000, replace = T, prob = seq(0.1,0.8,0.1))
HV.xz <- table(z)
barplot(HV.xz, col = 1:8, main = "Barplot der Farben", sub = "Multinomialverteilung", xlab = "Ausprägungen", ylab = "Häufigkeit", names.arg = LETTERS[1:8])
legend(0, 200, 1:8, fill = seq(1,8,1), cex = 0.8, ncol = 4)

# }}}

# }}}
# Erstellen eines Punktediagramms (S. 31 ff.)# {{{

# Streudiagramm
par(las=1,mfrow=c(2,1))
x <- runif(n = 100, min = 0, max = 100)
#Somit generieren wir eine mit Zufallszahlen überlagerte lineare Beziehung. Als x-Variable verwenden wir 100 Realisationen einer im Bereich 0 bis 100 gleichverteilten Zufallsvariablen.

y <- 20+x+rnorm(n = 100, mean = 0, sd = 20)
#Die Y-Variable ist eine Zufallsvariable, deren auf X bed. Erwartungswert eine lineare Funktion der X-Werte ist. Die Realisationen einer normalverteilten Zufallsvariablen (= N(0,20)) werden zu den linearen Funktionswerten addiert.

plot(x, main = "X-Variable", sub = "Gleichverteilt von 0 bis 100")
plot(y, main = "Y-Variable", sub = "Überlagerte Normalverteilung")
plot(x,y, main = "XY-Variablen", sub = "Auf X bedingte Y-Variable", pch = 4, xlim = c(-10,120), ylim = c(-20,200), type = "p")
#type p (= Punktdiagramm) oder type l.

# }}}
#Regressionslinien# {{{

abline(lm(y ~ x), lwd = 2, col = "red")
lines(x, lm(y ~ x)$fitted.values, lwd = 3, col = 3)
#Oben: Eine rote OLS-Regressionslinie (= Methode der kleinsten Quadrate). Unten: OLS-Regression für Wertebereich.

#Beispielplot für Aktienverlauf
set.seed(1)
y <- cumsum(rnorm(20))
x <- seq(1,length(y),b = 1)
plot(x,y, xlim = c(0,20), ylim = c(-2,4), type = "l", col="red", lwd=2, lty=1, ylab="Aktienkurs")
legend(0,4,"xy-Aktie", lty=1, col=2, ncol = 4, lwd=2, bty="n")    #Betrachten der zeitl. Entwick. mittels eines Liniendiagramms

# }}}
# Boxplots (S.36)# {{{

#Generieren des Boxplots
set.seed(1)
n <- 21; kC <- cumsum(rnorm(n, mean = .5, sd =1.5))+100; rC <- diff(log(kC))
plot(rC, main = "Aktienkurs", ylab = "Rendite", xlab = "Zeitstrahl", type = "l")
boxplot(rC, boxwex = 0.75,
col = "yellow",
main = "Boxplot für Aktienkurs",
xlab = "Aktienkurs",
ylab = "Rendite", yaxs = "r")
#Die mittlere horizontale Linie in der grauen Box stellt den Median dar. Die graue Box wird oben durch den 2. Quartilswert und unten durch den 1. Quartilswert begrenzt. Die gesamte Box gibt somit den totalen Quartilsabstand (= Interquartilerange) an. Oben und unten ragen aus der Box gestrichtelte Linien mit kleinem Querbalken heraus. Diese werden "Whisker" (Schnurrbarthaar) genannt. Die Länge der Whisker ergibt sich aus dem minimum der 1.5-fachen Länge der Box und dem Abstand der entferntesten Beobachtung. Liegen einzelne Beobachtungen außerhalb der Whisker, werden diese einzeln in die Graphik as Punkte eingezeichnet.

# }}}
#Statistische Kennzahlen# {{{

stat.rC <- round(c(min(rC),
max(min(rC),quantile(rC,0.25)-1.5*IQR(rC)),
quantile(rC,0.25),
median(rC),
quantile(rC,0.75),
min(max(rC),quantile(rC,0.75)+1.5*IQR(rC)),
max(rC)),4)

names(stat.rC) <- c("min","whisk.dow","quant.25","median","quant.75","whisk.up","max");

#Die für die Graphik relevanten Punkte lassen sich mit folgenden Befehlen ermitteln:
stat.rC   #Alternative 1
boxplot.stats(rC)$stats
#Alternative 2: Die Quantile werden hier anders berechnet als oben.

# }}}
# QQ-Plots (S. 39)# {{{

#QQ-Plots dienen dem visuellen Vergleich zweier Verteilungen. Üblicherweise vergleicht man die empirische Verteilung der vorliegenden Daten mit einer theoretischen Verteilung.

# }}}
# Kopieren als PDF# {{{

dev.copy(device = pdf, file = "foobar.pdf", width = 4, height = 3, pointsize = 12, onefile = FALSE, paper = "special"); dev.off()
#Hiermit lassen sich die Grafiken (unter Windows) als PDF-Dateien abspeichern.

dev.copy2pdf(device = "pdf", file="/path/to/foobar.pdf", out.type="pdf"); dev.off()
#Kopieren als PDF unter Linux.

# }}}

# }}}
# 3. Häufigkeitsverteilungen # {{{

# Häufigkeitsverteilung (S. 44) # {{{

n <- rnorm(1000); x <- rnorm(n, 200, 4)
hist(x, main="Histogramm der Normalverteilung", col=3, prob=1)
lines(sort(x),dnorm(sort(x),mean(x),sd(x)))
lines(sort(x),pnorm(sort(x),mean(x),sd(x)),col=2, lwd=2)
#alt1: lines(sort(x),pnorm(sort(x),mean(x),sd(x)),col=2, lwd=2)
#alt2: plot.ecdf(x)
#Ableitung der Normalverteilung

# }}}
# Verteilungsfunktion (S. 45)# {{{

#Quantilsfunktion (S. 47)
median(x)
quantile(x,prob=0.5)
#alt1: quantile(x,prob=0.5)
#alt2: quantile(x, 2/4)
#alt3: quantile(x, prob=seq(0,1,.5))      #etc.
#entspricht: sum(x)/length(x)

qda <- quantile(a, probs=seq(0, 1, 0.1))      #Die drei Argumente des seq-Befehls sind der Reihe nach der Anfangs- und der Endwert (hier die Wahrscheinlichkeiten 0 bzw. 1), sowie das Intervall (hier ein zehntel für Dezile, man kann auch (1/10) schreiben).

# }}}
# Lagemaße # {{{

#Geometrisches Mittel# {{{

W <- c(20,30,40)
w <- W/100    #Wachstumsrate als Dezimalzahl: x1/x0-1
w <- W/W/100; w

# }}}
#Varianz# {{{

var(x)

# }}}
#Kovarianzen# {{{

x <- 1:10
set.seed(123)
y <- sample(1:10, 10, prob=seq(1,20,2))

# }}}
# cov()# {{{

cov(x,y)

# }}}
#Standardabweichung (S. 52)# {{{

(sum((x-mean(x))^2/(n-1))^0.5
sd(x)

# }}}
#Quartilsabstand# {{{

IQR(x)

# }}}

# }}}
# Schiefemaße (S. 53ff) # {{{

# mean((x-mean(x))^3)/sd(x)^3

# Erstellen der Funktion# {{{

skew.d <- function (x) {
n <- length (x)
std <- (sum((x - mean(x))^2)/n)^0.5
z3 <- 1/n * sum((x - mean(x))^3)
skew.d <- z3/std^3
return(skew.d)
}

# }}}
# Schiefe der Verteilung # {{{

skew <- function(x) {
n <- length(x)
skew.d <- skew.d(x)
skew <- skew.d*n^0.5*(n-1)^0.5/(n-2)
return(skew)
}

# }}}

# }}}
# Wölbungsmaße (S. 55 f.) # {{{

# Wölbung# {{{

set.seed(123)
x <- round(rlnorm(1000)*1000)
mean(((x-mean(x))/sd(x))^3)  #Die Verteilung ist steil.

# }}}
# Kurtosis # {{{

mean(((x-mean(x))/(sd(x)))^4)-3; hist(x, nclass="scott")     #Die Verteilung ist stark rechtsschief.
std <- (sum((x-mean(x))^2)/n)^0.5
z4 <- 1/n * sum((x-mean(x))^4)
kurtosis.d <- z4/std^4 -3; kurtosis.d

# }}}
# Mehrdimensionale Variable# {{{

x <- rep(1:3, c(4,3,1));x
y <- 1:2,4);y
z <- c(1:2,1:3,2:4):z

table(x,y)
table(x,z)
table(y,z)
tab <- table(x,y,z)
tab
ftab <- ftable(x,y,z); ftab
ftable (x,y,z, row.vars=c("z","y")
as.data.frame(ftab)
margin.table(tab, 1:2)   #Randverteilungen der Ausprägungen von x und y
margin.table(tab, c(1,3))
addmargins(margin.table(tab,1:2)

# }}}

# }}}

# }}}
# 4. While & For-Schleifen # {{{

# Schleife # {{{

names(tab1)
table(tab1$sector)
w1 <- tab1$wagerate[tab1$sector==1]; length(w1)
mean(w1)
sv <- 0:7;sv
erg <- rep(0,8);erg
for (i in 1:8){
# i <- 1
wi <- tab1$wagerate[tab1$sector==sv[i]]
erg[i] <- mean(wi)
}
max(erg)

# }}}
# Funktionen # {{{

myf <- function(a) mean( abs(a - median(a)) )
max(tapply(tab1$wagerate,tab1$sector,myf))

# }}}

# }}}
# 5. Wahrscheinlichkeiten # {{{

# Namen der Verteilung, Bsp. norm für Normalverteilung

# d für density# {{{

dnorm(0)
x <- seq(-4,4,0.1)
fx <- dnorm(x); fx    #Vektor der Länge 81 mit zugehörigen Dichten.
plot(x,fx,main="Standardnormalverteilung",lwd=2,col=2,type="l")

# }}}
# p für probability# {{{

pnorm(1.96)   #Integral von minus unendlich bis 1.96
Fx <- pnorm(x);Fx
plot(x,Fx,main="Standardnormalverteilung",lwd=2,col=2,type="l")

# }}}
# q für quantile# {{{

qnorm(0.975)      #Mit einer Wahrsch. von 0.975 Erhalten wir dieses Quantil:
p <- seq(0.001,0.99,0.001)
Qp <- qnorm(p)
plot(p,Qp,main="Standardnormalverteilung",lwd=2,col=2,type="l")

# }}}
# r für random# {{{

z <- rnorm(100000,2,2)                          # 100.000 Standardnormalverteilte Zufallszahlen
hist(z,prob=T,nclass=100,ylim=c(0,0.45))        # Empir. Verteilung der Zufallszahlen
lines(x,fx,lwd=1.5,col=2)                       # Empirische Verteilung der Ziehung
mean(z); sd(z)
z <- sort(z)
fz <- dnorm(z,mean(z),sd(z))
lines(z,fz,col=3,lwd=2)                         # Darstellung der Verteilungsfunktion.
lines(z,dt(z,5),col=4,lwd=2)                    # Standardisierte T-Verteilung mit 5 Freiheitsgraden.
plot(0:10,dpois(0:10,2),col=2,lwd=2,type="h")   # Poissonverteilung mit Erwartungswert 2 (ca. 26% Wahrsch. für Ziehen einer 1 usw.)
hist(runif(1000,-5,1)); dnorm(0)                # Zufällige Gleichverteilung (= R-Uniform).

# }}}

# }}}
# 6. Regressionsanalyse (S. 103)# {{{

# Künstliche Erzeugung von Daten# {{{

# entsprechend dem stochastischen Regressionsmodell
n <- 100
b0 <- 2
b1 <- 1
set.seed(1)
x <- runif(n)
xb <- b0 + b1*x  #Deterministischer Zusammenhang laut Regressionsmodell
u <- rnorm(n, sd=.3)     #Einbauen weiterer Störtherme
y <- xb + u
mean(y)  #muss 2.51 ergeben
plot(x,y,pch=19)     #Erzeugen der Punktewolke

# }}}
# Methode der kleinsten Quadrate # {{{

# Parameter# {{{

lines(x,xb,col=4)   #Wahrer (eigtl. unbekannter) Zusammenhang

### Geschätzte Parameter
b1.d <- cov(x,y)/var(x); b1.d                                    # Erster Steigungsparameter
b0.d <- mean(y)-b1.d*mean(x); b0.d                               # Zweiter Steigungsparameter

### Regressionswerte
y.d <- b0.d + b1.d*x
lines(x,y.d,col=2)                                               # Vermutung über die Daten, mit denen die Punktwolke erzeugt wurde.
legend(0.1,3.4,c("wahr","geschätzt"),cex=0.9,lwd=1,col=c(4,2))   # cex Skaliert die Größe der Daten Hinzufügen einer Legende

### Geschätzte Residuen
u.d <- y-y.d
hist(u.d,nclass=15,main="Histogramm der Gesch. Residuen")

# }}}
# Funktion für lineare Modelle: lm()# {{{

lm(y~x)                                                          # lm() berechnet die Regression und viele weitere Regressionsergebnisse

#Y soll auf x regressiert werden, wir erhalten die
#geschätzten Parameter

#Beachte: Intercept (= Achsenabschnitt) wird autom. hinzugefügt.
#Ohne Intercept erhalten wir die Regression durch den Ursprung
#ohne Achsenabschnitt: -1 im Modell (bspw. lm(y~x-1))

reg <- lm(y~x)
names(reg)   #Objekt reg im Arbeitsspeicher mit Regressionsergebnissen
reg$residuals  # reg hat einige Unterobjekte
hist(reg$residuals, main="Histogramm der Regression für Residuals")
sreg <- summary(reg);sreg    #Die Schätzung von 0,3 ist 0,2823; T-Wert ist Parameter geteilt durch Standardfehler

# }}}
# Weitere Werte der Regression

# Unterobjekte# {{{

names(sreg)
sreg$r.squared
sreg$coef[2,2]
#Standardfehler des Parameters

# }}}

# }}}
# Multiple Regression# {{{

n <- 1000
x1 <- runif(n)
x2 <- runif(n)
x3 <- runif(n)
x4 <- runif(n)
x5 <- runif(n)
x6 <- runif(n)
y <- 2+x1+x2+x3+x4+x5+x6+u
reg2 <- lm(y~x1+x2+x3+x4+x5+x6)
summary(reg2)

# }}}
# Erklärte Regression# {{{

d <- read.csv("usa2.csv")
reg <- lm(d$wagerate ~ d$sex + d$age)
summary(reg)
#Intercept: Ein nulljähriger Mann hat 8,9$ pro Stunde, mit jedem Lebensjahr gibt es 40 Cent hinzu, als Frau erhielte man 7,93$ weniger

# }}}

# }}}
# 7. Funktionen und Rechenoperationen # {{{

# Sinus & Cosinus# {{{

x <- seq(-pi, pi, len = 65)
plot(x, sin(x), type="l", col = 2, xlab = expression(phi),
ylab = expression(f(phi)))
abline(h=-1:1, v=pi/2*(-6:6), col="gray90")
lines(x, cos(x), col = 3, lty = 2)
ex.cs1 <- expression(plain(sin) * phi, paste("cos", phi))   # 2 ways
utils::str(legend(-3, .9, ex.cs1, lty=1:2, plot=FALSE,
adj = c(0, .6)))    # adj y !
legend(-3, .9, ex.cs1, lty=1:2, col=2:3, adj = c(0, .6))     #Zu finden im Anhang: help(legend)

# }}}

# }}}
