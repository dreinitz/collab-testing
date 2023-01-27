# Bubble plot with age vs. recidivism vs. number of treatment sessions
# I went a little different.

rm(list=ls())

# you need to install libraries first, right?
install.packages("Rtools")
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("dplyr") #it keep trying to restart whenever I try to install this one. 
install.packages("hrbrthemes")
install.packages("viridis")
install.packages("gapminder")
install.packages("ggthemes")

#side note I think I need to update R. 

# Libraries
library(tidyverse)
library(ggplot2)
library(dplyr)
library(hrbrthemes)
library(viridis)
library(ggthemes)


########### LS attemting treatment sessions vs. recidivism vs. age.

#make fake data. 
FinalData <- data.frame(
  Percent_Opioid = c(0.79,0.25,0,0.4,0.3,0.7,0.4,0.6,0.3,0.5,0.1,0.2),
  MAT_d = c(1,0,0,1,0,1,0,0,1,0,1,1),
  Recidivism_Rate = c(0.81,0.28,0.40,0.50,0.61,0.43,0.70,0.21,0.73,0.2,0.81,0.23),
  Court_Population = c(76,27,36,48,31,23,87,51,43,30,21,100)
)


FinalData
view(FinalData)

#attempt bubble! need 3 vars, with size the 3rd var. based on geom_point function.
ggplot(FinalData, aes(x=Recidivism_Rate, y=Percent_Opioid, size = Court_Population)) +
  geom_point(alpha=0.7)
# okay it ran but looks pretty bad with the data I made up. 

# going to change the circle size. give the sizes a range.
ggplot(FinalData, aes(x=Recidivism_Rate, y=Percent_Opioid, size = Court_Population)) +
  geom_point(alpha=0.7) +
  scale_size(range = c(.1, 18), name="Treatment Court Size")

# range too big. 
ggplot(FinalData, aes(x=Recidivism_Rate, y=Percent_Opioid, size = Court_Population)) +
  geom_point(alpha=0.7) +
  scale_size(range = c(.1, 14), name="Treatment Court Size")
# i like this more. 

# the online example said you can rearrange data. attempting. not sure what
# %>% is and google not the clearest
#arrange(desc) puts court size in data in descending order
FinalData %>%
  arrange(desc(Court_Population)) %>% #needed to add a pipe operator here. it didn't change the arrangement.
  ggplot(aes(x=Recidivism_Rate, y=Percent_Opioid, size = Court_Population)) +
  geom_point(alpha=0.7) +
  scale_size(range = c(.1, 14), name="Treatment Court Size")

# okay got an error. my final file must be in a data frame. but didn't I do that above?.
# will need some help on this error. but moving on to add colors.
# BL said I needed to add a pipe operator. It still didn't rearrange the data. going to need help here. 

# adding color. will show if they provide MAT.
  ggplot(FinalData, aes(x=Recidivism_Rate, y=Percent_Opioid, size = Court_Population, color=MAT_d)) +
    geom_point(alpha=0.7) +
    scale_size(range = c(.1, 14), name="Treatment Court Size")
  

# adjust to make it look a bit nicer?? make fill=MAT and the color something else.
# adding shape=21. unclear what this does. 
# add labels.
  ggplot(FinalData, aes(x=Recidivism_Rate, y=Percent_Opioid, size = Court_Population, fill=MAT_d)) +
    geom_point(alpha=0.7, shape=21, color="blue") +
    scale_size(range = c(.1, 14), name="Treatment Court Size") +
    xlab("Opioid Users Served (percent)") +
    ylab("Recidivism Rate")
           
  
  
# change the MAT legend name? add title?
  ggplot(FinalData, aes(x=Recidivism_Rate, y=Percent_Opioid, size = Court_Population, fill=MAT_d)) +
    geom_point(alpha=0.7, shape=21, color="blue") +
    scale_size(range = c(.1, 14), name="Treatment Court Size") +
    xlab("Opioid Users Served (percent)") +
    ylab("Recidivism Rate") +
    labs(fill="Court Provides MAT") +
    ggtitle("Statewide Recidivism and Related Court Characteristics")    
  
# add 538 theme? not sure why that theme didn't work. 
  ggplot(FinalData, aes(x=Recidivism_Rate, y=Percent_Opioid, size = Court_Population, fill=MAT_d)) +
    geom_point(alpha=0.7, shape=21, color="blue") +
    scale_size(range = c(.1, 14), name="Treatment Court Size") +
    xlab("Opioid Users Served (percent)") +
    ylab("Recidivism Rate") +
    labs(fill="Court Provides MAT") +
    ggtitle("Statewide Recidivism and Related Court Characteristics") +     
    theme_fivethirtyeight()
  

###  Qs
  #How can I rearrange the data. I fixed the error by adding the pipe operator, but still not rearranging
  # How can I change the color range for MAT? I just want it a yes/no dichotomous, not scale.
  # shape=21?
  
  
  
  
  
  

###########sample syntax from online example here:

# The dataset is provided in the gapminder library
library(gapminder)
data <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)



##### LS notes:
# based on geom_point function
# need 3 vars -- in this example, it is GDP, LifeExpec, and Population

# Most basic bubble plot
ggplot(data, aes(x=gdpPercap, y=lifeExp, size = pop)) +
  geom_point(alpha=0.7)



##### LS notes:
# can control circle size with scale_size()
# the first bit of syntax is rearranging the data so it looks better. 

# Marginally cooler basic bubble plot
data %>%
  arrange(desc(pop)) %>%
  mutate(country = factor(country, country)) %>%
  ggplot(aes(x=gdpPercap, y=lifeExp, size = pop)) +
  geom_point(alpha=0.5) +
  scale_size(range = c(.1, 24), name="Population (M)")




##### LS notes: adding color! color could be a 4th variable.

# Cooler basic bubble plot
data %>%
  arrange(desc(pop)) %>%
  mutate(country = factor(country, country)) %>%
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, color=continent)) +
  geom_point(alpha=0.5) +
  scale_size(range = c(.1, 24), name="Population (M)")



##### LS notes: making it prettier
# virdis package has nice colors
# theme_ipsum() is a ggplot2 theme in hrbrthemes package
# fixing xlab and ylab
#"adding stroke to circle" not sure what that means.

# Coolest basic bubble plot
data %>%
  arrange(desc(pop)) %>%
  mutate(country = factor(country, country)) %>%
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, fill=continent)) +
  geom_point(alpha=0.5, shape=21, color="black") +
  scale_size(range = c(.1, 24), name="Population (M)") +
  scale_fill_viridis(discrete=TRUE, guide=FALSE, option="A") +
  theme_ipsum() +
  theme(legend.position="bottom") +
  ylab("Life Expectancy") +
  xlab("Gdp per Capita") +
  theme(legend.position = "none")
### some warning messages.