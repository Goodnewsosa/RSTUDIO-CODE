2 + 2
#cement

# FROM ALL THE CHEATSHEETS LIBRARY URL
# https://posit.co/resources/cheatsheets/

# R as a calculator ----
2 + 2
2 * 2

2 - 8

24 / 2

2^4
sqrt(100)

# Creating object in R ----

my_obj <- 2 + 2

another_one = 3 + 3

first_name <- "Goodnews"

#Datesets are objects too!----


ebola_data <- read.csv("https://tinyurl.com/ebola-data-sample")

Date_china <- read.csv("https://tinyurl.com/diabetes-china")

highcharter::hchart(Date_china$height.cm.)



#overwrite an object ----

first_name <- "Goodnews"

first_name <- "Jetbrain"

first_name <- "Osabuohien Iyenoma Goodnews"

#working with objects ----

my_phoneNumber <- 09057258406

sqrt(my_phoneNumber)

total_sum <- my_phoneNumber + my_phoneNumber

ebola_data

table(ebola_data$sex)

table (ebola_data$status)
table (ebola_data$district)

#combuation  with object with string ----

first_name <- "Iyenoma"
Middle_Name <- "Goodnews"
Last_Name <- "Osabuohien"

paste(first_name, Middle_Name, Last_Name)

# Naming object
#there are only two hard things in computer: cach invalidation and naming things

# snake_case <- "uses all lowercase with an underscore"
# period.case <- "uses all lowercase with a period"
# CamlCase <- "Camel cases capitalizes new words"


# functions ----

sqrt(100)

paste(
  "i am going to uni for my master degree program and i'm going to score",
  100 + 100,
  "in all my course modulas"
)

plot(women)


# Basic functions syntax ----

# function_name(argument1 =value, argument2 = value)

head(x = ebola_data, n = 10)
#?head

#Function nesting ----

tolower ('IYENOMA GOODNEWS OSABUOHIEN')
paste('my fullName is', tolower ('IYENOMA GOODNEWS OSABUOHIEN'))


# packages installation----

#install.packages("tableone")

library(highcharter)

library(tableone)

CreateTableOne(data = ebola_data)

#full signifiers ----

tableone::CreateTableOne(data = ebola_data)

#Pacman , this helps to run and load package----

#if(!require(pacman)) install.package("pacman")

install.packages("pacman")

pacman::p_load(outbreaks, tableone, highcharter)


plot(ebola_data)

highcharter::hchart(Date_china$height.cm.)

paste("i am number, 97")

#the ...head....function it takes the first view element that you type into it

head(x = ebola_data, n = 3)
head(ebola_data, 3)

#Function nesting ---

tolower("GOODNEWS")

paste("My name is", tolower("GOODNEWS"))

# install.packages("tableone")

library(tableone)

data = ebola_data

CreateTableOne(data = ebola_data)

pacman::p_load(outbreaks, tableone)

#eEBOLA SIERRA LEONE ANALYSIS
#GOODNEWS
#2026

#LOAD PACKAGE ---
pacman::p_load(
  tidyverse, #meta_package
  inspectdf,
  plotly,
  janitor,
  visdat,
  esquisee
)

#load data--
ebola_sierra_leone <- read_csv("ebola_sierra_leone.csv")

#Explore data

head(ebola_sierra_leone) #this show you the first 6 roll of your data
tail(ebola_sierra_leone) #this show you the last 6 roll bottom of the dataset
ncol(ebola_sierra_leone) #this show you the number colume
nrow((ebola_sierra_leone)) #this shows the number of roll
dim(ebola_sierra_leone) # this shows the dimisions
summary(ebola_sierra_leone) #this shows the summary 

visdat::vis_dat(ebola_sierra_leone) #is shows you the type of the colum and the type of the colume

show_plot(inspect_cat(ebola_sierra_leone)) #this shows the show plot

ggplot(
  ebola_sierra_leone
)

#numerical overview
num_summary_plot <- show_plot(inspect_cat(ebola_sierra_leone))

#Analyzing single variables: numeric ---
#analyzing a single variables this is where you use $ singe
ebola_sierra_leone$age
#analyzing victors like mean, media

mean(ebola_sierra_leone$age, na.rm = TRUE) # this way ignore NA in the dataset
median(ebola_sierra_leone$age, na.rm = TRUE)


#find the standard derviation 
sd(ebola_sierra_leone$age, na.rm = TRUE) #Standard derviation
min(ebola_sierra_leone$age, na.rm = TRUE) #mimum
max(ebola_sierra_leone$age, na.rm = TRUE)  #maximum
summary(ebola_sierra_leone$age, na.rm = TRUE) #the summary
length(ebola_sierra_leone$age) #the length 
sum(ebola_sierra_leone$age, na.rm = T) #the total sum


#visualizing single variables: numeric ---
hist(ebola_sierra_leone$age) #histigram
boxplot(ebola_sierra_leone$age) #boxplot


esquisse(ebola_sierra_leone) #esquisse isn't working because of my rstudio is a old version but can write the code like a ggplot code
ggplot(ebola_sierra_leone$age)+
  aes(x =age, y = sex, fill = sex) +
  geom_violin(adjust =0.3, scale = "age") +
  scale_fill_hue(direction = 1) +
  labs(title = "this is my first plot") +  #is'nt working still
  theme_minimal()

#Analyzing single variables: categorical --- #this is like two different type variable like male and female

ebola_sierra_leone$district

table(ebola_sierra_leone$district) #in a table form
tabyl(ebola_sierra_leone$district) #in janitor table

tabyl(ebola_sierra_leone, district, sex) # this is the correct way to go a janito table

#Visualizing single variables: categorical

barplot(table(ebola_sierra_leone$district)) #visualizing the single dataset wit barplot


#when was the first case reported?

min(ebola_sierra_leone$date_of_sample)

#what was the median age of those affected?

median(ebola_sierra_leone$age, na.rm = T)

#had there been more cases in men or woman?

tabyl(ebola_sierra_leone$sex)

#what district has had the most reported cases

tabyl(ebola_sierra_leone, district)


#by the end of june 


#THE GRAPH COURSE ABOUT PIPES




women
select(wight)









