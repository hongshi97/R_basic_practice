library(ggplot2)
library(dyplyr)

# 파이프 연산자 %>% 쓰는 거 연습하기. 강의에서도 쭉 이걸로 쓸 예정정
displ4 <- mpg %>% filter(mpg$displ <= 4)  # mpg %>% filter(mpg$displ <= 4) 는 filter(mpg,mpg$displ <=4)랑 같은 거다.
displ5 <- mpg %>% filter(mpg$displ >= 5)

displ4
displ5

mean(displ4)  # displ4와 displ5과 수치형이 아니므로 mean()함수 사용 불가.
mean(displ5)

mean(displ4$hwy)
mean(displ5$hwy)

ifelse(mean(displ4$hwy)>mean(displ5$hwy), "4기통 이하가 연비가 더 좋습니다.", "5기통 이상이 연비가 더 좋습니다.")
# 위에 이 코드는 만약 displ4$hwy의 평균과 displ5$hwy의 평균이 같은 경우도 "5기통 이상의 연비가 더 좋습니다."라고 출력이 된다.
ifelse(mean(displ4$hwy) > mean(displ5$hwy), "4기통 이하가 연비가 더 좋습니다.", ifelse(mean(displ4$hwy) < mean(displ5$hwy), "5기통 이상이 연비가 더 좋습니다.","두 개의 연비가 같습니다."))
# 위에 이 정도 코딩은 할 수 있어야 한다. 위에 13번째 줄 코드와 14번째 줄 코드의 차이 생각해보자
# ifelse 문장은 능숙하게 쓸 수 있어야 한다.

toyota <- mpg %>% filter(mpg$manufacturer == 'totyota')
audi <- mpg %>% filter(mpg$manufacturer == 'audi')

cars <- mpg %>% filter(mpg$manufacturer %in% c("chevolet","ford","honda"))  # 매치 연산자 %in% 사용함.

mean(cars$hwy)  # cars$hwy %>% mean() 형태로 파이프 연산자 사용할 수도 있음.

