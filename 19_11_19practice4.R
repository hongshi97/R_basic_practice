install.packages("dplyr")
library("dplyr")
library("ggplot2")
library("ggthemes")

DF <- read.csv("example_population_f.csv")
str(DF)
head(DF)
DF <- DF[,-1] # 열 하나를 빼고 다시 DF에 저장 ( 이 예제의 경우 DF의 첫번째 열이었던 X를 빼고 다시 저장함)

# 어느 열이 빼졌는지 확인해본 거(혼자 한 거) #
str(DF)  
head(DF)
##############################################
DF <- tbl_df(DF)   # tbl_df는 dplyr패키지 안에 존재하는 함수, data frame tibble을 만드는 함수.

DF2 <- filter(DF, Provinces =="충청북도" | Provinces =="충청남도")  
# filter함수 이용해서 Provinces가 충청북도"거나" 충청남도인 행(관측치) 뽑아서 DF2에 저장

DF2 <- DF %>% filter(Provinces == "충청북도" | Provinces =="충청남도")  # 파이프 연산자 %>%  이용해서 한 거.

Graph <- ggplot(DF2, aes(x=City,y=Population,fill=Provinces)) + geom_bar(stat="identity") + theme_wsj()
Graph


GraphReorder <- ggplot(DF2, aes(x = reorder(City,Population),y=Population,fill=Provinces)) + geom_bar(stat="identity") +
  theme_wsj()  # 위에 Graph는 들쑥날쑥한데 GraphReorder의 경우 reorder함수를 통해 보기 좋게 정리해 줌.
# reorder 함수를 사용해서 어떤 기준으로 정렬할 지 설정 가능. 기본은 오름차순 정렬이며, 정렬할 값에 -를 붙이면 내림차순
# 여기서는 Population 값을 기준으로 오름차순으로 City를 x축에 설정.
GraphReorder

DF3 <- filter(DF, SexRatio > 1 , PersInHou < 2)  # SexRatio > 1 "이고" PersInHou < 2 인 행(관측치)들을 DF3에 저장 
# "|"를 이용해 "또는"(OR)을 표현
# ","이나 "&"를 이용해 "이고"(AND)를 표현

Graph <- ggplot(DF3, aes(x=City, y=SexRatio, fill=Provinces)) + geom_bar(stat='identity') + theme_wsj()
# fill=Provinces : Provinces별로 도형 안을 색을 채움.

Graph

# fill 함수는 도형에 색을 채워줄 때 사용합니다. bar그래프와 오차그래프 등 채울 공간이 있는 도형에 색상을 채워줍니다.
# color 함수는 선의 색깔을 채워줄 때 사용하는 함수입니다. Bar 그래프의 테두리, Line그래프의 색상, 
# 경우에 따라 Point 그래프의 Point 테두리 등에 색상을 채워줍니다.
