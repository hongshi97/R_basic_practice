library(ggplot2)

mpg$total <- (mpg$cty + mpg$hwy) / 2 

mean(mpg$total)

summary(mpg$total)
hist(mpg$total)     # hist() 함수. 히스토그램 그려줌. 히스토그램과 막대 그래프이 차이 생각해보기!

mpg$test <- ifelse(mpg$total>=20,"pass","fail")

head(mpg,20)

table(mpg$test)  # table()함수. 변수가 각각 몇개 있는지 출력
qplot(mpg$test)  # mpg$test의 막대 그래프 생성

mpg$grade <- ifelse(mpg$total >= 30, "A",ifelse(mpg$total>=20 & mpg$total<=29,"B","C")) #ifelse() 시험 나온다!! 잘 알아두자.

head(mpg)

table(mpg$grade)
qplot(mpg$grade)

# ifelse 중복문!!!
mpg$grade <- ifelse(mpg$total>=30,"A",ifelse(mpg$total>=25 & mpg$total < 30,"B",ifelse(mpg$total >= 20&mpg$total<25,"C","D")))
head(mpg)
table(mpg$grade)
