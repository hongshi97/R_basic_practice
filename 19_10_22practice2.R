install.packages("ggplot2") 
library(ggplot2)               # install.packages() 함수에서는 변수에 따옴표 꼭 써야하고, library에는 써도 되고 안 써도 된다.

diamonds
help(diamonds) # diamonds라는 변수가 어떤 것인지 설명이 나옴

df_dia <- as.data.frame(diamonds)  
# as.data.frame(변수명)을 이용해서 해당 변수를 데이터 프레임 형태로, 그리고 그거를 df_dia라는 변수에 저장

head(df_dia,15)          
tail(df_dia, n=15)
View(df_dia)          # R studio 스크립트 화면에 df_dia라는 이름으로 엑셀 화면 같은 거 띄워서 보여줌.
dim(df_dia)       # dim()함수. 데이터 프레임이 구성하는 행(관측치)과 열(변수)의 수 출력
str(df_dia)       # str()함수. 데이터 프레임에 들어 있는 변수들의 속성과 몇 개의 예시를 보여줌
summary(df_dia)  # df_dia의 각 변수별 Min,하한 사분위수, 중앙값, 평균값, 상한 사분위수, 최대값 출력

