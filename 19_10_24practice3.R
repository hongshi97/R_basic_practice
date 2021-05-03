library(ggplot2)
library(dplyr)

new_data <- mpg %>% select(class, cty)

new_data %>% head()

df_suv <- new_data %>% filter(class == 'suv')

new_data %>% filter(class == 'suv') %>%  select(cty)

mean(df_suv$cty)

df_compact <- new_data %>% filter(class == 'compact')

new_data %>% filter(class =='suv') %>% select(cty)

mean(df_compact$cty)
