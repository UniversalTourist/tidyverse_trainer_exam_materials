Week 1: Intro to dplyr
========================================================
author: Hazel KAVILI
date: "2020-07-18"
autosize: true

Install Libraries
========================================================


```r
#find mine's blog post where explain why directly load tidyverse instead of dplyr
library(tidyverse)
```

Load Data Into R
========================================================


```r
##don't forget to add the link data to read from csv and mention that you can read it from web or from your pc
nordic_data <- read_csv("nordic_data.csv")
```

Summary of data - 1
========================================================

There are some functions to check your data: `str`, `summary`, `glimpse` , `head`, `tail`:


```r
glimpse(nordic_data)
```

```
Rows: 236
Columns: 37
$ year                                                         <dbl> 1960, 19…
$ Country_Name                                                 <chr> "Denmark…
$ Country_Code                                                 <chr> "DNK", "…
$ Adolescent_fertility_rate_births_per_1_000_women_ages_15_19_ <dbl> 44.1754,…
$ Age_dependency_ratio_of_working_age_population_              <dbl> 55.78849…
$ Age_population_age_0_female_interpolated                     <dbl> 38797, 3…
$ Age_population_age_0_male_interpolated                       <dbl> 40519, 4…
$ Age_population_age_01_female_interpolated                    <dbl> 36505, 3…
$ Age_population_age_01_male_interpolated                      <dbl> 38452, 4…
$ Age_population_age_02_female_interpolated                    <dbl> 35003, 3…
$ Age_population_age_02_male_interpolated                      <dbl> 37117, 3…
$ Age_population_age_03_female_interpolated                    <dbl> 34189, 3…
$ Age_population_age_03_male_interpolated                      <dbl> 36418, 3…
$ Age_population_age_04_female_interpolated                    <dbl> 33961, 3…
$ Age_population_age_04_male_interpolated                      <dbl> 36259, 3…
$ Age_population_age_05_female_interpolated                    <dbl> 34218, 3…
$ Age_population_age_05_male_interpolated                      <dbl> 36545, 3…
$ Birth_rate_crude_per_1_000_people_                           <dbl> 16.6, 16…
$ Death_rate_crude_per_1_000_people_                           <dbl> 9.5, 9.4…
$ Fertility_rate_total_births_per_woman_                       <dbl> 2.57, 2.…
$ GDP_current_US_                                              <dbl> 62489468…
$ GDP_per_capita_Current_US_                                   <dbl> 1364.517…
$ Inflation_consumer_prices_annual_                            <dbl> 1.255230…
$ Life_expectancy_at_birth_female_years_                       <dbl> 74.00, 7…
$ Life_expectancy_at_birth_male_years_                         <dbl> 70.44, 7…
$ Population_ages_0_14_female                                  <dbl> 561643, …
$ Population_ages_0_14_of_total_                               <dbl> 25.20778…
$ Population_ages_15_64_female                                 <dbl> 1484063,…
$ Population_ages_15_64_male                                   <dbl> 1455561,…
$ Population_ages_15_64_of_total_                              <dbl> 64.18959…
$ Population_ages_15_64_total                                  <dbl> 2939628,…
$ Population_ages_65_and_above_female                          <dbl> 261702, …
$ Population_ages_65_and_above_of_total_                       <dbl> 10.60263…
$ Population_female                                            <dbl> 2307409,…
$ Population_female_of_total_                                  <dbl> 50.38448…
$ Population_total                                             <dbl> 4579603,…
$ GDP_growth_annual_                                           <dbl> NA, 6.37…
```

Summary of data - 2
========================================================

```r
head(nordic_data)
```

