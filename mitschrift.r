# vim:fdm=marker:isk=.
# ####################################
# ## Mitschrift ## Einf�hrung in R ###
# ####################################
# Jonas Petong
# Wintersemester 2012/13
# 1. Einf�hrung# {{{

# Laden der Pakete# {{{

library(MASS)       # L�dt die Dokumentation
library(ggplot2)    # Zum speichern von Grafiken und Plots als PDF
library(gplots)
library(gdata)      # ?read.xls: Einlsesen von '.xls' Spreadsheets
library(graphics)
library(plyr)

# Bibliotheken betrachten (und hinzuf�gen)
.libPaths()
.libPaths( c( .libPaths(), "~/.R") )

# # Weitere Pakete nachinstallieren
# download.file("http://www.lepem.ufc.br/jaa/colorout_1.0-3.tar.gz", destfile = "colorout_1.0-3.tar.gz")
# install.packages("colorout_1.0-3.tar.gz", type = "source", repos = NULL)
# library("colorout")

# Laden der Pakete# }}}
# Setzen des eigenen Verzeichnisses# {{{

# setwd("Z:/Zapata/CompStat/")  # Arbeitsordner setzen
# setwd("/home/zapata/Unimaterialien/Winter1213/CompStat")
setwd("/home/zapata/Dokumente/Linux/R")


# Setzen des eigenen Verzeichnisses# }}}
# Vektoren und Matrizen # {{{

# Einfache Vektoroperationen# {{{

# repeat
u <- rep(x = c(1,3,5), each = 3); u     # jedes Element wird wiederholt
v <- rep(x = c(1,3,5), times = 3); v    # alles wird 3x wiederholt

# seq
w <- c(seq(1,4,1)); w   # Setzt einen Vektor mit Elementen 1 bis 4
# alt1: c(seq(1,4,1))
# alt2: c(1:4)

# cumsum/-prod
cumsum(w); cumprod(w)
# Dieser Befehl kummuliert die Eintr�ge des Vektors
# als Summe bzw. Produkt aufeinander auf.

# cummin
cummin(rev(w))
# Hierbei wird solange abgez�hlt, bis der niedrigste Wert
# aus dem Vektor 'w' in umgekehrter Reihenfolge erreicht ist.

# Einfache Vektoroperationen# }}}
# Erstellen einer Matrix# {{{

# mit hilfe der befehle rbind() und cbind()
mat.1 <- cbind(seq(1,4),3:6); mat.1
mat.1 <- rbind(7:9, c(1,5,2)); mat.1

# mit dem matrix-befehl
mat.2 <- matrix(data = LETTERS[1:6], nrow = 2); mat.2
mat.3 <- matrix(data = c(LETTERS[1:3],c(4:6)), ncol = 2); mat.3

# zeilen-/spaltenbeschriftung
colnames(mat.3) <- c("alpha","numb")
rownames(mat.3) <- c("eins","zwei","drei"); mat.3

# Erstellen einer Matrix# }}}
# Erstellen eines Dataframe# {{{

# setzt einen neuen vektor, einen zweiten vektor mit alter und einen
# dritten vektor "geschlecht"
x <- (c("Holger","Marianne","Tobias","Daniela")); x
y <- (c(15,63,23,43)); y
z <- as.logical(c(0,1,0,1));z

# zusammenf�gen der vektoren zu data-frame
df.example <- data.frame(name = x, age = y, sex = z); df.example
# # alt: names(df.example) <- c("name","age","sex")

# bearbeiten des dataframe
df.next.frame <- transform(df.example, effort = c(NA,"much","little","much")); df.next.frame


# Erstellen eines Dataframe# }}}
# Auswahl bestimmter Zeilen und Spalten# {{{

# zellen aus dem data.frame
subset(df.example, name == c("Tobias","Daniela"), select = age)
# # alt1: subset(df.example, name == c("Tobias","Daniela"), c(...))
# # alt2: df.example[c(3,4),]

# Gibt lediglich Daten als TRUE aus, die gr��er gleich vierzig
subset(df.example, age >= 40)
# # alt1: subset(df.example, y >= 40)
# # alt2: df.example[df.example$age >= 40,]     # Das hintanstehende 'Komma' ist hier notwendig!

