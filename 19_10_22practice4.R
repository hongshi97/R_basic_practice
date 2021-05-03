library(ggplot2)
library(dplyr)

str(mpg)   # mpg 데이터는 ggplot2 패키지 안에 존재하는 데이터 셋

mpg1 <- mpg

mpg1 <- rename(mpg1, city = cty)     # rename() 함수를 사용하려면 dplyr 패키지를 불러와야 함
mpg1 <- rename(mpg1, highway = hwy)  # rename()함수. 변수명을 바꿔줌. rename(데이터프레임이름, 사용할 변수명 = 변수)

# mpg1 <- rename(mpg1, city = cty, highway = hwy)로 한 번에 써도 됨

mpg1
str(mpg1)
