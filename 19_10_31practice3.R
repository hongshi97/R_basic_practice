library(dplyr)

exam <- read.csv("csv_exam.csv")

# group_by()함수: 그룹을 만들어 줌. 
# summarise() 함수: 집단별로 요약 통계량을 알려 줌. 
# 일반적으로 혼자 사용되지는 않고 group_by한 것을 요약 통계함. mean(),median(),sd() 등과 함께 주로 사용

exam %>% 
  summarise(mean_math = mean(math))
# mean(math) # 그냥 math로 하려면 사용 안 됨. exam$math로 해야 가능
mean(exam$math)

exam %>% 
  group_by(class) %>%                  # exam 데이터가 class별로 묶임. (class가 동일한 것끼리 순서대로 정렬됨)
  summarise(mean_math = mean(math))    # summarise()를 이용해서 각 class의 수학의 평균을 구한 다음 class1의 수학 평균, class2의 수학 평균을 mean_math에 저장

# group_by()에서 만들어준 그룹 (변수)와 함께 summarise에서 만든 변수가 함께 출력됨!!!
# 위 코드에서는 class와 mean_math가 함께 출력.

exam %>% 
  group_by(class) %>%                      
  summarise(mean_math = mean(math),
            sum_math = sum(math),         
            median_math = median(math),  # 한 번에 여러개도 가능. 각 class별 mean, sum, median, observation 개수 출력
            n = n())                     # n() 함수. 그룹에 속해 있는 observation(관측치)의 개수를 세줌. (1반에 몇개, 2반에 몇개,,,)

mpg <- as.data.frame(ggplot2::mpg)

mpg %>% 
  group_by(manufacturer,drv) %>%        # manufacturer로 그룹을 나눈(정렬) 후 그 그룹 안에서 drv에 따라 또 그룹을 나눔(정렬)
  summarise(mean_cty = mean(cty)) %>%   # (제조사별로 구동 방식에 따라 그룹을 묶은 후 각 그룹의 cty의 평균(mean_cty)을 출력
  head()

# manufacturer, drv, mean_cty가 함께 출력됨.

# 실습

mpg %>% 
  group_by(manufacturer)   # group_by()하면 어떻게 되는지 궁금해서 혼자 해본 거

# mpg에서 회사별로 'suv' 자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순으로 정렬하고, (회사별 suv 자동차 순위)1~5위까지 출력하세요.
# 문장의 순서에 따라서 하나씩 파이프 연산자로 코딩하면 된다!!!
mpg %>% 
  group_by(manufacturer) %>%             # mpg를 manufacturer 별로 그룹을 나눔
  filter(class =='suv') %>%              # 각 manufacturer 중 class가 suv인 행(관측치)만 선별
  mutate(total = (cty + hwy)/2) %>%      # mutate()를 이용해서 각 관측치의 도시 연비와 고속 도로 연비의 평균을 구함
  summarise(mean_total = mean(total)) %>%  # summarise 쓰는 거 까먹지 말자!summarise를 써야 manufacturer별로 그룹된 거의 평균 구할 수 있음
  arrange(desc(mean_total)) %>% 
  head(5)
  
# class는 'suv','compact'등 자동차의 특징에 따라 7종류로 분류한 변수입니다. 어떤 차종의 도시 연비가 높은지 비교하기 위해
# class별 cty 평균을 구해보시오.
mpg %>% 
  group_by(class) %>%                   # class 별로 그룹을 나눔
  summarise(mean_cty = mean(cty))       # group_by를 썼으면 summarise도 같이 쓰인다~!!!

# 앞의 결과물에서 class값은 알파벳 순으로 정렬되어 있습니다. 어떤 차종의 도시 연비가 높은지 쉽게 알아볼 수 있도록
# cty 평균이 높은 순으로 정렬해서 출력하세요.
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty)) %>%     # class별로 도시 연비 평균을 구함
  arrange(desc(mean_cty))               # 위와 동일한 건데 mean_cty를 내림차순 기준으로 정렬!

# 어떤 회사 자동차의 hwy가 가장 높은지 알아보려고 합니다. hwy 평균이 가장 높은 회사 3곳을 출력하세요.
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)
  
# 어떤 회사에서 'compact' 차종을 가장 많이 생산하는지 알아보려고 합니다. 
# 각 회사별 'compact' 차종의 수를 내림차순으로 정렬하여 출력하세요

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=='compact') %>%   # class가 compact인 행(관측치)들만 선별
  summarise(num = n()) %>% 
  arrange(desc(num))             # 회사별로 나눈 후, class가 compact인 것들을 뽑은 다음, 개수를 세서 내림차순으로 정렬 
