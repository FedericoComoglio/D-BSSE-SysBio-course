################################ <--- this is a comment
#Lecture 1: an introduction to R
#25-09-2013
#FC, D-BSSE
################################

#Preliminaries: start R (better if you run it locally)

##################
#The R environment
##################

#~~~~~~~~~~~~~
#The workspace
#~~~~~~~~~~~~~

#list all variables defined within a workspace
ls()
#create a variable
v <- 1 : 10
#and remove it
rm(v)
#create two of them
v <- 1 : 10
w <- 1.5 * v	#notice vectorization
#save the workspace to a file
save.image(file = 'myws.Rdata')
#is it there?
dir()
#remove all variables within a workspace
rm(list = ls())
ls()
#load the previously saved workspace
load('myws.Rdata')
ls()
v
w

#~~~~~~~~~~
#The R help
#~~~~~~~~~~

help.start()
#help page for a specific function, e.g. : (from-to)
help(':')
?plot
#unsure?need a hint?
apropos('plot')

#############
#The R basics
#############

#getting and setting my working directory
getwd()
dir()
list.files()
setwd('wd')
setwd('../')

#arithmetic operations
2+3
2-3
2*3
2/3
2^3
2^-3
10^12

#logical operations
1 < 2
1 < 2 || 3 > 4	#OR
1 < 2 && 3 > 4	#AND
! 1<2			#NOT
(! 1<2) || 3<4
! (1<2 || 3<4)	#parenthesis DO matter!

#constants
pi
exp(1)

#assignment
a <- 2
a = 2
b <- a * 4
a * 4 -> c
b == c

(a <- 2)

#vectors
c(3,5,6)
v <- c(3,5,6)
v[2]
length(v)
v[-3]
v[3] <- -10
v
v + 5	#vectorization (of +)
2 * v 	#vectorization (of *)
v ^ 2	#vectorization (of ^)
w <- v + 1; w		# ; separates commands that are entered on the same line
names(w) <- c('Exp1', 'Exp2', 'Exp3')
w[1]
w['Exp1']

#or, alternatively
w <- c(Exp1 = 4, Exp2 = 6, Exp3 = -9)
#note:
w <- Exp1 = 4	#ops... 
w <- c(Exp1 = 4)
w

c('1', '2', '3')	#a vector of class character
  
#and finally
c(letters[1:5], 1 : 5)	#conversion to least restrictive type

#BMI, at least 3 volunteers!
weight <- c()
height <- c()  
( bmi <- weight / height ^ 2 )

#sequences
c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20) #want to go up to 100?
1:100
100:1

#with repeated elements
c(1,1,1,1,1,1)
rep(1,6)
rep(c(1,2), each = 4)
rep(c(1,2), times = c(3,7))

seq(1,100, by = 2)
seq(0,100, by = 2)		#same as seq(0,100,2)
seq(2,100, length = 50)
seq(0,100, length = 50)

#recycling shorter vectors
1 : 10 + 1 : 3

#matrices
M <- matrix(1:9, ncol = 3)
M <- matrix(1:10, ncol = 3)		#ops...
M
M <- matrix(1:9, nrow = 3)
M <- matrix(1:9, nrow = 3, ncol = 3)
#fill by row
N <- matrix(1:9, nrow = 3, byrow = TRUE)

M
N

#transpose
t(M) == N
all(t(M) == N)

#basic arithmetic
M * 2
M / 2
M + 1
M - 3
M + N
M ^ 2

#linear algebra operations
Mrn <- M + runif(9, 0, 0.01)
Minv <- solve(Mrn)   #inverse
Mrn %*% Minv

#subsetting
M[1, ]
M[, 1]
M[1,1]
M[1:2, c(1,3)]

colnames(M) <- letters[1:3]	#letters
M[, 'b']
rownames(M) <- month.name[1:3]
M
M['February', 'c']

#binding columns/rows together
M <- matrix(1:9, nrow = 3, ncol = 3)
N <- matrix(1:9, nrow = 3, byrow = TRUE)
cbind(M,N)
rbind(M,N)
cbind( M, c(-11,-10,-9) )
cbind( M, last = c(-11,-10,-9) )
cbind( first = c(10,11,12), M )
rbind( c(10,11,12), M )

#factors (encoding of categorical variables)
#a factor has a set of levels

IlikeR <- c(1,2,1,3,4,3,3,2,2)
factor.IlikeR <- factor(IlikeR, levels = 1:4)
levels(factor.IlikeR) <- c('not at all', 'a little bit', 'quite some', 'enthusiasteR')
factor.IlikeR

as.numeric(factor.IlikeR)	#extract the numeric values from factors
levels(factor.IlikeR)

#lists
l <- list(a = 1:10, b = 1:5)
l
l <- list(a = letters[1:10], b = 1:5)
l
class(l)
class(l$a)
class(l$b)

#subsetting
l[[1]]
l$a
l$a[1]

#joining lists, fill in
l <- list(names = c("Federico", ""), age = c(26, 00))
m <- list(employment = c('student', ''))
( n <- c(l, m) )
n <- c(l, m)


