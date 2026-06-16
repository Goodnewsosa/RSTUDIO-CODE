#Ebola Sierra Leone analysis
#Kene David Nwosu
#2026 -08- 03



# load package----
pacman:: p_load(
  tidyverse, #meta_package
  inspectdf,
  plotly,
  janitor,
  visdat,
  esquisse
)


ebola_sierra_leone <- read_csv("PRACTISE/ebola_sierra_leone.csv")


#Load data ----
head(ebola_sierra_leone, n=5) #the first six heading
tail(ebola_sierra_leone)   # the last six bomotton
ncol(ebola_sierra_leone)  #The number of colume 
nrow(ebola_sierra_leone)  #the number of rows
dim(ebola_sierra_leone)  #dimenions
summary(ebola_sierra_leone)

#general overview of data
visdat::vis_dat(ebola_sierra_leone) # this give you a review of observations

show_plot(inspect_cat(ebola_sierra_leone)) #to inspect and show plot inspection

#Categorical overview
#To aove move reasonable using the ggplotly

cat_sumary_plot <- show_plot(inspect_cat(ebola_sierra_leone))

ggplotly(   #this inspect the Date more professeional 
  cat_sumary_plot
        
        )

#Numerical overview
num_sumary_plot <- show_plot(inspect_num(ebola_sierra_leone))

ggplotly(num_sumary_plot)

#Analyzing single variables: numeric with $ sign  ----
ebola_sierra_leone$id

mean(ebola_sierra_leone$id, na.rm = TRUE) #To look for the mean in ID value

median(ebola_sierra_leone$id, na.rm = TRUE) #To look for the median in ID value

age_vec <- ebola_sierra_leone$age  #rechange to object and look for the age

sd(age_vec, na.rm = T ) #standard dervation
min(age_vec, na.rm = T) #minimum
max(age_vec, na.rm = T) #maxmum
summary(age_vec )       #Summary
length(age_vec)
sum(age_vec, na.rm = T) 


#Visualizing single variable with dragiam

hist(age_vec) #Histogram View
boxplot(age_vec) #Boxplot View


#ggplot
#Esquisse

esquisser(ebola_sierra_leone)




# 1.when was the first case reported?





# 2. As at the end of june 2014, which age group had the most cases?



# 3. What was the median age of those affected?




# 4. Had there been more cases in men or women?




# 5. What district Had the most reported Cases?




# 6. By He end of June 2014, Was the outbreak growing or receding?




table(ebola_sierra_leone$sex)
