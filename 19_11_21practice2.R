library(dplyr)
library(ggplot2)

# 막대 그래프를 그릴 때 geom_col()과 geom_bar() 사용 가능
# geom_col() : 평균 막대 그래프 막대의 높이가 "데이터의 값"을 나타내도록 하려면 geom_col()을 사용한다. 
#              데이터를 있는 그대로 남겨둔다. 
#              아래 예시들을 보면 geom_col()은 x축과 y축을 둘 다 설정해야 함.
# geom_bar() : 빈도 막대 그래프 x의 위치에 나타나는 각 그룹의 "빈도 수"를 나타낸다. ( 또는 가중치의 합계)  
#              geom_bar()는 y축을 별도로 설정하지 않아도 됨.


# mpg 데이터를 이용해서 drv별 평균 hwy를 막대그래프로 표현하기.
#   막대그래프의 x축은 기본적으로 알파벳 순으로 정렬
#   reorder()를 이용하여 크기순으로 정렬 가능
mpg <- as.data.frame(ggplot2::mpg)
df_mpg <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy))   # mpg를 drv별로 그룹을 나눈 후, 각 drv 그룹별로 hwy의 평균을 구해서 mean_hwy에 저장한 거를 df_mpg에 할당
df_mpg

ggplot(data= df_mpg,aes(x=drv, y= mean_hwy)) + geom_col()
ggplot(data = df_mpg, aes( x= reorder(drv,-mean_hwy), y=mean_hwy)) + geom_col() #reorder()를 이용하여 크기순으로 정렬 가능
# reorder()함수를 이용해서 drv를 mean_hwy값이 내림차순(-를 붙여서 내림차순으로 사용)으로 x축을 정렬함
# reorder()는 디폴트로 오름차순이다.

ggplot(data = df_mpg, aes(x= reorder(drv,mean_hwy), y=mean_hwy)) + geom_col()
# mean_hwy앞에 있던 -를 빼고 그냥 실행하면 drv를 mean_hwy값이 오림차순인 순서로 x축을 정렬

# 빈도 막대 그래프
#   mpg 데이터를 이용해서 drv의 빈도 막대그래프 표현
#   y축은 빈도를 나타내기 때문에 자동으로 지정되므로 x축만 지정해도 됨
#   hwy의 빈도도 표현하기

ggplot(data = mpg, aes(x = drv)) + geom_bar()   
ggplot(data = mpg, aes(x = hwy)) + geom_bar()

# 실습
# mpg 데이터를 이용해서 분석하세요.
#   예제 1)
#   어떤 회사에서 생산하는 "suv" 차종의 도시 연비가 높은지 알아보려고 합니다. "suv" 차종을 대상으로 평균 cty가
#   가장 높은 회사 다섯 곳을 막대그래프로 표현하세요. 막대는 연비가 높은 순으로 정렬하세요.
mpg <- as.data.frame(ggplot2::mpg)

df_mpg <- mpg %>% 
  filter(class == "suv") %>%            # class는 suv인 것들만 뽑아서
  group_by(manufacturer) %>%            # 제조 회사별로 그룹을 나눈 후
  summarise(mean_cty = mean(cty)) %>%   # 각 제조사별로 cty의 평균을 구한 후
  arrange(desc(mean_cty)) %>%           # mean_cty를 내림차순으로 정렬하고 (숫자가 클수록 연비가 좋은 거니까 내림차순으로 함)
  head(5)                               # 내림차순으로 정렬한 것 중 앞에서 5개 뽑음

# summarise() : 통계치 산출, 결과가 데이터 프레임이 나옴
# summrise() 함수는 혼자 사용되지는 않고, group_by()한 것을 요약 정리해주는 역할 (mean, median, sd 등과 자주 사용)

df_mpg

### 혼자 해 본 거. group_by()랑 filter() 순서 바꿔본 거 ####
df_mpg2 <- mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "suv") %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)

df_mpg2
############################################################

ggplot(data = df_mpg, aes(x=reorder(manufacturer, -mean_cty), y = mean_cty)) + geom_col()


#   예제2)
#   자동차 중에서 어떤 class가 가장 많은지 알아보려고 합니다. 자동차 종류별 빈도를 표현한 막대 그래프를 만들어 보세요.
ggplot(data = mpg, aes(x=class)) + geom_bar()  # geom_bar() 자체가 빈도를 나타내는 거라서 x축에 class를 설정하면 
                                               # class에 존재하는 모든 값이 몇개 존재하는지 빈도 수를 표현함 


# 위 문제를 geom_bar()아니라 geom_col()로 표현하려면 class별로 그룹을 나누고, 개수 세주는 n()함수를 이용해서 표현 가능 
# 다시해보기. 헷갈린다.
df_mpg3 <- mpg %>% 
  group_by(class) %>% 
  summarise(n = n())

ggplot(data = df_mpg3, aes(x=class,y=n)) + geom_col()
ggplot(data = df_mpg3, aes(x=reorder(class, n),y=n)) + geom_col() # 혼자 해본 거
       