# Auswahl bestimmter Zeilen und Spalten# }}}
# Zusammenfassen als Liste# {{{

# erstellen der liste
this.is.it <- list(a.data.frame = df.example, a.matrix = mat.3); this.is.it

# namen der matrix �ndern
names(this.is.it)[2] <- "b.matrix"; this.is.it[2]  # zweites element der liste

# ein listenelement hinzuf�gen/l�schen
this.is.it$lets.get.it.on.baby <- rep(2:4, t=2); this.is.it
this.is.it$lets.get.it.on.baby <- NULL; this.is.it

# Zusammenfassen als Liste# }}}
# Vektoren als Faktor darstellen# {{{

# neuer vektor
vec.traff.lights <- c("red", "green", "yellow", "yellow")

# faktorisieren & levels des factors ausgeben
fac.traff.lights <- factor(x = vec.traff.lights)
levels(fac.traff.lights)
# # die "levels" werden auch bei einfacher ausgabe der faktorwerte mit angegeben.

# faktor in rangfolge bringen
fac.traff.lights <- ordered(x = fac.traff.lights, levels = c("green", "yellow", "red"))
fac.traff.lights
# # die kategorien des faktors werden in eine reihenfolge gestellt. bei obigem
# # beispiel: nach gr�n folgt gelb folgt rot (-> chronologisch)

# Vektoren als Faktor darstellen# }}}

# Vektoren und Matrizen # }}}
# Sortierung von Daten# {{{

# Sortieren eines Vektors# {{{

x <- c(2,3,1,4); x
order(x)                    # In welcher Reihenfolge muss zugegriffen
                        # werden, damit der Datensatz am Ende sortiert ist.
x[order(x)]                 # Als Ausgabe erhalten wir die sortierte Reihenfolge.


# Sortieren eines Vektors# }}}
# Sortierung einer Matrix# {{{

# Erstellen des Data Frame
w <- (c("Holger","Marianne","Tobias","Daniela"))
x <- c(15,63,23,43)
y <- c(212,182,175,189)
z <- c(0,1,0,1)
df.wxyz <- data.frame(w,x,y,z)
names(df.wxyz) <- c("Name","Alter", "Gr��e", "Geschlecht"); df.wxyz
# alt: rownames() f�r zeilen- und colnames() f�r spaltenbeschriftung

# Umgekehrte Sortierung des x-Vektors
ox <- rev(order(x)); x[ox]
# alt1: ox <- order(-x); x[ox]
# alt2: rev(order(xyz[,c(1)])); xyz[,c(1)][ox]

wxyz.ox <- df.wxyz[ox,]; wxyz.ox
# Sortiert Zeilen des Dataframe nach der oben
# festgelegten (umgekehrten) Reihenfolge des x-Vektors.


# Sortierung einer Matrix# }}}

# Sortierung von Daten# }}}
# Zusammenf�hren von Daten # {{{

# Hinzuf�gen von Zeilen und Spalten# {{{

Blutgruppe <- (c("A","B","0","AB")); df.wxyz
df.bg <- cbind(df.wxyz, Blutgruppe); df.bg

df.bg[,1] <- as.character(df.bg[,1]); df.bg[,1]
df.bg[,4] <- as.numeric(df.bg[,4]); df.bg[,4]
df.bg <- rbind(df.bg, c(as.character("Thomas"),22,188,as.numeric(FALSE),"B")); df.bg
df.bkp <- df.bg
# F�gt vorher festgelegten Vektor (= Blutgruppe) zu Matrix als Spalte hinzu.
# F�r das Anbinden von Zeilen gilt analog: 'rbind'

# sortieren des data.frame nach dem Alter der untersuchungsobjekte
df.bg <- df.bkp
s.x <- order(df.bg[,2]); s.x
df.bg[s.x,]

# cbind, rbind - Kombination aus beiden Befehlen
cbind("first col", rbind("first row", 1:3, 17:19, c("Thomas","Marian","Anna")))
# die menge an spalten richtet sich nach der anzahl an argumenten
# innerhalb des cbind befehls, vice versa mit zeilen.

