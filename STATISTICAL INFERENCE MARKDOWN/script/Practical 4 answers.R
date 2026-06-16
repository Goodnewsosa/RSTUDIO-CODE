### Introduction to R

### Practical 4. Plotting

### Sample answers

attach(iris)

# Question 1
# set up plot area and axes
plot(Sepal.Length, Petal.Length, type="n",
    asp=1, xlim=c(0,10), ylim=c(0,8),
    xlab="Length of sepal (cm)", ylab="Length of petal (cm)")

# add a line of best fit in the background
lm2 <- lm(Petal.Length ~ Sepal.Length)
intercept <- lm2$coefficients[1]
slope <- lm2$coefficients[2]
abline(a=intercept, b=slope, col="darkgreen", lwd=2, lty="dashed")

# add different points for different species
points(Sepal.Length[Species=="setosa"], Petal.Length[Species=="setosa"],
    col="darkblue", pch=17, cex=0.9)
points(Sepal.Length[Species=="versicolor"], Petal.Length[Species=="versicolor"],
    col="orange", pch=15, cex=0.8) 
points(Sepal.Length[Species=="virginica"], Petal.Length[Species=="virginica"], 
    col="purple", pch=16)

# add a title and annotation
title("Iris petal versus sepal length")
text(8,2.5,"Apparent gap between species")


# Question 2
# Box plot of one variable
boxplot(Petal.Length)
# Side-by-side box plots of different variables
boxplot(Petal.Length, Petal.Width, Sepal.Length, Sepal.Width)
# Side-by-side box plots of one variable over categories of another variable
boxplot(Petal.Length ~ Species)
# Side-by-side box plots of one variable over categories of another variable
plot(Species, Petal.Length) 
# has the same effect as the command above


# Question 3
hist(Sepal.Length, freq=TRUE) 
# this is the default, and produces a frequency histogram
# the alternative, with freq=FALSE, is a frequency density histogram

