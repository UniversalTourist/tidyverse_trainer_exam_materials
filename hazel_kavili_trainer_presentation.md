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

Summary of data
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


Comparison with base R and Tidyverse
========================================================




========================================================
## Did you see *Pipes*? *( %>% )*


```r
nordic_data %>% 
  select(Country_Name, Fertility_rate_total_births_per_woman_, year) %>% 
  filter( year == 1960) 
```



========================================================
## *Select:* Choosing is not losing!




========================================================
## *Filter:* Do we want everything?



How should we fill the blank areas?
========================================================



Here is the solution:
========================================================




========================================================
## *Mutate:* I need a new column!




========================================================
## *Arrange:*  Let's order the rows


Let's put it all together!
========================================================



Here is the solution
========================================================




Good job!
========================================================
Thank you for joining the training! 

You can find lesson materials in here: 

