```
# A tibble: 6 x 37
   year Country_Name Country_Code Adolescent_fert… Age_dependency_…
  <dbl> <chr>        <chr>                   <dbl>            <dbl>
1  1960 Denmark      DNK                      44.2             55.8
2  1961 Denmark      DNK                      45.0             55.6
3  1962 Denmark      DNK                      45.9             55.2
4  1963 Denmark      DNK                      45.5             54.8
5  1964 Denmark      DNK                      45.1             54.5
6  1965 Denmark      DNK                      44.7             54.3
# … with 32 more variables: Age_population_age_0_female_interpolated <dbl>,
#   Age_population_age_0_male_interpolated <dbl>,
#   Age_population_age_01_female_interpolated <dbl>,
#   Age_population_age_01_male_interpolated <dbl>,
#   Age_population_age_02_female_interpolated <dbl>,
#   Age_population_age_02_male_interpolated <dbl>,
#   Age_population_age_03_female_interpolated <dbl>,
#   Age_population_age_03_male_interpolated <dbl>,
#   Age_population_age_04_female_interpolated <dbl>,
#   Age_population_age_04_male_interpolated <dbl>,
#   Age_population_age_05_female_interpolated <dbl>,
#   Age_population_age_05_male_interpolated <dbl>,
#   Birth_rate_crude_per_1_000_people_ <dbl>,
#   Death_rate_crude_per_1_000_people_ <dbl>,
#   Fertility_rate_total_births_per_woman_ <dbl>, GDP_current_US_ <dbl>,
#   GDP_per_capita_Current_US_ <dbl>, Inflation_consumer_prices_annual_ <dbl>,
#   Life_expectancy_at_birth_female_years_ <dbl>,
#   Life_expectancy_at_birth_male_years_ <dbl>,
#   Population_ages_0_14_female <dbl>, Population_ages_0_14_of_total_ <dbl>,
#   Population_ages_15_64_female <dbl>, Population_ages_15_64_male <dbl>,
#   Population_ages_15_64_of_total_ <dbl>, Population_ages_15_64_total <dbl>,
#   Population_ages_65_and_above_female <dbl>,
#   Population_ages_65_and_above_of_total_ <dbl>, Population_female <dbl>,
#   Population_female_of_total_ <dbl>, Population_total <dbl>,
#   GDP_growth_annual_ <dbl>
```


Comparison with base R and Tidyverse
========================================================

```r
nordic_data[ , c('year', 'Country_Code')]
```


```r
nordic_data %>% 
  select(year, Country_Code)
```


========================================================
## Did you see *Pipes*? *( %>% )*


```r
nordic_data %>% 
  group_by(Country_Name) %>%
  summarise(Life_expectancy = max(Life_expectancy_at_birth_female_years_, na.rm = TRUE))
```



========================================================
## *Select:* Choosing is not losing!


```r
nordic_data %>% 
  select(year, Country_Name, Life_expectancy_at_birth_female_years_) %>% 
  head()
```

```
# A tibble: 6 x 3
   year Country_Name Life_expectancy_at_birth_female_years_
  <dbl> <chr>                                         <dbl>
1  1960 Denmark                                        74  
2  1961 Denmark                                        74.4
3  1962 Denmark                                        74.4
4  1963 Denmark                                        74.5
5  1964 Denmark                                        74.8
6  1965 Denmark                                        74.6
```


========================================================
## *Select:* we can use the column index to choose variables


```r
nordic_data %>% 
  select(1:2, 34:36) %>% 
  head()
```

```
# A tibble: 6 x 5
   year Country_Name Population_female Population_female_of_to… Population_total
  <dbl> <chr>                    <dbl>                    <dbl>            <dbl>
1  1960 Denmark                2307409                     50.4          4579603
2  1961 Denmark                2324007                     50.4          4611687
3  1962 Denmark                2342694                     50.4          4647727
4  1963 Denmark                2361695                     50.4          4684483
5  1964 Denmark                2380857                     50.4          4722072
6  1965 Denmark                2399304                     50.4          4759012
```

========================================================
## *Filter:* Do we want everything?


```r
nordic_data %>% 
  select(year, Country_Name, Population_ages_15_64_female, Population_ages_15_64_total, Population_ages_15_64_male) %>%
  filter(year == 1960)
```

```
# A tibble: 4 x 5
   year Country_Name Population_ages_15_… Population_ages_15… Population_ages_1…
  <dbl> <chr>                       <dbl>               <dbl>              <dbl>
1  1960 Denmark                   1484063             2939628            1455561
2  1960 Finland                   1432559             2758124            1325559
3  1960 Norway                    1127457             2257422            1129967
4  1960 Sweden                    2456706             4925522            2468814
```

How should we fill the blank areas?
========================================================
We need to *select* year, Country_Name, Population_female_of_total_ and the *filter* Country_Name for only Finland and year higher than 1965, then look at the first 10 rows.

```r
nordic data %>% 
  ____(__:__, Population_female_of_total_) %>% 
  ____(____ == "Finland") %>%
  ____(year >= ___) %>% 
  head(n = __)
```

