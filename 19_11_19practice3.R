library(ggplot2)
library(ggthemes)

TS <- read.csv("example_ts.csv") 
TS                                  # TS는 시계열 데이터(시간으로 관측한 데이터)임. 

table(TS$Date)

ggplot(TS, aes(x=Date, y=Sales)) + geom_line()  
ggplot(TS, aes(x=Date, y=Sales)) + geom_line() + geom_point() # 결과 그래프가 좀 이상하게 생겼음. 점 사이가 대박 먼 거 존재함
ggplot(TS, aes(x=factor(Date), y=Sales, group=1)) + geom_line() # Date를 factor()함수를 이용해서 factor형(요인화 함)으로 사용한다는 거 중요!!!
# 요인화: ggplot2 패키지는 x축을 자동으로 인식해 생략해서 그래프를 나타내는 경우가 존재하는데 요인화를 통해
# x축에 사용되는 모든 값을 표시

ggplot(TS, aes(x=factor(Date) ,y=Sales,group=1)) + geom_line() + geom_point() # Date를 factor형으로 바꾸고 그룹으로 묶어줌
ggplot(TS, aes(x=factor(Date) ,y=Sales,group=1)) + geom_line() + geom_point() + theme_light()

ggplot(TS, aes(x=factor(Date) ,y=Sales,group=1)) + geom_line(colour="orange1",size=1) + 
  geom_point(colour="orange2",size=4) + theme_light()   # line과 point에 각각 색깔과 크기를 지정해 줌.

ggplot(TS, aes(x=factor(Date),y=Sales,group=1)) + 
  geom_line(colour="orange1", size=1) +
  geom_point(colour="orange2", size=4) +
  xlab("년도") + ylab("매출") + ggtitle("경희주식회사월별매출")+   # x축, y축과 그래프에 title을 붙임
  theme_light()
