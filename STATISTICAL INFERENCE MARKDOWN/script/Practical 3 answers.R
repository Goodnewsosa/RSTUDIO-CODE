### Introduction to R

### Practical 3. Summarising data

### Sample answers

# Question 1
library(foreign)
wers <- 
read.spss("http://www.restore.ac.uk/PEAS/ex4datafiles/data/ex4.sav", 
to.data.frame=TRUE)
# Question 1a
head(wers)
# Question 1b
help(package="foreign")
 # the option to.data.frame=TRUE saves the SPSS file as a data frame in R

# Question 2
complete.cases(wers)
# Question 2a
wers <- wers[complete.cases(wers),]

# Question 3
names(wers)
wers$female
# Question 3a
wers[, 3]

# Question 4
wers$mjm <- wers$female < 50
# Question 4a
names(wers) # a new variable is added to the list of names available
head(wers)  # the new variable is added as another column to the data frame

# Question 5
help(attach)
# Question 5a
attach(wers)
female

# Question 6
# Question 6a
mean(ethnic)    # calculates the mean
sd(ethnic)      # calculates the standard deviation
median(ethnic)  # calculates the median
IQR(ethnic)     # calculates the inter-quartile range
mad(ethnic)     # calculates the median absolute deviation
min(ethnic)     # calculates the minimum value
max(ethnic)     # calcualtes the maximum value
range(ethnic)   # calculates the smallest and largest values
fivenum(ethnic) # calculates the 0%, 25%, 50%, 75% and 100%iles
summary(ethnic) # calculates the five number summary plus the mean
# Question 6b
 # e.g. summarizing with mean and sd
mean(ethnic[mjm == 1])
mean(ethnic[female < 50])
sd(ethnic[mjm == 1])
sd(ethnic[female < 50])
 # Can use [mjm == 1] or [female < 50] as they have the same interpretation

# Question 7
wers_continuous <- wers[, c("female", "ethnic", "est_wt", "grosswt")]
cor(female,ethnic)
# Question 7a
cor(wers_continuous) # shows correlation matrix of all variables in data frame
cor(wers)            # shows an error because lbw contains non-numeric data

# Question 8
table(nempsize)
table(nempsize, eo)
# Question 8a
nempsize_eo <- table(nempsize, eo)
# Question 8b
table(nempsize, eo, disabgrp)
# Question 8c
ftable(nempsize, eo, disabgrp)
    # ftable produces a flat table, with subcategories rather than separate tables
ftable(nempsize, disabgrp, eo)
    # The last category is put in the columns

# Question 9
addmargins(nempsize_eo)
# Question 9a
prop.table(nempsize_eo, 1) # calculates proportion within row
prop.table(nempsize_eo, 2) # calculates proportion within column
prop.table(nempsize_eo)    # calculates proportion within whole table

# Question 10 
aggregate(ethnic ~ eo, data=wers, mean)
# Question 10a
 # The quickest way is to use the summary function, which shows median, min and max
aggregate(ethnic ~ eo, data=wers, summary)
 # But the following would also show the same information
aggregate(ethnic ~ eo, data=wers, median)
aggregate(ethnic ~ eo, data=wers, min)
aggregate(ethnic ~ eo, data=wers, max)

# Question 11
lm(female ~ ethnic, data=wers)
lm1 <- lm(female ~ ethnic, data=wers)
# Question 11a
summary(lm1) # provides an enhanced output of the linear model
# Question 11b
names(lm1)