# l�schen einer Zeile des Dataframe
df.bg <- df.bg[-5,]; df.bg
# alt: df.bg[5,] <- NULL

# }}}
# Zusammenf�gen von Datenfiles nach identifizierenden Variablen# {{{

dat1 <- read.csv("usa.csv", h=T); dat1[1:5,]
dat2 <- read.csv("usa.csv", h=T)[1:4,1:3]
dat3 <- read.csv("usa.csv", h=T)[1:4,4:6]

dat2;dat3

# merge(dat2, dat3, by.x="pid", by.y="sector")
dat.merge <- merge(dat2, dat3, all=T); dat.merge
dat.merge <- merge(dat2, dat3, by.x="pid", by.y="sector")
dat.merge     # beim zweiten beispiel werden die daten dort zusammengef�gt, f�r
              # welche "pid" und "sector" denselben wert annehmen. Die Option
              # "all=T" l�sst die gesamten Daten beider Tabelle miteinander vereinen.

# alt1: merge(dat2,dat3, by.x="pid", by.y="sector")
# alt2: join(dat2,dat3, by.x="pid", by.y="sector") [dazu muss
# zun�chst das Paket 'plyr' geladen sein.]

# Vereint den ersten Dataframe mit dem Zweiten, indem �bereinstimmungen der Variable 'pid' mit der Variable 'sector' gefunden werden.

# }}}

# Zusammenf�hren von Daten # }}}
# Datenimport / -export nach Excel # {{{

# Tabelle erstellen# {{{

# Erzeugen eines Randomisierten Datensatzes
daten <- df.wxyz; daten
df.wxyz.copy <- data.frame(daten$Name, daten$Alter); df.wxyz.copy

# Als Beispiel exportieren wir unsere Daten "daten"
# # Nur bestimmte Variablen einlesen in neuen data.frame
write.table(daten, file = "test.csv", sep = ";", dec=",", col.names=NA)
read.table('test.csv',header=T,sep=";",row.names=1) # http://stackoverflow.com/a/11608601
#             |         |       |         |
#             |         |       |         +-- Lege Spalte der Zeilenbeschriftung fest
#             |         |       +------------ Trennzeichen
#             |         +-------------------- Spaltenbeschriftung (T/F)
#             +------------------------------ Dateiname

# Tabelle erstellen# }}}
# CSV einlesen# {{{

# Eine Excel-Tabelle muss zun�chst in das .csv format konvertiert
# werden, in der kommandozeile per: ssconvert -S in.xlsx out.csv

# Semikolon statt Komma
# Vorher erzeugten Datensatz wieder einlesen
read.csv2("test.csv", row.names=1,fill=T, )

csv.ew <- read.csv("epex_wind.csv",fill=T,blank.lines.skip=T); csv.ew[12:20,0:6]
# Die Endung "csv2" steht f�r die in Deutschland �bliche Trennung mit
# Semikolon. F�r die amerikan. Schreibweise reicht 'read.csv'.

# CSV einlesen# }}}
# Werte auslesen# {{{

nrow(csv.ew); ncol(csv.ew)

# Werte auslesen# }}}

# Datenimport / -export nach Excel # }}}

# 1. Einf�hrung# }}}
# 2. Graphiken# {{{

# Randomisierten Datensatz vorbereiten# {{{

set.seed(123)
x <- rchisq(1000,5); x
# Vektor mit 1000 (zuf�lligen) Eintr�gen
par(las=1, mfrow=c(3,1), cex = .7, mar = c(5, 4, 4, 2) + 0.1)
# Drei Grafiken pro Seite (von oben nach unten)

# Randomisierten Datensatz vorbereiten# }}}
# Histogramme# {{{

hist(x)                 # Histogramm erstellen
length(hist(x)$breaks)  # Zeigt die Anzahl der Klassen im Histogramm.

# Truehist 1
truehist(x, nbins=5, main = "Truehist1")
# Histogramm mit anderen Voreinstellungen (Klassenbreiten, Farben etc.). Evtl. muss vorher das Paket 'Mass' geladen werden: library(MASS)

