library(dplyr)

exam <- read.csv("csv_exam.csv")

# mutate() 함수: 기존 데이터에 파생변수를 만들어 추가함
# 파이프 연산자 %>% 를 사용하면서 파생변수를 만들 때 사용함
# mutate 함수를 이용해 만든 파생 변수는 별도로 저장은 안 되고, 단순히 보여주는 역할을 수행함
# mutate 함수를 이용해 만든 파생 변수를 저장하는 방법은 밑에 코드 중에 있음!!! (hint. 다시 할당!)

# exam 데이터에서 math, english, science를 합해 total이라는 변수를 새롭게 만들어 저장
exam %>% mutate(total = math + english + science) %>% head(5)

# 여러 개의 파생 변수를 한 번에 추가
exam %>% mutate(total = math + english + science, mean = (math + english + science)/3) %>% head(5)

# test라는 변수를 만들어 science가 60점 이상이라면 'pass', 아니면 'fail'을 기록
exam %>%
  mutate(test = ifelse(science >= 60,"pass","fail")) %>%  
  head(4)       # ifelse(science >= 60, 'pass','fail) 은 science가 60이상이 True면 pass을 출력, False면 fail을 출력

# total 점수가 낮은 사람 6명 출력
exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(total) %>% 
  head(6)

# total 점수가 높은 사람 6명 출력
exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(desc(total)) %>% 
  head(6)

# 실습

# mpg 데이터 복사본을 만들고, cty와 hwy를 더한 "총 연비 변수"를 추가하세요.
mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg
mpg_new <- mpg_new %>% 
  mutate(total = cty + hwy)    # 중요 mutate()함수를 적용한 것을 mpg_new에 다시 할당해서 total을 mpg_new에 저장함!!!
mpg_new %>% head()

# "총 연비 변수"를 2로 나눈 "평균 연비 변수"를 추가하세요.
mpg_new <- mpg_new %>% mutate(mean = total/2)

# "평균 연비 변수"가 가장 높은 자동차 3종의 데이터를 출력하세요.
mpg_new %>% 
  arrange(desc(mean)) %>% 
  head(3)

# 위의 문제를 하나의 연결된 구문으로 만들어 실행하세요.
mpg %>% 
  mutate(total = cty + hwy, mean = (hwy+cty)/2) %>% 
  arrange(desc(mean)) %>% 
  head(3)