#creating lists of lists
subl <- list( colors = list(eyecol = c('brown', ''), haircol = c('?', '')) )
subl

(n <- c(n, subl) )

n$colors$eyecol

#data frames
#see it as a data set. Extremely useful to collect and summarize experimental results. 
#Starting point for doing sound statistics. The true strength of R

( D <- data.frame(weight, height) )
D$weight
D[, 'weight']

summary(D)
colMeans(D)
head(D, 1)

#conditional selection
D[D$weight < 75, ]

#sorting
v
sort(v)

ord <- order(D$weight)
ord
D[ord, ]

#Graphics with R
x <-rnorm(100, 0, 1)
y <- runif(100, -1, 1)
plot(x,y)
plot(x,y, main = 'myplot')
plot(x,y, main = 'myplot', xlab = 'variable x')
plot(x,y, main = 'myplot', xlab = 'x', ylab = 'variable y')
plot(x,y, main = 'myplot', xlab = 'x', ylab = 'y', type = 'l')
plot(x,y, main = 'myplot', xlab = 'x', ylab = 'y', type = 'b')
plot(x,y, main = 'myplot', xlab = 'x', ylab = 'y', type = 'o')
plot(x,y, main = 'myplot', xlab = 'x', ylab = 'y', type = 'n')	#very useful
points(x,y)

plot(x,y, main = 'myplot', xlab = 'x', ylab = 'y', col = 'blue')
plot(x,y, main = 'myplot', xlab = 'x', ylab = 'y', col = 'blue', cex = 2)
plot(x,y, main = 'myplot', xlab = 'x', ylab = 'y', col = 'blue', cex.main = 2)
plot(x,y, main = 'myplot', xlab = 'x', ylab = 'y', col = 'blue', cex.lab = 2)
plot(x,y, main = 'myplot', xlab = 'x', ylab = 'y', col = 'blue', cex.axis = 2)

plot(x,y, main = 'myplot', xlab = 'x', ylab = 'y', col = 'blue', cex.main = 1.5, cex.axis = 1.25, cex.lab = 1.5)


plot(x,y, main = 'myplot', xlab = 'x', ylab = 'y', col = c(rep('red', 50), rep('blue', 50)))
plot(x,y, main = 'myplot', xlab = 'x', ylab = 'y', col = c(rep('red', 50), rep('blue', 50)), pch = 18)
abline(v = 0); abline(h = 0)
plot(x,y, main = 'myplot', xlab = 'x', ylab = 'y', col = c(rep('red', 25), rep('blue', 25)), pch = 18)
abline(v = 0, lty = 2, lwd = 2, col = 'gray70'); abline(h = 0, lty = 2, col = 'gray70')

#check ?par, it has to become your friend!
?par
#try few of them (5')

par(mfrow = c(1,2))
hist(x)
hist(y)

par(mfrow = c(1,2))
hist(x, freq = FALSE)
curve(dnorm(x, 0, 1), add = TRUE)
hist(y, freq = FALSE)

qqnorm(x)

par(mfrow = c(1,2))
hist(x, freq = FALSE, xlim = c(-3,3), col = rgb(0,0,1,0.1))
curve(dnorm(x, 0, 1), add = TRUE, lwd = 2, col = 'blue')
hist(y, freq = FALSE, col = rgb(1,0,0,0.1))
curve(dunif(x, -1, 1), add = TRUE, lwd = 2, col = 'red')

M <- cbind(x,y)
M
plot(M)

l <- list(x, y)
l
boxplot(l)
boxplot(l, col = c('red3', 'lightblue'))
boxplot(l, col = c('red3', 'lightblue'), notch = TRUE)
legend('topright', legend = c('x', 'y'), fill = c('red3', 'lightblue'), bty = 'n')

#enlarge chars
boxplot(l, col = c('red3', 'lightblue'), notch = TRUE)
legend('topright', legend = c('x', 'y'), fill = c('red3', 'lightblue'), bty = 'n', cex = 1.5)

#encode legend in the axis
boxplot(l, col = c('red3', 'lightblue'), notch = TRUE, xaxt = 'n')
axis(side = 1, at = c(1,2), labels = c('x', 'y'))

#barplots
barplot(x)

#pie charts
x <- 1:10
names(x) <- month.abb[1:10]
pie(x, main = 'pie chart')

#######################
#Conditionals and loops
#######################

a <- 10
if(a >= 10)  
  print('greater than or equal to 10') else 
    print('smaller than 10')

print(ifelse(a >= 10, 'greater than or equal to 10', 'smaller than 10'))

for(i in 1 : 15) {
  cat('i = ', i, '\n')
}

for(i in 1 : 15) {
  cat('i = ', i, '\n')
  print(ifelse(i >= 10, '>= 10', '< 10'))
}

i <- 1
while(i <= 10) {
  print(i)
  i <- i + 1
}

###

l <- list(a = 1:10, b = 1:5)
lapply(l, length)

M <- matrix(1:12, ncol = 3)
M
apply(M, 1, sum)	#by rows
apply(M, 2, sum)	#by cols

