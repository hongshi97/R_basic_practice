library(ggplot2)
library(dplyr)

new_mpg <- mpg %>% select(class,cty)

new_mpg %>% head()

suv <- new_mpg %>% filter(class=="suv") %>% select(cty)
mean(suv$cty)

compact <- new_mpg %>% filter(class=="compact") %>% select(cty)
compact$cty %>% mean()
