Week 1: Intro to Data Wrangling with dplyr
========================================================
author: Hazel KAVILI
date: "2020-07-19"
autosize: true

Install Libraries
========================================================
We'll load the packages with `library(tidyverse)` instead of loading the core packages. Today we'll focus on `dplyr` (and one function from `readr` package for one-time).


```r
#install.packages("tidyverse")
library(tidyverse)
```

Load Data Into R
========================================================
Next wthing we'll do is load the data into our R environment. We'll use a data set about coffee ratings from weekly [Tidy Tuesday challenge ](https://github.com/rfordatascience/tidytuesday/blob/master/data/2020/2020-07-07/readme.md). 

We'll use `read_csv` function from readr package to get the data, and assign it to `coffee_ratings`. In the rest of the document, we'll use that name to call our data frame.


```r
coffee_ratings <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-07-07/coffee_ratings.csv')
```

First Glimpse to Data 
========================================================
Let's look at our data frame to get to know it.
There are some functions to check the structure and summary of the data: `str`, `summary`, `glimpse` are the most common ones.


```r
glimpse(coffee_ratings)
```

```
Rows: 1,339
Columns: 43
$ total_cup_points      <dbl> 90.58, 89.92, 89.75, 89.00, 88.83, 88.83, 88.75…
$ species               <chr> "Arabica", "Arabica", "Arabica", "Arabica", "Ar…
$ owner                 <chr> "metad plc", "metad plc", "grounds for health a…
$ country_of_origin     <chr> "Ethiopia", "Ethiopia", "Guatemala", "Ethiopia"…
$ farm_name             <chr> "metad plc", "metad plc", "san marcos barrancas…
$ lot_number            <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
$ mill                  <chr> "metad plc", "metad plc", NA, "wolensu", "metad…
$ ico_number            <chr> "2014/2015", "2014/2015", NA, NA, "2014/2015", …
$ company               <chr> "metad agricultural developmet plc", "metad agr…
$ altitude              <chr> "1950-2200", "1950-2200", "1600 - 1800 m", "180…
$ region                <chr> "guji-hambela", "guji-hambela", NA, "oromia", "…
$ producer              <chr> "METAD PLC", "METAD PLC", NA, "Yidnekachew Dabe…
$ number_of_bags        <dbl> 300, 300, 5, 320, 300, 100, 100, 300, 300, 50, …
$ bag_weight            <chr> "60 kg", "60 kg", "1", "60 kg", "60 kg", "30 kg…
$ in_country_partner    <chr> "METAD Agricultural Development plc", "METAD Ag…
$ harvest_year          <chr> "2014", "2014", NA, "2014", "2014", "2013", "20…
$ grading_date          <chr> "April 4th, 2015", "April 4th, 2015", "May 31st…
$ owner_1               <chr> "metad plc", "metad plc", "Grounds for Health A…
$ variety               <chr> NA, "Other", "Bourbon", NA, "Other", NA, "Other…
$ processing_method     <chr> "Washed / Wet", "Washed / Wet", NA, "Natural / …
$ aroma                 <dbl> 8.67, 8.75, 8.42, 8.17, 8.25, 8.58, 8.42, 8.25,…
$ flavor                <dbl> 8.83, 8.67, 8.50, 8.58, 8.50, 8.42, 8.50, 8.33,…
$ aftertaste            <dbl> 8.67, 8.50, 8.42, 8.42, 8.25, 8.42, 8.33, 8.50,…
$ acidity               <dbl> 8.75, 8.58, 8.42, 8.42, 8.50, 8.50, 8.50, 8.42,…
$ body                  <dbl> 8.50, 8.42, 8.33, 8.50, 8.42, 8.25, 8.25, 8.33,…
$ balance               <dbl> 8.42, 8.42, 8.42, 8.25, 8.33, 8.33, 8.25, 8.50,…
$ uniformity            <dbl> 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00…
$ clean_cup             <dbl> 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,…
$ sweetness             <dbl> 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00…
$ cupper_points         <dbl> 8.75, 8.58, 9.25, 8.67, 8.58, 8.33, 8.50, 9.00,…
$ moisture              <dbl> 0.12, 0.12, 0.00, 0.11, 0.12, 0.11, 0.11, 0.03,…
$ category_one_defects  <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
$ quakers               <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
$ color                 <chr> "Green", "Green", NA, "Green", "Green", "Bluish…
$ category_two_defects  <dbl> 0, 1, 0, 2, 2, 1, 0, 0, 0, 4, 1, 0, 0, 2, 2, 0,…
$ expiration            <chr> "April 3rd, 2016", "April 3rd, 2016", "May 31st…
$ certification_body    <chr> "METAD Agricultural Development plc", "METAD Ag…
$ certification_address <chr> "309fcf77415a3661ae83e027f7e5f05dad786e44", "30…
$ certification_contact <chr> "19fef5a731de2db57d16da10287413f5f99bc2dd", "19…
$ unit_of_measurement   <chr> "m", "m", "m", "m", "m", "m", "m", "m", "m", "m…
$ altitude_low_meters   <dbl> 1950.0, 1950.0, 1600.0, 1800.0, 1950.0, NA, NA,…
$ altitude_high_meters  <dbl> 2200.0, 2200.0, 1800.0, 2200.0, 2200.0, NA, NA,…
$ altitude_mean_meters  <dbl> 2075.0, 2075.0, 1700.0, 2000.0, 2075.0, NA, NA,…
```

Summary of Data 
========================================================
There are some other functions to check your data: `str`, `summary`, `glimpse` , `head`, `tail`


```r
head(coffee_ratings, n = 3)
```

There are 43 variables (columns) and 1339 rows in our data frame. There is data for both Arabica and Robusta beans, across many countries and professionally rated on a 0-100 scale. All sorts of scoring/ratings for things like acidity, sweetness, fragrance, balance, etc - may be useful for either separating into visualizations/categories or for modeling/recommenders.

Comparison with base R and Tidyverse
========================================================
Before moving into dplyr verbs, I'd like to show you a comparison of base R and tidyverse. 
The two code chunks are doing the same thing: selecting two columns from our dataframe. Can you tell which one is more intuitive? 


```r
coffee_ratings[ , c('species', 'country_of_origin')]
```


```r
coffee_ratings %>% 
  select(species, country_of_origin)
```


========================================================
## Did you see *Pipes*? *( %>% )*

Did you see that ( %>% ) sign in the previous code piece? 
It is called Pipe and it helps us to connect our dplyr verbs. We'll use it a lot during our session! 
Let's try to read our code below: I have the dataframe called coffee_ratings, I call it. And then I group that dataframe by `species` variable and then I summarise it with two statistics. One is mean of a variable and the other is some proportion. 

What I see in here is that everything is chained, right? I can read that code from left to right like a sentence. Pipe helps us to connect those verbs.


```r
coffee_ratings %>%
  group_by(species) %>%
  summarise(avg_rating = mean(total_cup_points),
            proportion = n()/nrow(coffee_ratings))
```



========================================================
## *Select:* Choosing is not losing!

Now we are moving to our first verb. `select` helps us select the variables we want to use or we need for our analysis. We probably don't need all 43 variables to answer some questions.


```r
coffee_ratings %>% 
  select(species, country_of_origin, color, certification_body) %>% 
  head()
```

```
# A tibble: 6 x 4
  species country_of_origin color        certification_body                
  <chr>   <chr>             <chr>        <chr>                             
1 Arabica Ethiopia          Green        METAD Agricultural Development plc
2 Arabica Ethiopia          Green        METAD Agricultural Development plc
3 Arabica Guatemala         <NA>         Specialty Coffee Association      
4 Arabica Ethiopia          Green        METAD Agricultural Development plc
5 Arabica Ethiopia          Green        METAD Agricultural Development plc
6 Arabica Brazil            Bluish-Green Specialty Coffee Institute of Asia
```


========================================================
## *Select:* we can use the column index to choose variables


```r
 select(coffee_ratings, 1:4, 21:34) %>% 
  head()
```

```
# A tibble: 6 x 18
  total_cup_points species owner country_of_orig… aroma flavor aftertaste
             <dbl> <chr>   <chr> <chr>            <dbl>  <dbl>      <dbl>
1             90.6 Arabica meta… Ethiopia          8.67   8.83       8.67
2             89.9 Arabica meta… Ethiopia          8.75   8.67       8.5 
3             89.8 Arabica grou… Guatemala         8.42   8.5        8.42
4             89   Arabica yidn… Ethiopia          8.17   8.58       8.42
5             88.8 Arabica meta… Ethiopia          8.25   8.5        8.25
6             88.8 Arabica ji-a… Brazil            8.58   8.42       8.42
# … with 11 more variables: acidity <dbl>, body <dbl>, balance <dbl>,
#   uniformity <dbl>, clean_cup <dbl>, sweetness <dbl>, cupper_points <dbl>,
#   moisture <dbl>, category_one_defects <dbl>, quakers <dbl>, color <chr>
```


========================================================
Most of the dplyr verbs have that structure:

```r
1- dplyr_verb(data_frame, colum_name, some_other_arguments)
2- data_frame %>% dplyr_verb(column_name, some_other_arguments)
```

========================================================
## *Filter:* Do we want everything?
Let's say we want to look at our coffee_ratings dataset only for Ethiopia originated coffees. Then what we need to do is `filter` our dataset by using necessary column and value:


```r
coffee_ratings %>% 
  filter(country_of_origin == "Ethiopia") %>% 
  head(n = 3)
```

```
# A tibble: 3 x 43
  total_cup_points species owner country_of_orig… farm_name lot_number mill 
             <dbl> <chr>   <chr> <chr>            <chr>     <chr>      <chr>
1             90.6 Arabica meta… Ethiopia         metad plc <NA>       meta…
2             89.9 Arabica meta… Ethiopia         metad plc <NA>       meta…
3             89   Arabica yidn… Ethiopia         yidnekac… <NA>       wole…
# … with 36 more variables: ico_number <chr>, company <chr>, altitude <chr>,
#   region <chr>, producer <chr>, number_of_bags <dbl>, bag_weight <chr>,
#   in_country_partner <chr>, harvest_year <chr>, grading_date <chr>,
#   owner_1 <chr>, variety <chr>, processing_method <chr>, aroma <dbl>,
#   flavor <dbl>, aftertaste <dbl>, acidity <dbl>, body <dbl>, balance <dbl>,
#   uniformity <dbl>, clean_cup <dbl>, sweetness <dbl>, cupper_points <dbl>,
#   moisture <dbl>, category_one_defects <dbl>, quakers <dbl>, color <chr>,
#   category_two_defects <dbl>, expiration <chr>, certification_body <chr>,
#   certification_address <chr>, certification_contact <chr>,
#   unit_of_measurement <chr>, altitude_low_meters <dbl>,
#   altitude_high_meters <dbl>, altitude_mean_meters <dbl>
```

How should we fill the blank areas?
========================================================
Now it's time for a quick question. 
We need to *select* total_cup_points, species, owner, countyr_of_origin and number_of_bags. Then *filter* country of origin for only Brazil and total cup points is higher than 70, then look at the *first 3 rows* of data set.


```r
coffee_ratings data %>% 
  ____(_:_, number_of_bags) %>% 
  ____(____ == "Brazil") %>%
  ____(total_cup_points > ___) %>% 
  head(n = __)
```

Here is the solution:
========================================================


```r
coffee_ratings %>% 
  select(1:4, number_of_bags) %>% 
  filter(country_of_origin == "Brazil") %>%
  filter(total_cup_points > 70) %>% 
  head(n = 3)
```

```
# A tibble: 3 x 5
  total_cup_points species owner     country_of_origin number_of_bags
             <dbl> <chr>   <chr>     <chr>                      <dbl>
1             88.8 Arabica ji-ae ahn Brazil                       100
2             86.9 Arabica nucoffee  Brazil                         3
3             86.4 Arabica nucoffee  Brazil                        29
```

========================================================
## *Arrange:*  Let's bring some order to data!

`arrange` sorts a data frame by one or more columns. Let's say we want to look at our data frame arranged by `sweetness`. In default, your dataset will be arranged bu ascending order.


```r
coffee_ratings %>% 
  arrange(sweetness) %>% 
  head()
```

```
# A tibble: 6 x 43
  total_cup_points species owner country_of_orig… farm_name lot_number mill 
             <dbl> <chr>   <chr> <chr>            <chr>     <chr>      <chr>
1              0   Arabica bism… Honduras         los hica… 103        cigr…
2             59.8 Arabica juan… Guatemala        finca el… <NA>       bene…
3             77.6 Arabica kona… United States (… <NA>      <NA>       <NA> 
4             67.9 Arabica myri… Haiti            200 farms <NA>       coeb…
5             63.1 Arabica expo… Nicaragua        finca la… 017-053-0… bene…
6             82.3 Arabica ipan… Brazil           rio verde <NA>       ipan…
# … with 36 more variables: ico_number <chr>, company <chr>, altitude <chr>,
#   region <chr>, producer <chr>, number_of_bags <dbl>, bag_weight <chr>,
#   in_country_partner <chr>, harvest_year <chr>, grading_date <chr>,
#   owner_1 <chr>, variety <chr>, processing_method <chr>, aroma <dbl>,
#   flavor <dbl>, aftertaste <dbl>, acidity <dbl>, body <dbl>, balance <dbl>,
#   uniformity <dbl>, clean_cup <dbl>, sweetness <dbl>, cupper_points <dbl>,
#   moisture <dbl>, category_one_defects <dbl>, quakers <dbl>, color <chr>,
#   category_two_defects <dbl>, expiration <chr>, certification_body <chr>,
#   certification_address <chr>, certification_contact <chr>,
#   unit_of_measurement <chr>, altitude_low_meters <dbl>,
#   altitude_high_meters <dbl>, altitude_mean_meters <dbl>
```

========================================================
## *Arrange:*  Let's bring some order to data!
If we want to order it by descending order of sweetness, we can use this syntax.

```r
coffee_ratings %>% 
  select(species, country_of_origin, color, sweetness) %>% 
  arrange(desc(sweetness)) %>% 
  head()
```

```
# A tibble: 6 x 4
  species country_of_origin color        sweetness
  <chr>   <chr>             <chr>            <dbl>
1 Arabica Ethiopia          Green               10
2 Arabica Ethiopia          Green               10
3 Arabica Guatemala         <NA>                10
4 Arabica Ethiopia          Green               10
5 Arabica Ethiopia          Green               10
6 Arabica Brazil            Bluish-Green        10
```


========================================================
## *Group_by & Summarise:* Let's create associations among groups!
We often want to look at our data by some group (if we have) for example country, year, age, gender, education, etc. to spot some differences (if there is).
`group_by` gives the data frame a grouping using one or more columns, which modifies the subsequent call to `summarize`. 

We can use functions like `mean`, `median`, `sum`, `sd`, `max`, `min` to find out some group statistics inside of `summarize` function.


```r
coffee_ratings %>%
  group_by(species) %>%
  summarise(avg_rating = mean(total_cup_points),
            proportion = n()/nrow(coffee_ratings))
```

```
# A tibble: 2 x 3
  species avg_rating proportion
  <chr>        <dbl>      <dbl>
1 Arabica       82.1     0.979 
2 Robusta       80.9     0.0209
```

========================================================
## *Group_by & Summarise:* Let's create associations among groups!


```r
coffee_ratings %>%
  group_by(country_of_origin) %>%
  summarise(avg_rating = mean(total_cup_points),
            median_rating = median(total_cup_points)
            )
```

```
# A tibble: 37 x 3
   country_of_origin avg_rating median_rating
   <chr>                  <dbl>         <dbl>
 1 Brazil                  82.4          82.4
 2 Burundi                 81.8          81.8
 3 China                   82.9          83.2
 4 Colombia                83.1          83.2
 5 Costa Rica              82.8          83.2
 6 Cote d?Ivoire           79.3          79.3
 7 Ecuador                 80.2          78.8
 8 El Salvador             83.1          82.8
 9 Ethiopia                85.5          85.2
10 Guatemala               81.8          82.5
# … with 27 more rows
```


========================================================
## *Mutate:* We need a new column!
`mutate` lets us add or overwrite columns by computing a new value for them.
For example, in the code below, we want a column name `is_processing_method_full` which is filled by checking if `processing_method` have some value or not. If it is not NA, we'll write 1, otherwise 0. 

We didn't have `is_processing_method_full` before but we create it by using `processing_method` variable.


```r
coffee_ratings %>% 
  select(species, country_of_origin, processing_method) %>% 
  mutate(is_processing_method_full = ifelse(!is.na(processing_method), 1, 0))
```



Let's put it all together!
========================================================
We want to look at the mean of aroma, flavor and aftertast variables by countries.
Can we find the true order of that code piece?



```r
1- filter(species == "Arabica")  
2- filter(!is.na(country_of_origin)) 
3- select(total_cup_points, species, country_of_origin, processing_method, aroma, flavor, aftertaste)
4- coffee_ratings
5- arrange(mean_aroma) 
6- summarise(mean_aroma = mean(aroma),
            mean_flavor = mean(flavor),
            mean_aftertaste = mean(aftertaste))
7- group_by(country_of_origin)
```

Here is the solution:
========================================================


```r
coffee_ratings %>% 
  select(total_cup_points, species, country_of_origin, processing_method, aroma, flavor, aftertaste) %>%
  filter(species == "Arabica") %>% 
  filter(!is.na(country_of_origin)) %>% 
  group_by(country_of_origin) %>% 
  summarise(mean_aroma = mean(aroma),
            mean_flavor = mean(flavor),
            mean_aftertaste = mean(aftertaste)) %>%
  arrange(mean_aroma) 
```

```
# A tibble: 36 x 4
   country_of_origin mean_aroma mean_flavor mean_aftertaste
   <chr>                  <dbl>       <dbl>           <dbl>
 1 Haiti                   7.15        7.00            7.11
 2 Mauritius               7.25        7.25            7.17
 3 Honduras                7.29        7.23            7.06
 4 Myanmar                 7.30        7.33            7.12
 5 Nicaragua               7.33        7.32            7.20
 6 Philippines             7.36        7.23            7.30
 7 Burundi                 7.42        7.46            7.25
 8 Cote d?Ivoire           7.42        7.25            6.83
 9 Mexico                  7.46        7.38            7.23
10 Vietnam                 7.48        7.48            7.30
# … with 26 more rows
```


Good job!
========================================================
Thank you for joining the training! 

You can find the all lesson materials my [Github page.](https://github.com/UniversalTourist/tidyverse_trainer_exam_materials)

Any questions? I'd be happy to answer! 

















