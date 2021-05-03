library(ggplot2)
library(dplyr)

new <- mpg %>% select(class,cty)

str(new)

suv <- new %>% filter(class=="suv")
compact <- new %>% filter(class=="compact")

mean_suv <- suv$cty %>% mean()
mean_compact <- compact$cty %>% mean()

mean_suv ; mean_compact

