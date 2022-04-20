data("PlantGrowth")
str(PlantGrowth)
boxplot(data=PlantGrowth,weight~group,ylab = 'Dry weight')
View(PlantGrowth)
3+1:5
3+0:5
3+2:5
3+2:6
3+3:5
10+1:11
## The above counts like 10+1 upto 11 i.e 10+1,10+2,10+3,10+4....10+11
2+c(1,2,3,4,5)
##The above add 2 to echof the numbers in the brackets


##Creating Matrices
matrix(data=1:6,nrow = 2,ncol=3)
matrix(data=1:6,nrow = 5,ncol=3)##  This will results into an error since 6 is not a multiple of5
##Or they will count from one to six and then it repeats itself
##The above adds the data each row after the other azin in a list unless you use the command byrow=true
matrix(data = 1:6 ,nrow=3,ncol=2,byrow = TRUE)
matrix(data = 1:6 ,nrow=3,ncol=2,byrow = FALSE)




### FORMULA
## The basics of formula
















####READING AND WRITING STRINGS
##1. Printing and displaying srings
print("Hello world")
cat("Hello World\n")
cat("Hello world")


##2 Capture Output of operating system command

Sys.time()

Sys.timezone()
eom <- function(x, p=as.POSIXlt(x)) as.Date(modifyList(p, list(mon=p$mon + 1, mday=0)))
library(p3d)
Init3d(family="serif", cex = 1)
Plot3d(mpg ~ disp+wt, mtcars)
Axes3d()
Fit3d(fit1)

## PIPE OPERATORS (%>%) AND OTHERS

library(magrittr)
1:10 %>% mean
