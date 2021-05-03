install.packages("ggplot2")
library(ggplot2)
x <- c("a","b","c","a")
x
qplot(x)                # qplot() 함수: 변수 x의 값들을 막대 그래프로 표현

mpg                     # 11개의 변수가 존재하고, 234개의 관측치가 존재하는 데이터 셋, ggplot2 패키지 안에 들어있음.
head(mpg, n = 10)
summary(mpg)            # summary()함수. 인자의 Data를 요약, 정리해서 보여줌. 각 변수에 대한 설명을 보여줌.
help(mpg)               # help()함수. mpg라는 데이터 셋이 어떤 건지 알려줌.

diamonds
head(diamonds, n = 10)
summary(diamonds)
help(diamonds)

qplot(data = mpg, x = hwy)   # qplot(사용할 데이터, x축, y축, 사용할 그래프, 컬러 등)
qplot(data = mpg, x = cty)   # mpg 데이터를 사용, x축은 cty 사용
qplot(data = mpg, x= drv, y = hwy)  # mpg 데이터를 사용, x축은 drv, y축은 hwy 사용. drv가 몇일 때 hwy는 몇인지 표시
qplot(data=mpg, x= drv, y = hwy, geom = "line")
qplot(data=mpg, x=drv, y=hwy, geom="boxplot")
qplot(data=mpg,x=drv,y=hwy,geom="boxplot",colour=drv)   # colour 말고 color 라고 해도 된다