# Truehist 2
truehist(x, h = 0.25, main = "Truehist2")
# alt1: truehist(x, h = 0.25)
# alt2: truehist(x, breaks = seq(0,20,0.25))

# Truehist 3
truehist (x, main = "Truehist3", breaks = c(-1,2, seq(3,7,0.5),8,20), prob=TRUE)
# Mit dem Argument 'prob=TRUE' wird gew�hrleistet, dass die Histogrammfl�che den Wert 1 annimmt und an der y-Achse die Dichte abgetragen wird. Diese w�chst proportional zur Fl�che einer Klasse.

# }}}
# Optimale Klassenwahl (S. 26):# {{{

nclass.Sturges(x)
# Empfohlene Klassengr��e, basierend auf Spannweite der Daten.

nclass.scott(x); hist.scott(x, main="Scott")
# Empfohlene Klassengr��e, basierend auf der Varianz.

nclass.FD(x); hist.FD(x, main="Freedman-Diaconis (FD)")
# Klassenbreite zur�ckgehend auf Spannweite und Quartilsabstand. Zahl der breaks, entspricht Zahl der Klassen +1.

# }}}
# Erstellen des Barplots (S. 27 ff.)# {{{

# Barplot 1# {{{

par(las=1,mfrow=c(3,1))
x <- sample(1:4, size = 1000, replace = T, prob = rev(seq(0.1,0.8,0.2)))
# Somit erstellen wir 1000 Realisationen aus dem Ziehen und Zur�cklegen der Werte eins bis vier.

HV.x <- table(x); HV.x
# Ausz�hlung der H�ufigkeiten der vier versch. Auspr�gungen.
barplot(HV.x, main = "Ein einfacher Barplot", sub ="Multinomialverteilung", col = c("black","grey30","grey70","white"), xlab ="Auspr�gungen", ylab = "H�ufigkeit", width = c(1,2,3,4), space = 1)
legend(15,350, c("eins", "zwei", "drei", "vier"), cex = 0.9, fill = c("black","grey30","grey70","white"), ncol = 2)
# Barplot mit weiteren Einstellungen zu Farbe, �berschrift, Achsenbeschriftung etc.


# Barplot 1# }}}
# Barplot 2# {{{

y <- sample(0:1, size = 1000, replace = TRUE, prob = c(0.3,0.7))
HV.xy <- table(x,y); HV.xy
# H�ufigkeitsverteilung der zweiten Variable mit 1000 Realisationen einer Binomialverteilten Stichprobe.

barplot(HV.xy, col = c(2,4,6,8), main = "Ein anderer Barplot", sub ="Binomialverteilung", xlab ="Auspr�gungen", ylab = "H�ufigkeit", names.arg = c("Nullen","Einsen"))
legend(0.5,600, c("eins", "zwei", "drei", "vier"), cex = 0.9, fill = c(2,4,6,8), ncol = 2)
# Barplot der Binomialverteilung mit Legende.


# Barplot 2# }}}
# Barplot 3 # Alle Farben# {{{

z <- sample(1:8, size = 1000, replace = T, prob = seq(0.1,0.8,0.1))
HV.xz <- table(z)
barplot(HV.xz, col = 1:8, main = "Barplot der Farben", sub = "Multinomialverteilung", xlab = "Auspr�gungen", ylab = "H�ufigkeit", names.arg = LETTERS[1:8])
legend(0, 200, 1:8, fill = seq(1,8,1), cex = 0.8, ncol = 4)


# Barplot 3 # Alle Farben# }}}

# Erstellen des Barplots (S. 27 ff.)# }}}
# Erstellen eines Punktediagramms (S. 31 ff.)# {{{

# Streudiagramm
par(las=1,mfrow=c(2,1))
x <- runif(n = 100, min = 0, max = 100)
# Somit generieren wir eine mit Zufallszahlen �berlagerte lineare Beziehung. Als x-Variable verwenden wir 100 Realisationen einer im Bereich 0 bis 100 gleichverteilten Zufallsvariablen.

