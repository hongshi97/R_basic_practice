library(ggplot2)
library(dplyr)

midwest               # midwest라는 데이터 셋은 ggplot2 패키지 안에 존재함.

mid1 <- midwest      

# 각종 함수에서 Dataframe의 특정 변수 안에 있는 '값'들을 사용해야 하는 경우 $나 [['변수명']]이나 attach() 기능 사용해야한다.
# rename()의 경우 변수 안에 있는 값이 아니라 그냥 변수의 이름을 바꾸는 것이라서 $나 [['변수명']], attach()기능 없이도 된다.

mid1 <- rename(midwest, total = poptotal, asian = popasian)    # rename()함수를 이용해서, midwest라는 데이터 프레임 안에 변수명 바꿈
                                                               # midwest안에 있는 poptotal이라는 변수명을 total, popasian이라는 변수명을 asian으로 바꿔줌
                                                               # rename()함수 사용할 때 새로 바꿀 변수명 = 기존 변수명 형태!!!
mid1
head(mid1, 10)    # head()함수를 이용해서 mid1이라는 데이터 프레임의 데이터 중 위에서 10개를 보여줌. head(mid1, n=10) 도 가능

str(mid1)         

attach(mid1)  # attach()함수를 씀으로써 mid1 데이터프레임 내부의 변수를 사용할때 일일이 mid1$asian과 같이 안 하고 asian만 사용해도 되게 함

asianper <- (asian/total) * 100   # 전체 인구 대비 아시아 인구 백분율 만들어서 asianper라는 파생변수를 만들어 줌.

asianper

hist(asianper)    # hist()함수를 사용해서 히스토그램을 그림.

summary(asianper)  # asianper라는 변수의 최솟값, 하한 사분위수, 중앙값, 평균값, 상한 사분위수, 최댓값 알려줌

mid1$test <- ifelse(asianper >= mean(asianper),"large","small") # asianper의 각 관측치들이 평균을 넘으면 large를 
                                                    #test라는 변수에 넣고, 평균이 넘지 않으면 small을 test라는 변수에 넣음

mid1$test
mid1["test"]
mid1[["test"]]         # mid1$test와 동일한 기능
class(mid1["test"])
class(mid1[["test"]])

summary(mid1$test)
table(mid1$test)      # table() 함수는 데이터의 빈도를 보여준다.
