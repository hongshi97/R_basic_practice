library(dplyr)

exam <- read.csv("csv_exam.csv")

# arrange() 함수: 데이터를 원하는 순서대로 정렬하는 함수 (오름차순이 기본.)
# arrange() 함수의 가장 큰 목적은 그룹으로 묶는 것!

# exam 데이터를 수학 점수를 기준으로 오름차순으로 정렬 (낮은 점수에서 높은 점수 순서로)
exam %>% arrange(math)   # arrange(exam,math)와 동일.

# 내림차순 정렬은 arrange() 안에 desc() 사용
# 수학 점수를 이용하여 내림차순으로 정렬 (높은 점수에서 낮은 점수 순서로)
exam %>% arrange(desc(math)) 

# 정렬 기준이 여러 개일 때는 콤마를 이용하여 오름차순으로 정렬
# class를 첫 번째 기준으로 정렬하고, math를 두 번째 기준으로 정렬 (같은 class 안에서는 math 순서로 정렬함을 의미)
exam %>% arrange(class,math)


# 실습
mpg <- as.data.frame(ggplot2::mpg)  
# ggplot2를 따로 library 하지 않고 ggplot2::mpg를 통해 ggplot2 패키지에 있는 mpg 데이터를 사용
# 오른쪽에 있는 mpg가 ggplot2에 있는 원본이고, 왼쪽에 mpg라는 새로운 변수는 복사본

audi <- mpg %>% filter(manufacturer == 'audi')
# mpg 데이터 중 manufacturer이 audi인 행들을 audi라는 변수에 저장

audi %>% arrange(desc(hwy)) %>% head(5)
# audi를 hwy 기준으로 내림차순으로 정렬해서 위에서 5개 (1위에서 5위) 보여줌

                 