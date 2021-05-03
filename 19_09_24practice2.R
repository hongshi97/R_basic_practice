install.packages("dplyr") #install.packages()함수의 인자에는 따옴표(" or ')를 써야한다.
library(dplyr)           # 파이프 연산자를 쓰려면 반드시 library(dplyr)를 해야한다.
x <- c(1:5)
mean(x)
x %>% mean()             # x의 값을 mean()함수의 첫번째 인자로 사용

z<- c(1,2,NA,8,3,NA,3)
sum(is.na(z))            # is.na(z)의 결과가 FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE기 때문에 sum()은 2 출력
z %>% is.na() %>% sum    # PPT 자료를 보면 그냥 is.na라고 되어있고 실제로 작동도 되는데 함수기 때문에 is.na()로 쓰는게 바람직             
z %>% is.na() %>% mean() # 추가로 해본 거. 1 + 1 / 7 !!!
z %>% mean(na.rm=TRUE)   # NA를 제거하고 변수 z의 평균 구함
