library(ggplot2)

economics

ggplot(economics, aes(x=date, y=pop)) + geom_line()

install.packages("lubridate")
library(lubridate)

economics$year <- year(economics$date)  # year()는 lubridate 패키지에 포함된 함수. 
                                        #economics$date 값들 중 year에 해당하는 것만 출력
economics$month <- month(economics$date, label = TRUE)  # label = TRUE로 하면 팩터형으로 저장, label = FALSE로 하면 numeric으로 저장

class(economics$month) # factor형인지 확인해 본 거.

econ2000 <- economics[which(economics$year >= 2000),]  # economics에서 year가 2000이상인 행(관측치)를 econ2000이라는 변수에 저장
econ2000

library(dplyr)
econ2000 <- economics %>% filter(year >= 2000)  # 위 코드를 파이프 연산자를 이용해서 코딩한 거. 
# filter() 함수 안에서 economics$year 인지 그냥 year라고 쓰는지 구분하기!! $표시 안하고 그냥 쓴다!!!
# 이거처럼 어느 문장을 파이프 연산자를 이용해서 바꿔서 쓰는 거 기말에 나온다!
econ2000

library(scales)

g1 <- ggplot(econ2000,aes(x=month,y=pop))
g2 <- geom_line(aes(color = factor(year),group=year))  # year를 기준으로 그룹을 나눔 (연도별로 나눔)
g3 <- scale_color_discrete(name = "Year")  # scale_color_discrete는 scales 패키지에 있는 함수
# 범례의 타이틀을 바꿀 때에는 범례가 연속형인지 범주형인지에 따라서 scale_color_continuous()이나 scale_color_discrete()을 사용
g4 <- scale_y_continuous(labels=comma)     # scale_y_continuous는 scales 패키지에 있는 함수
# scale_color_discrete()랑 scale_y_continuous() 함수는 교수님이 따로 설명 안하시고 그냥 scales 패키지 안에 있는 함수라고
# 말하고 넘어가심
g <- g1 + g2 + g3 + g4
g
g + labs(title = "Population Growth", x = "Month", y = "Population")  # labs() 함수를 통해 이름을 붙여줌

install.packages("ggthemes")
library(ggthemes)

g <- ggplot(data = diamonds, aes(x= carat, y=price)) + geom_point(aes(color=color))   # aes()함수 내 color 옵션 이용함
g
g + theme_economist() + scale_colour_economist()
g + theme_excel() + scale_colour_excel()
g + theme_tufte()
g + theme_wsj()
