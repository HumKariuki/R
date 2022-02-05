## R basics
## source window for R script where you write and run the codes
## The console is where the output is going to appear
## The global environment is where list of the various data flames and values that are currently loaded in working directory
## multi use panel/multi purpose window can show all files in your project ,plots,packages you have installed,help window etc

## arithmetic calculations
5+3
4-2
4 - 3
4*3
4/2
8/2
4^2
2^3
## squareroot = sqrt
sqrt(4)
sqrt(9)

log(100) ## the log function is based on natural logs and not base 10...base e

log10(100) ## The log is in base 10

## asigning values
## when asigning values the should no space and it should not start with a numeric
x<- 45 ## x get 45,# it appears in the global environment
x
y <- 32
z <- x*y

## IN R we often work with vectors... A vector is a column of data...the data should be all of the same time eg numeric etc
## creating a vector

d <- c(1,2,3,4,5,6) ## c is the  combined command
d

e <-34: 47 ## another way to create a vector
e

## vectors of characters
f <- c("Hum","Bob","Janet","Jecinta")

### data flames...A data flames is a collection of vectors
## built in data flames in R
data()

## Loading the data flame
data("trees")
## to see the rows 
head(trees)  ## it shows the first few rows of the data flames

nrow(trees) ## to show the number of rows 
ncol(trees) ## to show the number of columns
dim(trees) ## shows the number of rows and columns

str(trees) ## structure of the dataflame

#### Simple summary statistics
# to calculate the mean of girth in the trees data set
mean(trees$Girth)
## you can also attach the data flame you are working with to save some typing
attach(trees)
mean(Girth)
mean(Height)
median(Girth)
sd(Girth)
max(Girth)
min(Girth)
fivenum(Girth) ## calculating the five number summary ie min,lower hinge value or first quartile,median value,upper hinge value or third quartile,maximum value in tha order
## the five num is mostly used to create box plot

summary(trees)

## to load the package use the require(package name)or library(package name) command or check the package directly in the multi uswindow
### ? package name shows more about the package name

? trees
