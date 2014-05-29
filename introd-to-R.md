TechHacks Talk - Dec. 6, 2013 - Introduction to R, Part A
========================================================
r-introA : [HTML](http://www.cs.mtu.edu/~lebrown/TechHacks-f13/r-examples/r-introA.html)  | [Rmd - R Markdown](http://www.cs.mtu.edu/~lebrown/TechHacks-f13/r-examples/r-introA.Rmd) | [md - Markdown](http://www.cs.mtu.edu/~lebrown/TechHacks-f13/r-examples/r-introA.md)

## Installation and Setup

[RStudio](http://www.rstudio.com/ide/) was used to construct the example activity.  The examples will be described and made available using [R Markdown](http://www.rstudio.com/ide/docs/r_markdown) (integrates [Markdown](http://daringfireball.net/projects/markdown), a simple formatting syntax for web pages, with R scripts) and [Sweave](http://www.statistik.lmu.de/~leisch/Sweave/) (integrates LaTeX, a document formatting syntax, with R scripts).  R Studio allows easy use and creation of these documents, but requires the [knitr](http://yihui.github.com/knitr/) R package.

The knitr package can be installed via:

```r
install.packages("knitr", dependencies = TRUE)
```


On the MTU lab machines, it will first try to install the package to the network drive, then ask to install the package to a local library (accept this choice).


## Basic R Usage

The following examples go through using several of R's basic functions

### Arithmetic Operations


```r
5 + 4
```

```
## [1] 9
```



```r
(10 + 13)/14.2
```

```
## [1] 1.62
```


### Objects

Two main concepts exist in R: objects and functions.  Objects associate a name with a storage space; everything in R is stored as an object.  Content may be stored in objects using assignment `<-`.
 
Assignment may use an equal sign `=` but is not recommended.


```r
x <- 5
x
```

```
## [1] 5
```



```r
y <- x^2
y
```

```
## [1] 25
```



```r
sqrt(x)
```

```
## [1] 2.236
```


Every object created stays in memory until deleted.  List all objects in memory using `ls()` or `objects()`.  Objects may be removed with `rm()`


```r
ls()
```

```
## [1] "x" "y"
```



```r
rm(x)
```


### Vectors

The basic data object is a vector.  The objects `x` and `y` from above are vectors containing a single element.

Vectors store elements of the same type.  There are four basic types: _characters_, _logical_, _numeric_, and _complex_.

A logical object can be created by assigning values of `T`, `F`, `TRUE`, or `FALSE`.


```r
a <- T
a
```

```
## [1] TRUE
```


The length of a vector is assessed with the function `length()`


```r
length(y)
```

```
## [1] 1
```


Vectors can be created with the concatenation function, `c()`


```r
x <- c(1, 2, 3, 5)
x
```

```
## [1] 1 2 3 5
```

```r
length(x)
```

```
## [1] 4
```

```r
y <- c(2, 3, 5, 4)
```


Functions also work on vectors


```r
sum(y)
```

```
## [1] 14
```



```r
d <- sqrt(x^2 + y^2)
d
```

```
## [1] 2.236 3.606 5.831 6.403
```


Vectors are indexed using square brackets `[ ]` starting with 1

```r
x[1]
```

```
## [1] 1
```


### Factors

Factors are a way to store categorical (nominal) data.  A factor has _levels_, possible values, to take. 


```r
g <- c("f", "m", "m", "f", "f", "f", "m")
g
```

```
## [1] "f" "m" "m" "f" "f" "f" "m"
```



```r
g <- factor(g)
g
```

```
## [1] f m m f f f m
## Levels: f m
```


Look at distribution of possible values


```r
table(g)
```

```
## g
## f m 
## 4 3
```


A cross-tabulation of several factors can also use the `table()` function


```r
m <- factor(c("cs", "math", "cs", "cs", "math", "math", "cs"))
table(m, g)
```

```
##       g
## m      f m
##   cs   2 2
##   math 2 1
```


### Sequences

Construct a sequence of values


```r
x <- 1:10
x
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```


Decreasing sequences may also be created. 


```r
y <- 5:0
y
```

```
## [1] 5 4 3 2 1 0
```


Other sequences may be constructed with the `seq()` function


```r
seq(0, 20, by = 2)
```

```
##  [1]  0  2  4  6  8 10 12 14 16 18 20
```



```r
seq(1, -3, -0.5)
```

```
## [1]  1.0  0.5  0.0 -0.5 -1.0 -1.5 -2.0 -2.5 -3.0
```


Sequences may also be generated using repeating patterns


```r
rep(3, 4)
```

```
## [1] 3 3 3 3
```



```r
c(rep(2, 3), rep(4, 2))
```

```
## [1] 2 2 2 4 4
```



----
Inspired by and following examples of J. Taylor using Sphinx.

Also, following R introduction's from D. Cook and L. Turgo.
TechHacks Talk - Dec. 6, 2013 - Introduction to R, Part B
=========================================================
r-introB : [HTML](http://www.cs.mtu.edu/~lebrown/TechHacks-f13/r-examples/r-introB.html)  | [Rmd - R Markdown](http://www.cs.mtu.edu/~lebrown/TechHacks-f13/r-examples/r-introB.Rmd) | [md - Markdown](http://www.cs.mtu.edu/~lebrown/TechHacks-f13/r-examples/r-introB.md)


## Working with Data ##

R has provided a number of built-in data sets.  A list of data sets available can be viewed with:


```r
data()
```



### First Installation of Library

Let's explore using R with the _mpg_ data set available in the _ggplot2_ library.  If you have not yet installed this library on your computer/account then you will get the following error: `Error: there is no package called 'ggplot2'`

The first installation is down with the following command:


```r
install.packages("ggplot2")
```


Once a package has been installed, then when you desire to use its functions, the library only needs to be loaded. 


```r
library(ggplot2)
data(mpg)
```


Information about the data set may be viewed via:

```r
help(mpg)
```


A basic summary of the variables can be assessed by

```r
summary(mpg)
```

```
##      manufacturer                 model         displ           year     
##  dodge     :37    caravan 2wd        : 11   Min.   :1.60   Min.   :1999  
##  toyota    :34    ram 1500 pickup 4wd: 10   1st Qu.:2.40   1st Qu.:1999  
##  volkswagen:27    civic              :  9   Median :3.30   Median :2004  
##  ford      :25    dakota pickup 4wd  :  9   Mean   :3.47   Mean   :2004  
##  chevrolet :19    jetta              :  9   3rd Qu.:4.60   3rd Qu.:2008  
##  audi      :18    mustang            :  9   Max.   :7.00   Max.   :2008  
##  (Other)   :74    (Other)            :177                                
##       cyl              trans    drv          cty            hwy      
##  Min.   :4.00   auto(l4)  :83   4:103   Min.   : 9.0   Min.   :12.0  
##  1st Qu.:4.00   manual(m5):58   f:106   1st Qu.:14.0   1st Qu.:18.0  
##  Median :6.00   auto(l5)  :39   r: 25   Median :17.0   Median :24.0  
##  Mean   :5.89   manual(m6):19           Mean   :16.9   Mean   :23.4  
##  3rd Qu.:8.00   auto(s6)  :16           3rd Qu.:19.0   3rd Qu.:27.0  
##  Max.   :8.00   auto(l6)  : 6           Max.   :35.0   Max.   :44.0  
##                 (Other)   :13                                        
##  fl             class   
##  c:  1   2seater   : 5  
##  d:  5   compact   :47  
##  e:  8   midsize   :41  
##  p: 52   minivan   :11  
##  r:168   pickup    :33  
##          subcompact:35  
##          suv       :62
```


The numeric variables are listed with their minimum, maximum, 1st Quartile (25th percentile), 3rd Quartile (75th percentile), mean and median values.  Nominal variables show the frequency of each attribute values.

An alternative view of the data can be found by

```r
str(mpg)
```

```
## 'data.frame':	234 obs. of  11 variables:
##  $ manufacturer: Factor w/ 15 levels "audi","chevrolet",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ model       : Factor w/ 38 levels "4runner 4wd",..: 2 2 2 2 2 2 2 3 3 3 ...
##  $ displ       : num  1.8 1.8 2 2 2.8 2.8 3.1 1.8 1.8 2 ...
##  $ year        : int  1999 1999 2008 2008 1999 1999 2008 1999 1999 2008 ...
##  $ cyl         : int  4 4 4 4 6 6 6 4 4 4 ...
##  $ trans       : Factor w/ 10 levels "auto(av)","auto(l3)",..: 4 9 10 1 4 9 1 9 4 10 ...
##  $ drv         : Factor w/ 3 levels "4","f","r": 2 2 2 2 2 2 2 1 1 1 ...
##  $ cty         : int  18 21 20 21 16 18 18 18 16 20 ...
##  $ hwy         : int  29 29 31 30 26 26 27 26 25 28 ...
##  $ fl          : Factor w/ 5 levels "c","d","e","p",..: 4 4 4 4 4 4 4 4 4 4 ...
##  $ class       : Factor w/ 7 levels "2seater","compact",..: 2 2 2 2 2 2 2 2 2 2 ...
```


The dimensions of the data can be found by

```r
dim(mpg)
```

```
## [1] 234  11
```


To look at the raw data, the top of the data matrix can be peeked at with

```r
head(mpg)
```

```
##   manufacturer model displ year cyl      trans drv cty hwy fl   class
## 1         audi    a4   1.8 1999   4   auto(l5)   f  18  29  p compact
## 2         audi    a4   1.8 1999   4 manual(m5)   f  21  29  p compact
## 3         audi    a4   2.0 2008   4 manual(m6)   f  20  31  p compact
## 4         audi    a4   2.0 2008   4   auto(av)   f  21  30  p compact
## 5         audi    a4   2.8 1999   6   auto(l5)   f  16  26  p compact
## 6         audi    a4   2.8 1999   6 manual(m5)   f  18  26  p compact
```


Any part of the data matrix may be viewed via indexing

```r
mpg[100:109, ]
```

```
##     manufacturer  model displ year cyl      trans drv cty hwy fl
## 100        honda  civic   1.6 1999   4 manual(m5)   f  28  33  r
## 101        honda  civic   1.6 1999   4   auto(l4)   f  24  32  r
## 102        honda  civic   1.6 1999   4 manual(m5)   f  25  32  r
## 103        honda  civic   1.6 1999   4 manual(m5)   f  23  29  p
## 104        honda  civic   1.6 1999   4   auto(l4)   f  24  32  r
## 105        honda  civic   1.8 2008   4 manual(m5)   f  26  34  r
## 106        honda  civic   1.8 2008   4   auto(l5)   f  25  36  r
## 107        honda  civic   1.8 2008   4   auto(l5)   f  24  36  c
## 108        honda  civic   2.0 2008   4 manual(m6)   f  21  29  p
## 109      hyundai sonata   2.4 1999   4   auto(l4)   f  18  26  r
##          class
## 100 subcompact
## 101 subcompact
## 102 subcompact
## 103 subcompact
## 104 subcompact
## 105 subcompact
## 106 subcompact
## 107 subcompact
## 108 subcompact
## 109    midsize
```


The data columns may be accessed by numeric indexing (the 8th - 11th variables) or by name ('cty', 'hwy', 'fl', 'class')

```r
mpg[80:85, 8:11]
```

```
##    cty hwy fl  class
## 80  14  17  r    suv
## 81  13  19  r    suv
## 82  13  19  r    suv
## 83  13  17  r    suv
## 84  14  17  r pickup
## 85  14  17  r pickup
```

```r
mpg[80:85, c("cty", "hwy", "fl", "class")]
```

```
##    cty hwy fl  class
## 80  14  17  r    suv
## 81  13  19  r    suv
## 82  13  19  r    suv
## 83  13  17  r    suv
## 84  14  17  r pickup
## 85  14  17  r pickup
```


A single data frame may be indexed

```r
mpg$hwy[1:20]
```

```
##  [1] 29 29 31 30 26 26 27 26 25 28 27 25 25 25 25 24 25 23 20 15
```


Data may be accessed by indicated items to exclude

```r
mpg[80:85, -1]
```

```
##              model displ year cyl      trans drv cty hwy fl  class
## 80    explorer 4wd   4.0 1999   6   auto(l5)   4  14  17  r    suv
## 81    explorer 4wd   4.0 2008   6   auto(l5)   4  13  19  r    suv
## 82    explorer 4wd   4.6 2008   8   auto(l6)   4  13  19  r    suv
## 83    explorer 4wd   5.0 1999   8   auto(l4)   4  13  17  r    suv
## 84 f150 pickup 4wd   4.2 1999   6   auto(l4)   4  14  17  r pickup
## 85 f150 pickup 4wd   4.2 1999   6 manual(m5)   4  14  17  r pickup
```



```r
mpg[80:85, -c(1, 2, 3, 4, 5)]
```

```
##         trans drv cty hwy fl  class
## 80   auto(l5)   4  14  17  r    suv
## 81   auto(l5)   4  13  19  r    suv
## 82   auto(l6)   4  13  19  r    suv
## 83   auto(l4)   4  13  17  r    suv
## 84   auto(l4)   4  14  17  r pickup
## 85 manual(m5)   4  14  17  r pickup
```



Let's try a little visualization:

```r
plot(mpg[, c("displ", "cty")])
```

![plot of chunk unnamed-chunk-14](figure/unnamed-chunk-14.png) 


Or a box plot

```r
boxplot(mpg$hwy ~ mpg$year)
```

![plot of chunk unnamed-chunk-15](figure/unnamed-chunk-15.png) 


----
Inspired by and following examples of J. Taylor using Sphinx
TechHacks Talk - Dec. 6, 2013 - Introduction to R, Part C
=========================================================
r-introC : [HTML](http://www.cs.mtu.edu/~lebrown/TechHacks-f13/r-examples/r-introC.html)  | [Rmd - R Markdown](http://www.cs.mtu.edu/~lebrown/TechHacks-f13/r-examples/r-introC.Rmd) | [md - Markdown](http://www.cs.mtu.edu/~lebrown/TechHacks-f13/r-examples/r-introC.md)


## Basic R Usage

The following examples go through using several of R's basic functions

### Matrices and Arrays

You may vectorize a series of numbers into a matrix, via setting the dimensions.


```r
m <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
m
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```



```r
dim(m) <- c(2, 5)
m
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    3    5    7    9
## [2,]    2    4    6    8   10
```


A matrix may also be created using the `matrix()` function


```r
m2 <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), 2, 5)
m2
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    3    5    7    9
## [2,]    2    4    6    8   10
```


Matrices may be joined by columns `cbind()` or by rows `rbind()`


```r
cbind(m[, c(2, 3)], m2[, c(5, 3)])
```

```
##      [,1] [,2] [,3] [,4]
## [1,]    3    5    9    5
## [2,]    4    6   10    6
```



```r
rbind(m[2, c(3, 4, 5)], c(1, 2, 3))
```

```
##      [,1] [,2] [,3]
## [1,]    6    8   10
## [2,]    1    2    3
```



### Statistical Measures

Load the _mpg_ data set


```r
library(ggplot2)
data(mpg)
```


Many statistical measure can be assessed for numeric data: mean, median, min, max, and range of a variable 


```r
mean(mpg$hwy)
```

```
## [1] 23.44
```



```r
median(mpg$hwy)
```

```
## [1] 24
```



```r
min(mpg$hwy)
```

```
## [1] 12
```

```r
max(mpg$hwy)
```

```
## [1] 44
```



```r
range(mpg$hwy)
```

```
## [1] 12 44
```


The standard deviation, variance, and correlation may also be calculated


```r
sd(mpg$hwy)
```

```
## [1] 5.955
```

```r
var(mpg$hwy)
```

```
## [1] 35.46
```

```r
cor(mpg$hwy, mpg$cty)
```

```
## [1] 0.9559
```


### Random Numbers

Create vectors of random numbers from standard distributions.  
* Uniform distribution
* Gaussian distribution
* Exponential distribution
* Poisson distribution


```r
runif(10)
```

```
##  [1] 0.76634 0.59562 0.70762 0.11566 0.90571 0.53650 0.40539 0.02795
##  [9] 0.38652 0.39934
```


Scale the values to be between 0 and 100


```r
runif(10, 0, 100)
```

```
##  [1] 24.648  7.411 14.252  1.920 53.218 73.950 50.318 21.201 16.828  8.781
```


Sample a standard Gaussian distribution, mean = 0, std = 1


```r
x <- rnorm(100)
mean(x)
```

```
## [1] 0.02169
```

```r
sd(x)
```

```
## [1] 0.9137
```


Sample a non-standard Gaussian distribution with mean=5, and std = 3

```r
y <- rnorm(100, 5, 3)
mean(y)
```

```
## [1] 5.33
```

```r
sd(y)
```

```
## [1] 2.992
```



```r
rexp(5)
```

```
## [1] 0.1712 0.4524 1.2108 0.1070 0.1293
```



```r
rexp(10, 1)
```

```
##  [1] 0.35932 0.89767 0.27904 0.10783 0.64531 0.05720 1.20384 0.53083
##  [9] 0.02871 3.92673
```

```r
rexp(10, 10)
```

```
##  [1] 0.000568 0.215579 0.023603 0.074993 0.126845 0.126159 0.170270
##  [8] 0.048189 0.327684 0.399214
```


### Common R functions

* Absolute value: `abs`
  
  ```r
  abs(-5)
  ```
  
  ```
  ## [1] 5
  ```

* Sign function: `sign`
  
  ```r
  sign(-2)
  ```
  
  ```
  ## [1] -1
  ```

* Square root: `sqrt`
  
  ```r
  sqrt(2)
  ```
  
  ```
  ## [1] 1.414
  ```

* Logarithms: `log`, `log2`, `log10`, `logb`
  
  ```r
  log(100)
  ```
  
  ```
  ## [1] 4.605
  ```

  
  ```r
  log2(16)
  ```
  
  ```
  ## [1] 4
  ```

* Exponential: `exp`
  
  ```r
  exp(1)
  ```
  
  ```
  ## [1] 2.718
  ```

* Floor: `floor`
  
  ```r
  floor(8.543)
  ```
  
  ```
  ## [1] 8
  ```

* Ceil: `ceil`
  
  ```r
  ceiling(8.543)
  ```
  
  ```
  ## [1] 9
  ```

* Truncate: `trunc`
  
  ```r
  trunc(8.543)
  ```
  
  ```
  ## [1] 8
  ```

* Round: `round`
  
  ```r
  round(8.543)
  ```
  
  ```
  ## [1] 9
  ```

* Round to significant digits: `signif`
  
  ```r
  signif(3.14159, 3)
  ```
  
  ```
  ## [1] 3.14
  ```

* Trigonometric functions: `sin`, `asin`, `cos`, `acos`, `tan`, `atan`
  
  ```r
  c(sin(45), cos(45), tan(45))
  ```
  
  ```
  ## [1] 0.8509 0.5253 1.6198
  ```

* Mod operations: `%/%`,  `%%`
  
  ```r
  c(10%/%3, 10%%3)
  ```
  
  ```
  ## [1] 3 1
  ```





----
Inspired by and following examples of J. Taylor using Sphinx.
Also, following R introduction's from D. Cook and L. Turgo.
TechHacks Talk - Dec. 6, 2013 - Introduction to R, Part D
=========================================================
r-introD : [HTML](http://www.cs.mtu.edu/~lebrown/TechHacks-f13/r-examples/r-introD.html)  | [Rmd - R Markdown](http://www.cs.mtu.edu/~lebrown/TechHacks-f13/r-examples/r-introD.Rmd) | [md - Markdown](http://www.cs.mtu.edu/~lebrown/TechHacks-f13/r-examples/r-introD.md)




## Basic R Usage

The following examples go through using several of R's basic functions.

Load the _mpg_ data set.


```r
library(ggplot2)
data(mpg)
```


### Sorting

Sort values using the `sort` function

```r
x <- mpg$hwy[1:10]
x
```

```
##  [1] 29 29 31 30 26 26 27 26 25 28
```

```r
sort(x)
```

```
##  [1] 25 26 26 26 27 28 29 29 30 31
```


The ordering of a vector may also be found

```r
y <- 1:10
o <- order(x)
x[o]
```

```
##  [1] 25 26 26 26 27 28 29 29 30 31
```



```r
y[o]
```

```
##  [1]  9  5  6  8  7 10  1  2  4  3
```


### Functions

A new function can be defined by assigning the function to the object name.  Let's create a function to calculate standard error.

$$ \text{standard error} = \sqrt{\frac{s^2}{n}} $$


```r
se <- function(x) {
    v <- var(x)
    n <- length(x)
    return(sqrt(v/n))
}
se(c(45, 2, 5, 8, 65, 4))
```

```
## [1] 10.93
```


A function may be used to calculate basis statistics on a vector:


```r
basic.stats <- function(x, more = F) {
    stats <- list()
    
    clean.x <- x[!is.na(x)]
    
    stats$n <- length(x)
    stats$nNAs <- stats$n - length(clean.x)
    
    stats$mean <- mean(clean.x)
    stats$std <- sd(clean.x)
    stats$med <- median(clean.x)
    if (more) {
        stats$skew <- sum(((clean.x - stats$mean)/stats$std)^3)/length(clean.x)
    }
    unlist(stats)
}
basic.stats(c(40, 2, 3, 5, 10, 55, 8, -400))
```

```
##      n   nNAs   mean    std    med 
##   8.00   0.00 -34.62 148.92   6.50
```



```r
basic.stats(c(40, 2, 3, 5, 10, 55, 8, -400), more = T)
```

```
##       n    nNAs    mean     std     med    skew 
##   8.000   0.000 -34.625 148.918   6.500  -1.791
```


This example also introduced some program control namely `if` functions

### Program Control

A simple example using _for_ loops


```r
for (i in 1:10) {
    print(i^2)
}
```

```
## [1] 1
## [1] 4
## [1] 9
## [1] 16
## [1] 25
## [1] 36
## [1] 49
## [1] 64
## [1] 81
## [1] 100
```



```r
for (i in c("red", "green", "blue")) {
    print(i)
}
```

```
## [1] "red"
## [1] "green"
## [1] "blue"
```


Note, R like vector has many functions that work on vectors. Therefore, vectorized version of calculations and operations are often preferred over loops to ensure efficient code.


```r
i <- 0
while (i < 10) {
    print(i)
    i <- i + 1
}
```

```
## [1] 0
## [1] 1
## [1] 2
## [1] 3
## [1] 4
## [1] 5
## [1] 6
## [1] 7
## [1] 8
## [1] 9
```


### Plotting and Saving Results

Let's look at a basic scatter plot


```r
x = c(1:40)
y = x * 2 + 10 + rnorm(40) * 3
plot(x, y, pch = 21, bg = "red", main = "A Sample Plot", xlab = "dep. variable", 
    ylab = "ind. variable")
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-9.png) 


Plots can be saved to several image formats: _png_, _jpeg_, _bmp_, _tiff_.  The plot will be saved in a file: "R-intro-03-fig1.png"


```r
png("r-ex-fig.png")
plot(x, y, pch = 21, bg = "red", main = "A Sample Plot", xlab = "dep. variable", 
    ylab = "ind. variable")
dev.off()
```

```
## pdf 
##   2
```



----
Inspired by and following examples of J. Taylor using Sphinx.
Also, following R introduction's from D. Cook and L. Turgo.
