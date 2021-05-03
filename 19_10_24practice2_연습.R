library(ggplot2)
library(dplyr)

displ4 <- mpg %>% filter(mpg$displ <=4)
displ5 <- mpg %>% filter(mpg$displ >=5)

mean(displ4$hwy)
mean(displ5$hwy)

audi <- mpg %>% filter(manufacturer == "audi")
toyota <- mpg %>% filter(manufacturer =="toyota")

mean(audi$cty)
mean(toyota$cty)

cfh <- mpg %>% filter(manufacturer %in% c("chevrolet","ford","honda"))
cfh$hwy %>% mean()

# 배기통이 4이하인 자동차의 hwy (고속도로 연비)가 더 좋은지 배기통이 5이상인 자동차의 hwy (고속도로 연비)가 더 좋은지 비교.