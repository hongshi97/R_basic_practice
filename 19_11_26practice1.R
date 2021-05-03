library(ggplot2)
library(dplyr)

economics
View(economics)
str(economics)

ggplot(data=economics, aes(x=date, y=unemploy)) + geom_line() # date의 각 값(날짜)이 하나밖에 없어서 factor로 사용안해도 됨.

ggplot(data=mpg, aes(x=drv,y=hwy)) + geom_boxplot()

#실습
# class가 "compact", "subcompact", "suv"인 자동차의 cty가 어떻게 다른지 비교해 보려고 합니다.
# 상자 그래프로 만들어 보세요.

### 내가 한 거 ###
table(mpg$class)

class_mpg <- mpg %>%
  filter(class %in% c("compact","subcompact","suv"))

table(class_mpg$class)

ggplot(data=class_mpg, aes(x=class,y=cty)) + geom_boxplot()

### 교수님께서 하신 거 ###
mpg <- as.data.frame(mpg)

class_mpg <- mpg %>% 
  filter(class %in% c("compact","subcompact","suv"))         # 매치 연산자 %in% 사용

ggplot(data=class_mpg, aes(x=class,y=cty)) + geom_boxplot()
