library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

raw_welfare <- read.spss(file="Koweps_hpc10_2015_beta1.sav", to.data.frame = T)

welfare <- raw_welfare

welfare <- rename(welfare,
                  sex = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)

welfare$sex <- ifelse(welfare$sex == 1 , 'male','female')
welfare$age <- 2019 - welfare$birth + 1
welfare <- welfare %>% 
  mutate(ageg = ifelse(age < 30, "young", ifelse(age <= 59, "middle","old")))

# 데이터 분석 프로젝트 파일 2. 슬라이드 7.
# 연령대 및 성별 월급의 차이

sex_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg,sex) %>%      # ageg별로 그룹을 묶고, 그 다음 그 그룹별로 sex별로 그룹을 묶음
  summarise(mean_income = mean(income))
sex_income

ggplot(data=sex_income, aes(x=ageg, y=mean_income, fill=sex)) + geom_col() + 
  scale_x_discrete(limits = c("young","middle","old"))     
# scale_x_discrete(limits = c("young","middle","old"))를 통해 x축에 young,middle,old순으로 출력
# 이거 빼고 차트 그리면 x축 순서가 달라짐

ggplot(data=sex_income, aes(x = ageg, y = mean_income, fill = sex)) + geom_col(position = "dodge") + scale_x_discrete(limits = c("young","middle","old"))
# position = "dodge" 차이 확인

# sex_age 변수 만들기 
sex_age <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age,sex) %>% 
  summarise(mean_income = mean(income))
sex_age

ggplot(data = sex_age, aes(x=age, y=mean_income, col=sex)) + geom_line()

# 직업별 월급의 차이
class(welfare$code_job)
table(welfare$code_job)

library(readxl)
list_job <- read_excel("Koweps_Codebook.xlsx",col_names = T, sheet = 2) 
# col_names=T : 엑셀 파일에서 첫번째 행은 변수명이니까 데이터 프레임으로 읽어올 때도 그거를 변수명으로 사용하겠다.
head(list_job)
dim(list_job)

welfare <- left_join(welfare, list_job, id = "code_job")  # welfare 데이터프레임과 list_job 데이터프레임을 left_join 할 건데, "code_job"을 기준으로.

welfare %>% 
  filter(!is.na(code_job)) %>%   # welfare중 code_job이 NA가 아닌 애들을 골라서
  select(code_job,job) %>%       # code_job과 job 변수만 뽑아서
  head(10)                       # 위에서 10개 보여줌

job_income <- welfare %>% 
  filter(!is.na(job)&!is.na(income)) %>%  # job이 NA가 아니고 income이 NA가 아닌 행들을 뽑아서
  group_by(job) %>%                       # job으로 그룹을 묶고
  summarise(mean_income = mean(income))   # income의 평균 값을 mean_income 변수를 만들어서 저장.

head(job_income)

top10 <- job_income %>% 
  arrange(desc(mean_income)) %>% 
  head(10)
# mean_income을 기준으로 내림차순으로 정렬한 다음 위에서 10개니까, mean_income이 큰 10개를 의미 
# 만약 tail(10)을 하면 작은 거 10개를 의미

top10


ggplot(data=top10, aes(x=reorder(job,mean_income),y=mean_income)) + geom_col() + coord_flip()

ggplot(data=top10, aes(x=reorder(job,mean_income),y=mean_income)) + geom_col() # coord_flip() 차이 알아보려고 한 거

ggplot(data=top10, aes(x=reorder(job,-mean_income),y=mean_income)) + geom_col() + coord_flip() # reoder차이 알아보려고 한 거.


bottom10 <- job_income %>% 
  arrange(mean_income) %>% 
  head(10)                 
# mean_income을 기준으로 오름차순으로 정렬한 다음 위에서 10개니까, mean_income이 작은 거 10개를 의미

ggplot(data = bottom10, aes( x = reorder(job, -mean_income), y = mean_income)) + geom_col() + coord_flip() + ylim(0,580)
