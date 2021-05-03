library(dplyr)
library(ggplot2)
library(ggthemes)

DF <- read.csv("example_population_f.csv")
DF <- DF[,-1]

DF <- mutate(DF,SexF = ifelse(SexRatio < 1, "여자비율이 높음", ifelse(SexRatio > 1, "남자비율이 높음","남여비율이 같음")))
View(DF)
DF$SexF <- factor(DF$SexF)
DF$SexF                       # factor로 바꾸긴 했는데 대소 관계가 없음.
DF$SexF <- ordered(DF$SexF, c("여자비율이 높음","남여비율이 같음","남자비율이 높음"))
DF$SexF
# ordered()라는 함수를 써서 "여자비율이높음","남여비율이같음","남자비율이높음"순서로 다시 정렬함.
# 나중에 SexF로 대소관계를 비교할 수가 있어서 ordered 함. 그 때 위와 같은 순서대로 비교하게 됨.
# DF$SexF는 factor형이라서 어떤 값이 있는지 모르는데 글자를 어떻게 비교해야 하는지 모르는데 ordered를 해서 
# 위의 순서를 가지고 크기 비교를 할 수 있게 만듦.

View(DF)

DF2 <- filter(DF,Provinces == "경기도")
Graph <- ggplot(DF2, aes(x=City,y=(SexRatio-1),fill=SexF)) + geom_bar(stat = "identity", position = "identity") +
  theme_wsj()    # bar의 색깔을 SexF에 따라서 채움.
Graph

DF4 <- filter(DF, Provinces =="서울특별시")
Graph2 <- ggplot(DF4, aes(x=City,y=(SexRatio-1),fill=SexF)) + geom_bar(stat="identity", position = "identity") +
  theme_wsj()
Graph2
