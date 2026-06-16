# Statistical Inference
# Week 1
# Exploring gapminder data

# Make syre you have the following packages installed:
# ggplot2
# dplyr
# scales
# gapminder

# Run the following code, which double-checks that you have the packages installed,
# and loads them into the R session.

if(!require(ggplot2)){install.packages("ggplot2")}
library(ggplot2)
if(!require(dplyr)){install.packages("dplyr")}
library(dplyr)
if(!require(scales)){install.packages("scales")}
library(scales)
if(!require(gapminder)){install.packages("gapminder")}
library(gapminder)

# The data for today is loaded automatically by the gapminder package
# Let's find out what variables are available, and what are their names? 
# The function str() is your friend here.

str(gapminder)

# Tech note: The gapminder data set was constructed as a tibble, a generalization of a data.frame.
# The default print() method gives an abbreviated printout. Normally, you would use head(gapminder) for this.

gapminder
head(gapminder)

# Normally, when starting with a new data set, it is useful to get some overview of the variables. 
# The simplest one is summary().

summary(gapminder)

# We will want to look at trends over time by continent. 
# How many countries are in this data set in each continent? 
# There are 12 years for each country. Are the data complete? table() gives an answer.

table(gapminder$continent, gapminder$year)

# Tech note: table() doesn’t have a data= argument, 
# so you have to qualify the names of variables using data$variable notation. 
# Another way to do this is to use the with() function, which makes variables in a data set available directly. 
# The same table can be obtained using:

with(gapminder, {table(continent, year)})


# Task 3

# Bar plots are often used to visualise the distribution of a discrete variable, like continent. 
# With ggplot2, this is relatively easy:
  
# map the x variable to continent
# add a geom_bar() layer, that counts the observations in each category and plots them as bar lengths.
ggplot(gapminder, aes(x=continent)) + geom_bar()

# To make this (and other plots) more colourful, you can also map the fill attribute to continent.
ggplot(gapminder, aes(x=continent, fill=continent)) + geom_bar()

# Time Series
gapminder %>% 
  filter(country == "United States") %>% 
  ggplot(aes(year, pop)) +
  geom_point()

# As a line graph instead
gapminder %>% 
  filter(country == "United States") %>% 
  ggplot(aes(year, pop)) +
  geom_line()


# Task 4

# Now let’s explore the relationship between life expectancy and GDP with a scatterplot, 
# which was the subject of Rosling’s TED talk. 
# (Actually, he did more than this, with a “moving bubble plot”,
# using a bubble symbol ~ population, and animating this over time.)

# A basic scatterplot is set up by assigning two variables to the x and y aesthetic attributes. 

# The following just creates an empty plot frame.
plt <- ggplot(data=gapminder,
              aes(x=gdpPercap, y=lifeExp))
plt

# With points
plt+geom_point()

# Colour points by continent
plt + geom_point(aes(colour=continent))

# Try a log scale for GDP
plt + geom_point(aes(colour=continent))+scale_x_log10()

# Fit a straight line relationship
plt + geom_point(aes(colour=continent))+ scale_x_log10()+geom_smooth(method="lm")

# Note how it doesn't matter what order you add the features in
plt + geom_point(aes(colour=continent))+geom_smooth(method="lm")+ scale_x_log10()

# But if you want to transform to a log scale after fitting a straight line relationship,
# you need to use coordinate transformations
plt + geom_point(aes(colour=continent))+geom_smooth(method="lm")+ coord_trans(x ="log10")
# Having done this, the line of best fit doesn't look right
# so you can see that coordinate transformation / scaling can really affect your graphs
# you need to choose wisely, especially if you are then plotting lines of best fit!
# Maybe this is a better choice
plt + geom_point(aes(colour=continent))+geom_smooth(method="lm")+ scale_x_log10()+coord_trans(x = scales::exp_trans(10))

# Time series, multiple countries
countries <- c("Germany","Ireland")
gapminder %>% filter(country %in% countries) %>% 
  ggplot(aes(year,pop)) +
  geom_line()
# Need to group the lines within country
gapminder %>% filter(country %in% countries) %>% 
  ggplot(aes(year, pop, group = country)) +
  geom_line()
# Could colour by country instead
gapminder %>% filter(country %in% countries) %>% 
  ggplot(aes(year, pop, col = country)) +
  geom_line()

# Following the recommendations in section 20.2 of Fundamentals of Data Visualization (Wilke)
# we want to use labels rather than a legend

# Find out where the two series are positioned
range(gapminder$pop[gapminder$country%in%countries[1]])
range(gapminder$pop[gapminder$country%in%countries[2]])
# Choose appropriate label positions near to, but not on top of, the two series
labels <- data.frame(country = countries, x = c(1970,1970),
                     y = c(65000000,10000000))
# geom_text() is used to add the labels, and theme() is used to remove the legend
gapminder %>% filter(country %in% countries) %>% 
  ggplot(aes(year, pop, col = country)) +
  geom_line()+
  geom_text(data = labels, aes(x, y, label = country), size = 5)+
  theme_bw()+theme(legend.position = "none")


# Task 5

# A bubbleplot, just for the year 2007

# Filter data
data07 <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)
# Arrange data in order
data07<-data07 %>%
  arrange(desc(pop)) %>%
  mutate(country = factor(country, country))

# Bubbleplot
ggplot(data=data07,aes(x=gdpPercap, y=lifeExp, size = pop)) +
  geom_point(alpha=0.5) +
  scale_size(range = c(.1, 24), name="Population (M)")

# Bubbleplot with colour
ggplot(data=data07,aes(x=gdpPercap, y=lifeExp, size=pop, colour=continent)) +
  geom_point(alpha=0.5) +
  scale_size(range = c(.1, 24), name="Population (M)")

# Log scale for GDP
ggplot(data=data07,aes(x=gdpPercap, y=lifeExp, size=pop, colour=continent)) +
  geom_point(alpha=0.5) +
  scale_size(range = c(.1, 24), name="Population (M)")+scale_x_log10()

# How to remove size guides
ggplot(data=data07,aes(x=gdpPercap, y=lifeExp, size=pop, colour=continent)) +
  geom_point(alpha=0.5) +
  guides(size="none")+
  scale_size(range = c(.1, 24), name="Population (M)")+scale_x_log10()

# Animated bubbleplot over time

# Need some extra packages
if(!require(gganimate)){install.packages("gganimate")}
library(gganimate)
if(!require(gifski)){install.packages("gifski")}
library(gifski)

# Set up plot
theme_set(theme_bw())
p <- ggplot(data =   gapminder, 
            aes(x = gdpPercap, y=lifeExp, size = pop, colour = country)
) +
  geom_point(show.legend = FALSE, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita", y = "Life expectancy")

# Make frames. The files will appear in the working directory
p + transition_time(year) +
  labs(title = "Year: {frame_time}")

# Make animated gif. The gif will appear in the working directory
gifski(list.files(pattern="gganim_plot"))
# You may now want to delete all the .png files in the working directory

# Split frames continent by continent
ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')

gifski(list.files(pattern="gganim_plot"))