Here is the solution:
========================================================


```r
nordic_data %>% 
 select(1:2, Population_female_of_total_)  %>% 
  filter(Country_Name == "Finland") %>% 
  filter(year >= 1965) %>% 
  head(n = 10)
```

```
# A tibble: 10 x 3
    year Country_Name Population_female_of_total_
   <dbl> <chr>                              <dbl>
 1  1965 Finland                             51.7
 2  1966 Finland                             51.7
 3  1967 Finland                             51.7
 4  1968 Finland                             51.7
 5  1969 Finland                             51.7
 6  1970 Finland                             51.7
 7  1971 Finland                             51.7
 8  1972 Finland                             51.7
 9  1973 Finland                             51.7
10  1974 Finland                             51.7
```

========================================================
## *Arrange:*  Let's order the rows

```r
nordic_data %>% 
  select(year, Country_Code, Population_total) %>% 
  arrange(Population_total) %>% 
  head()
```

```
# A tibble: 6 x 3
   year Country_Code Population_total
  <dbl> <chr>                   <dbl>
1  1960 NOR                   3581239
2  1961 NOR                   3609800
3  1962 NOR                   3638918
4  1963 NOR                   3666537
5  1964 NOR                   3694339
6  1965 NOR                   3723168
```


```r
nordic_data %>% 
  select(year, Country_Code, Population_total) %>% 
  arrange(desc(Population_total)) %>% 
  head()
```

```
# A tibble: 6 x 3
   year Country_Code Population_total
  <dbl> <chr>                   <dbl>
1  2017 SWE                  10057698
2  2016 SWE                   9923085
3  2015 SWE                   9799186
4  2014 SWE                   9696110
5  2013 SWE                   9600379
6  2012 SWE                   9519374
```


========================================================
## *Group_by & Summarise:* Let's create associations among groups!
Group by help us to find ...
We can use functions like `mean`, `median`, `sum`, `sd`, `max`, `min` to find out some group statistics.


```r
nordic_data %>% 
  group_by(year) %>% 
  summarise(avg_population = mean(Population_female_of_total_)) %>%
  head(5)
```

```
# A tibble: 5 x 2
   year avg_population
  <dbl>          <dbl>
1  1960           50.6
2  1961           50.6
3  1962           50.6
4  1963           50.6
5  1964           50.6
```

========================================================
## *Group_by & Summarise:* Let's create associations among groups!


```r
nordic_data %>% 
  group_by(year, Country_Name) %>% 
  summarise(median_gdp_per_capita = median(GDP_per_capita_Current_US_, na.rm = TRUE)) %>%
  head(5)
```

```
# A tibble: 5 x 3
# Groups:   year [2]
   year Country_Name median_gdp_per_capita
  <dbl> <chr>                        <dbl>
1  1960 Denmark                      1365.
2  1960 Finland                      1179.
3  1960 Norway                       1442.
4  1960 Sweden                       1983.
5  1961 Denmark                      1504.
```


========================================================
## *Mutate:* We need a new column!
Mutate helps us to create a new column

```r
nordic_data %>% 

  mutate(life_exp_ratio = Life_expectancy_at_birth_male_years_/
           Life_expectancy_at_birth_female_years_)
```



Let's put it all together!
========================================================
Can we find the true order of that code piece?


```r
 1- summarise(Life_expectancy = max(Life_expectancy_at_birth_female_years_, na.rm = T)) 
 2- arrange(Life_expectancy)
 3- select(year, Country_Name, Life_expectancy_at_birth_female_years_)
 4- nordic_data
 5- filter(year >= 2000)
```

Here is the solution
========================================================


```r
nordic_data %>% 
  select(year, Country_Name, Life_expectancy_at_birth_female_years_) %>%
  filter(year >= 2000) %>% 
  group_by(Country_Name) %>% 
  summarise(Life_expectancy = max(Life_expectancy_at_birth_female_years_, na.rm = T)) %>%
  arrange(Life_expectancy)
```

```
# A tibble: 4 x 2
  Country_Name Life_expectancy
  <chr>                  <dbl>
1 Denmark                 82.9
2 Norway                  84.2
3 Sweden                  84.2
4 Finland                 84.4
```


Good job!
========================================================
Thank you for joining the training! 

You can find lesson materials in here: 

















