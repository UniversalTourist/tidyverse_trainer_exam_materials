# Load libraries
library(tidyverse)

#Load data
coffee_ratings <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-07-07/coffee_ratings.csv')

coffee_ratings <- read_csv("data/coffee_ratings.csv")

## First glimpse
View(coffee_ratings) #You should now be able to interact with the data set

glimpse(coffee_ratings)

head(coffee_ratings)

## Comparison with base R and Tidyverse
coffee_ratings[ , c('species', 'country_of_origin')]

select(coffee_ratings, species, country_of_origin)

## Select
select(coffee_ratings, species, country_of_origin, color, certification_body) 

select(coffee_ratings, 1:4, 21:25) 


##Filter
filter(coffee_ratings, country_of_origin == "Ethiopia")

filter(coffee_ratings, number_of_bags >= 60) 
  
## Arrange
arrange(coffee_ratings, total_cup_points)

arrange(coffee_ratings, desc(total_cup_points)) 

## Steps
coffee_ratings_ethiopia <- select(coffee_ratings, total_cup_points, species, country_of_origin)
coffee_ratings_ethiopia <- filter(coffee_ratings_ethiopia, country_of_origin == "Ethiopia")
coffee_ratings_ethiopia <- arrange(coffee_ratings_ethiopia, total_cup_points)
coffee_ratings_ethiopia

## Pipes
coffee_ratings_ethiopia <- 
  coffee_ratings %>%
  select(total_cup_points, species, country_of_origin) %>% 
  filter(country_of_origin == "Ethiopia") %>% 
  arrange(total_cup_points)
  
## Quiz - 1
coffee_ratings %>% 
  ____(1:4, number_of_bags) %>% 
  ____(____ == "Brazil") %>%
  ____(total_cup_points > ___) %>% 
  ____(desc(number_of_bags))

## Solution - 1
coffee_ratings %>% 
  select(1:4, number_of_bags) %>% 
  filter(country_of_origin == "Brazil") %>%
  filter(total_cup_points > 70) %>% 
  arrange(desc(number_of_bags))


## Group by & Summarise
coffee_ratings %>%
  group_by(species) %>%
  summarise(avg_rating = mean(total_cup_points),
            proportion = n()/nrow(coffee_ratings))


coffee_ratings %>%
  group_by(country_of_origin) %>%
  summarise(avg_rating = mean(total_cup_points),
            median_rating = median(total_cup_points)
  )


## Mutate
coffee_ratings %>% 
  select(species, country_of_origin, processing_method) %>% 
  mutate(is_processing_method_full = ifelse(!is.na(processing_method), 1, 0))


## Quiz - 2
1- filter(species == "Arabica")  
2- select(total_cup_points, species, country_of_origin, processing_method, aroma, aftertaste)
3- coffee_ratings
4- arrange(mean_aroma) 
5- summarise(mean_aroma = mean(aroma),
             mean_aftertaste = mean(aftertaste))
6- group_by(country_of_origin)
7- mutate(is_color_full = ifelse(!is.na(color), 1, 0))


##Solution - 2
coffee_ratings %>% 
  select(total_cup_points, species, country_of_origin, processing_method, aroma, aftertaste, color) %>%
  filter(species == "Arabica") %>% 
  mutate(is_color_full = ifelse(!is.na(color), 1, 0)) %>% 
  group_by(country_of_origin, is_color_full) %>% 
  summarise(mean_aroma = mean(aroma),
            mean_aftertaste = mean(aftertaste)) %>%
  arrange(desc(mean_aroma))



