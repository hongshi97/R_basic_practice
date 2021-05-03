install.packages("dplyr")
library(dplyr)

exam <- read.csv("csv_exam.csv")
exam

exam %>% filter(class ==1) #filter(exam, class==1)과 동일
exam %>% filter(class ==3)

exam %>% filter (class != 1)
exam %>% filter (class != 3)

exam %>% filter(math>50)
exam %>% filter(english > 80)
exam %>% filter ( english > 100) # 해당하는 관측치가 없는 조건문으로 출력하려고 하면 변수 명만 나오고 0행이라고 나옴

# &는 AND, |는 or
exam %>% filter(class==1 & math >= 50)       # 프로그래밍에서는 '같다'의 의미는 == 라는 거 꼭 주의해라! 나도 실수 몇 번 함.
exam %>% filter(class ==2 & english >= 80)   # 그냥 = 은 '할당'하는 거다.

exam %>% filter(math>=90 | english >= 90)
exam %>% filter(science < 50 | english < 90)

exam %>% filter(class==1|class==2|class==3)  # |(or) 여러 개 써도 된다.
exam %>% filter(class %in% c(1,3,5))         # 매치연산자 %in% 사용함. class가 1,3,5에 해당하는 행(관측치)들을 추출

class1 <- exam %>% filter(class==1)  # class1 <- filter(exam,class==1)과 같은 거다.
class2 <- exam %>% filter(class==2)

mean(class1$math)
mean(class1[["math"]])

mean(class2$math)
mean(class2[["math"]])

5 ^ 2    #   ^이나 **은 제곱
5 ** 2
5 / 2    #   /는 나누기
5 %/% 2  #   %/%는 나눗셈의 몫
5 %% 2   #   %%는 나눗셈의 나머지
