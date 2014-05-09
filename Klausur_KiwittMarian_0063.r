# Klausur, Ersttermin, Wintersemster 2012
# Aufgabe 1)
setwd("Z:/")
d <- read.csv("usa.csv"); d[1:5,]

# a)
# i)
mean(d$age)
# 38.67269
# ii)
mean(d$age[d$sex==1])
# 38.37558
# iii)
mean(d$age[d$sex==0])
# 38.98343



# b)
wrate <- d$wage/d$hours
lwrate <- log10(wrate)
d <- cbind(d, wrate, lwrate) ; d[5:1,]

i)
mw <- mean(d$wage) ; mw
table(d$wage<=mw) ; 6812/length(d$wage)
# 67,27% der Personen verdienen weniger als der Durchschnitt.

ii)
table(d$wage[d$sex==1]<=mw) ; 4036/6812
# von denen die weniger als der Durchschnitt verdienen sind 59.24% Frauen

iii)
mlw <- mean(d$wrate)
q0.9 <- quantile(d$wrate, p=0.9); q0.9
table(d$wrate>=q0.9)
# 1013 Personen liegen über einem Stundenlohn von 36.138
table(d$wrate[d$sex==0]>=q0.9)
# davon sind 689 Männer
# also sind ca. 68% die zu den zehn prozent der bestbezahlten
# (je Stunde) gehören männlich.
# 689/1013=0.680158

# c)

# i)
cor(d$wage,d$wrate)
# 0.930778

# ii)
cor(d$wage[d$sex==1],d$wrate[d$sex==1])
# 0.7552779

# iii)
cor(d$wage[d$sex==0],d$wrate[d$sex==0])
# 0.9407082

# iv)
# Frauen arbeiten tendenziell mehr auf Teilzeit,
# somit korrelieren Jahreseinkommen und Stundenlohn der Frauenm weniger stark als die Werte der Männer.

#  Aufgabe 2)
# a)
tapply(d$wrate, d$sector, median)
# b)
mwr <- median(d$wrate)
quantile(d$wrate,prob=0.5)
table(d$wrate<=mwr)
apply(d$wrate, d$sector)<= tapply(d$wrate, d$sector, median)

# c)
sd(d$wrate)/mean(d$wrate)
# der Variationskoeffizient der Stundenlöhne beträgt:
# 2.485151

# Aufgabe 3)

# a)
# wrate=b0+b1*age+u
reg <- lm(d$wrate~d$age)
summary(reg)$coef
plot(reg$fitted)
# b1=0.04091 und somit steigt der Stundenlohn um ca. 4%,
# wenn das Alter um eins zunimmt.
# wrate=0.4017+0.0409*age+9.82

# b)
# lwrate=µ0+µ1*age+u
reg1 <- lm(d$lwrate~d$age)
summary(reg1)
# µ1=0.0002675 wenn das Alter um eins zunimmt steigt der
# logarithmierte Studenlohn um 0.0267%
# lwrate= 0.0080755+0.0002675*age+30.19

#c)
??
Dummyvariablen? wie erstellen?

# Aufgabe 4)

prop.test(


save("KiwittMarian_0063")


 