y <- 20+x+rnorm(n = 100, mean = 0, sd = 20)
# Die Y-Variable ist eine Zufallsvariable, deren auf X bed. Erwartungswert eine lineare Funktion der X-Werte ist. Die Realisationen einer normalverteilten Zufallsvariablen (= N(0,20)) werden zu den linearen Funktionswerten addiert.

plot(x, main = "X-Variable", sub = "Gleichverteilt von 0 bis 100")
plot(y, main = "Y-Variable", sub = "�berlagerte Normalverteilung")
plot(x,y, main = "XY-Variablen", sub = "Auf X bedingte Y-Variable", pch = 4, xlim = c(-10,120), ylim = c(-20,200), type = "p")
# type p (= Punktdiagramm) oder type l.

# }}}
# Regressionslinien# {{{

abline(lm(y ~ x), lwd = 2, col = "red")
lines(x, lm(y ~ x)$fitted.values, lwd = 3, col = 3)
# Oben: Eine rote OLS-Regressionslinie (= Methode der kleinsten Quadrate). Unten: OLS-Regression f�r Wertebereich.

# Beispielplot f�r Aktienverlauf
set.seed(1)
y <- cumsum(rnorm(20))
x <- seq(1,length(y),b = 1)
plot(x,y, xlim = c(0,20), ylim = c(-2,4), type = "l", col="red", lwd=2, lty=1, ylab="Aktienkurs")
legend(0,4,"xy-Aktie", lty=1, col=2, ncol = 4, lwd=2, bty="n")    #Betrachten der zeitl. Entwick. mittels eines Liniendiagramms

# }}}
# Boxplots (S.36)# {{{

# Generieren des Boxplots
set.seed(1)
n <- 21; kC <- cumsum(rnorm(n, mean = .5, sd =1.5))+100; rC <- diff(log(kC))
plot(rC, main = "Aktienkurs", ylab = "Rendite", xlab = "Zeitstrahl", type = "l")
boxplot(rC, boxwex = 0.75,
col = "yellow",
main = "Boxplot f�r Aktienkurs",
xlab = "Aktienkurs",
ylab = "Rendite", yaxs = "r")
# Die mittlere horizontale Linie in der grauen Box stellt den Median dar. Die graue Box wird oben durch den 2. Quartilswert und unten durch den 1. Quartilswert begrenzt. Die gesamte Box gibt somit den totalen Quartilsabstand (= Interquartilerange) an. Oben und unten ragen aus der Box gestrichtelte Linien mit kleinem Querbalken heraus. Diese werden "Whisker" (Schnurrbarthaar) genannt. Die L�nge der Whisker ergibt sich aus dem minimum der 1.5-fachen L�nge der Box und dem Abstand der entferntesten Beobachtung. Liegen einzelne Beobachtungen au�erhalb der Whisker, werden diese einzeln in die Graphik as Punkte eingezeichnet.

# }}}
# Statistische Kennzahlen# {{{

stat.rC <- round(c(min(rC),
max(min(rC),quantile(rC,0.25)-1.5*IQR(rC)),
quantile(rC,0.25),
median(rC),
quantile(rC,0.75),
min(max(rC),quantile(rC,0.75)+1.5*IQR(rC)),
max(rC)),4)

names(stat.rC) <- c("min","whisk.dow","quant.25","median","quant.75","whisk.up","max");

# Die f�r die Graphik relevanten Punkte lassen sich mit folgenden Befehlen ermitteln:
stat.rC   #Alternative 1
boxplot.stats(rC)$stats
# Alternative 2: Die Quantile werden hier anders berechnet als oben.

# }}}
# QQ-Plots (S. 39)# {{{

# QQ-Plots dienen dem visuellen Vergleich zweier Verteilungen. �blicherweise vergleicht man die empirische Verteilung der vorliegenden Daten mit einer theoretischen Verteilung.

# }}}
# Kopieren als PDF# {{{

dev.copy(device = pdf, file = "foobar.pdf", width = 4, height = 3, pointsize = 12, onefile = FALSE, paper = "special"); dev.off()
# Hiermit lassen sich die Grafiken (unter Windows) als PDF-Dateien abspeichern.