#Writing functions

f <- function(x,y) {
  x + y
}

f(9,87)

f <- function(x,y) {
  return(log(x) + y^2)
}

f(1,2)

totalPosNeg <- function(v) {	#v: vector
  n <- length(v)
  pos <- 0
  for(i in 1 : n) {
    if(v[i] >= 0)
      pos <- pos + 1
  }
  cat('v has ', pos, 'positive numbers and ', n - pos, 'negative numbers')	
}

totalPosNeg(c(0,1,2,-3,-4,1,-5,11))

f <- function(x) sum(x^2)
apply(M, 1, f)
apply(M, 2, f)

###########################
#Reading and writing files
###########################

#most flexible, ASCII encoding, arbitrary (but fixed) separator: read.table
#let's prepare a four-column file (tab-separator, in VIM): name, birthday as day, month, year

#line 1:
#Federico	3	10	1986
...

#save it as ourdata.txt

read.table('Desktop/SCU_RCourse/ourdata.txt', header = FALSE)
read.table('Desktop/SCU_RCourse/ourdata.txt', header = TRUE)

#let's add a header
#Name	Day	Month	Year

read.table('Desktop/SCU_RCourse/ourdata.txt', header = FALSE)
read.table('Desktop/SCU_RCourse/ourdata.txt', header = TRUE)
read.table('Desktop/SCU_RCourse/ourdata.txt', header = FALSE, skip = 2)
#field separator
read.table('Desktop/SCU_RCourse/ourdata.txt', header = TRUE, sep = ' ')
read.table('Desktop/SCU_RCourse/ourdata.txt', header = TRUE, sep = '\t')

#a note on unequal field counts (fill). 
#Modify the data by removing the entry in (m,n).
read.table('Desktop/SCU_RCourse/ourdata.txt', header = TRUE)	#ops...
read.table('Desktop/SCU_RCourse/ourdata.txt', header = TRUE, fill = TRUE)

#reading Excel spreadsheet. 
#avoid using .xls, .xlsx. Export to CSV files
#prepare the csv file, Name,Day,Month,Year	then
read.csv('Desktop/SCU_RCourse/ourdata.csv', header = TRUE)

mydata <- read.csv('Desktop/SCU_RCourse/ourdata.csv', header = TRUE)

#editing data frames
mydata.edited <- edit(mydata)
#if you can o/w
fix(mydata)

#reading data through the web (remote access, local storage)

sec <- read.table("http://data.princeton.edu/wws509/datasets/effort.dat")
#This small dataset includes an index of social setting, an index of family planning effort, and the percent decline in the crude birth rate between 1965 and 1975 for 20 countries

##########
#Exercises
##########

#Ex 1: produce a scatter plot of wind vs. temperature for the airquality dataset. What do we learn? Can we apply some simple statistic to at least describe the trend more precisely?

#Ex 2: look at the ChickWeight data set. 
#a) Plot the weight as a function of time for chick 7.
#b) Superimpose a line representing the same information for chick 9.
#c) Add a legend to the plot
#d) Find out how to plot in a pdf device (see ?pdf) and plot the previous graph to a pdf file called myplot.pdf
#e) Extract all weights at time point = 21 and arrange your result in a list where each slot corresponds to a Diet (there are 4 diet regimes, so it will be a list of 4 vectors). 
#Hint: ?split
#f) Boxplot the weights in this 4 diets. Any difference in mean weight between diet 1 and 3?
#Hint: ?t.test

#Ex 3: look at the eurodist data set. What is the class of this object? 
#Do you know it?
#Sort the cities by increasing distance from Geneva. Hint: you may want to look at ?as.matrix

#Ex 4 - write your own functions to compute mean and standard deviation. Apply them to the precip data sets and cross validate your results using the built-in mean() and sd() functions. 

#Ex 5 - write your own function to transpose a matrix. Use of the t() function is considered cheating!

#Ex 6 - write the swiss dataset as csv file. Read in the file. How long does it take to execute the command?

#Ex 7 - write a function that takes a numeric vector as input and returns a vector of differences between
#consecutive elements. Is there a way to do the same using a built-in function? Apply both function to
v <- 1 : 10
v <- c(3,4,5,1,2,9,11,8)
v <- seq(1,100,2)

#Ex 8 - create 3 vectors containing the first 10 numbers divisible by 2, by 3 and by 4, respectively.
#a) Use these vectors to create a list, and give suitable names to the slots.
#b) Now that you have a list, can you compute the sum for each slot?
#c) If you sum the three slots, you get a vector of length 10. What is it?

#Ex 9 - Write a function to convert Fahrenheit to Celsius. (Hint: C = 5/9 * (F - 32))

#Ex 10 - Write a function which takes a single numeric value x as argument and returns a logical value TRUE
#if x is larger than 5, FALSE otherwise
#a) Extend the previous function by including the threshold as an argument
#b) Given
l <- list( seq(1,75, by = 3))
#use the function you created in a to test each single entry in l.

#--------------------------------------------------------------------------
#--------------------------------------------------------------------------
#--------------------------------------------------------------------------