dev.copy2pdf(device = "pdf", file="/path/to/foobar.pdf", out.type="pdf"); dev.off()
# Kopieren als PDF unter Linux.

# }}}

# 2. Graphiken# }}}
# 3. H�ufigkeitsverteilungen # {{{

# H�ufigkeitsverteilung (S. 44) # {{{

n <- rnorm(1000); x <- rnorm(n, 200, 4)
hist(x, main="Histogramm der Normalverteilung", col=3, prob=1)
lines(sort(x),dnorm(sort(x),mean(x),sd(x)))
lines(sort(x),pnorm(sort(x),mean(x),sd(x)),col=2, lwd=2)
# alt1: lines(sort(x),pnorm(sort(x),mean(x),sd(x)),col=2, lwd=2)
# alt2: plot.ecdf(x)
# Ableitung der Normalverteilung

# }}}
# Verteilungsfunktion (S. 45)# {{{

# Quantilsfunktion (S. 47)
median(x)
quantile(x,prob=0.5)
# alt1: quantile(x,prob=0.5)
# alt2: quantile(x, 2/4)
# alt3: quantile(x, prob=seq(0,1,.5))      #etc.
# entspricht: sum(x)/length(x)

qda <- quantile(a, probs=seq(0, 1, 0.1))      #Die drei Argumente des seq-Befehls sind der Reihe nach der Anfangs- und der Endwert (hier die Wahrscheinlichkeiten 0 bzw. 1), sowie das Intervall (hier ein zehntel f�r Dezile, man kann auch (1/10) schreiben).

# }}}
# Lagema�e # {{{

# Geometrisches Mittel# {{{

W <- c(20,30,40)
w <- W/100    #Wachstumsrate als Dezimalzahl: x1/x0-1
w <- W/W/100; w

# }}}
# Varianz# {{{

var(x)

# }}}
# Kovarianzen# {{{

x <- 1:10
set.seed(123)
y <- sample(1:10, 10, prob=seq(1,20,2))

# }}}
# cov()# {{{

cov(x,y)

# }}}
# Standardabweichung (S. 52)# {{{

(sum((x-mean(x))^2/(n-1))^0.5
sd(x)

# }}}
# Quartilsabstand# {{{

IQR(x)

# }}}

# }}}
# Schiefema�e (S. 53ff) # {{{

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
# W�lbungsma�e (S. 55 f.) # {{{

# W�lbung# {{{

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
margin.table(tab, 1:2)   #Randverteilungen der Auspr�gungen von x und y
margin.table(tab, c(1,3))
addmargins(margin.table(tab,1:2)

# }}}

# }}}

# 3. H�ufigkeitsverteilungen # }}}
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

# 4. While & For-Schleifen # }}}
# 5. Wahrscheinlichkeiten # {{{

# Namen der Verteilung, Bsp. norm f�r Normalverteilung

# d f�r density# {{{

dnorm(0)
x <- seq(-4,4,0.1)
fx <- dnorm(x); fx    #Vektor der L�nge 81 mit zugeh�rigen Dichten.
plot(x,fx,main="Standardnormalverteilung",lwd=2,col=2,type="l")

# }}}
# p f�r probability# {{{

pnorm(1.96)   #Integral von minus unendlich bis 1.96
Fx <- pnorm(x);Fx
plot(x,Fx,main="Standardnormalverteilung",lwd=2,col=2,type="l")

# }}}
# q f�r quantile# {{{

qnorm(0.975)      #Mit einer Wahrsch. von 0.975 Erhalten wir dieses Quantil:
p <- seq(0.001,0.99,0.001)
Qp <- qnorm(p)
plot(p,Qp,main="Standardnormalverteilung",lwd=2,col=2,type="l")

# }}}
# r f�r random# {{{

z <- rnorm(100000,2,2)                          # 100.000 Standardnormalverteilte Zufallszahlen
hist(z,prob=T,nclass=100,ylim=c(0,0.45))        # Empir. Verteilung der Zufallszahlen
lines(x,fx,lwd=1.5,col=2)                       # Empirische Verteilung der Ziehung
mean(z); sd(z)
z <- sort(z)
fz <- dnorm(z,mean(z),sd(z))
lines(z,fz,col=3,lwd=2)                         # Darstellung der Verteilungsfunktion.
lines(z,dt(z,5),col=4,lwd=2)                    # Standardisierte T-Verteilung mit 5 Freiheitsgraden.
plot(0:10,dpois(0:10,2),col=2,lwd=2,type="h")   # Poissonverteilung mit Erwartungswert 2 (ca. 26% Wahrsch. f�r Ziehen einer 1 usw.)
hist(runif(1000,-5,1)); dnorm(0)                # Zuf�llige Gleichverteilung (= R-Uniform).

# }}}

# 5. Wahrscheinlichkeiten # }}}
# 6. Regressionsanalyse (S. 103)# {{{

# K�nstliche Erzeugung von Daten# {{{

n <- 100
b0 <- 2
b1 <- 1
set.seed(1)     # entsprechend dem Stochastischen Regressionsmodell
x <- runif(n)
xb <- b0 + b1*x        # Deterministischer Zusammenhang laut
                       # Regressionsmodell
u <- rnorm(n, sd=.3)   # Einbauen weiterer St�rtherme
y <- xb + u
mean(y)                # muss 2.51 ergeben
plot(x,y,pch=19)       # Erzeugen der Punktewolke

# }}}
# Methode der kleinsten Quadrate # {{{

# Parameter# {{{

lines(x,xb,col=4)   #Wahrer (eigtl. unbekannter) Zusammenhang

# ## Gesch�tzte Parameter
b1.d <- cov(x,y)/var(x); b1.d                                    # Erster Steigungsparameter
b0.d <- mean(y)-b1.d*mean(x); b0.d                               # Zweiter Steigungsparameter

# ## Regressionswerte
y.d <- b0.d + b1.d*x
lines(x,y.d,col=2)                                               # Vermutung �ber die Daten, mit denen die Punktwolke erzeugt wurde.
legend(0.1,3.4,c("wahr","gesch�tzt"),cex=0.9,lwd=1,col=c(4,2))   # cex Skaliert die Gr��e der Daten Hinzuf�gen einer Legende

# ## Gesch�tzte Residuen
u.d <- y-y.d
hist(u.d,nclass=15,main="Histogramm der Gesch. Residuen")

# }}}
# Funktion f�r lineare Modelle: lm()# {{{

lm(y~x)                                                          # lm() berechnet die Regression und viele weitere Regressionsergebnisse

# Y soll auf x regressiert werden, wir erhalten die
# gesch�tzten Parameter

# Beachte: Intercept (= Achsenabschnitt) wird autom. hinzugef�gt.
# Ohne Intercept erhalten wir die Regression durch den Ursprung
# ohne Achsenabschnitt: -1 im Modell (bspw. lm(y~x-1))

reg <- lm(y~x)
names(reg)   #Objekt reg im Arbeitsspeicher mit Regressionsergebnissen
reg$residuals  # reg hat einige Unterobjekte
hist(reg$residuals, main="Histogramm der Regression f�r Residuals")
sreg <- summary(reg);sreg    #Die Sch�tzung von 0,3 ist 0,2823; T-Wert ist Parameter geteilt durch Standardfehler

# }}}
# Weitere Werte der Regression

# Unterobjekte# {{{

names(sreg)
sreg$r.squared
sreg$coef[2,2]
# Standardfehler des Parameters

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
# Erkl�rte Regression# {{{

d <- read.csv("usa2.csv")
reg <- lm(d$wagerate ~ d$sex + d$age)
summary(reg)
# Intercept: Ein nullj�hriger Mann hat 8,9$ pro Stunde, mit jedem Lebensjahr
# gibt es 40 Cent hinzu, als Frau erhielte man 7,93$ weniger

# }}}

# 6. Regressionsanalyse (S. 103)# }}}
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

# 7. Funktionen und Rechenoperationen

#######
### EOF
#######
