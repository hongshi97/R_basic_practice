library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

raw_welfare <- read.spss(file="Koweps_hpc10_2015_beta1.sav", to.data.frame = T)
# raw_welfare <- read.spss("Koweps_hpc10_2015_beta1.sav", to.data.frame=T) 라고 해도 됨.

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
list_job <- read_excel("Koweps_Codebook.xlsx",col_names = T,sheet=2)
welfare <- left_join(welfare,list_job, id="code_job")
welfare$age <- 2019 - welfare$birth + 1
welfare <- welfare %>% 
  mutate(ageg = ifelse(age < 30, "young", ifelse(age <= 49, "middle","old")))

# 데이터 분석 프로젝트 파일 3. 슬라이드 3.
# 나이 및 성별 월급 차이 
sex_age <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age,sex) %>% 
  summarise(mean_income = mean(income))
head(sex_age)

ggplot(data = sex_age, aes(x=age, y=mean_income, col=sex)) + geom_line()  # colour = sex, color = sex 라고 해도 됨.

# 성별 직업 빈도
# 성별에 따른 직업을 갖는 경향을 조사
# 성별에 따라 어떤 직업이 많은지 조사
# 성별과 직업 변수는 이미 전처리 하였기 때문에 변수 간 관계를 분석
job_male <- welfare %>% 
  filter(!is.na(job) & sex == "male") %>% 
  group_by(job) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n)) %>% 
  head(10)

job_male

job_female <- welfare %>% 
  filter(!is.na(job) & sex == "female") %>% 
  group_by(job) %>% 
  summarise(n=n()) %>%   # n()함수 잘 알아두자!!!
  arrange(desc(n)) %>%    
  head(10)

job_female

ggplot(data = job_male, aes(x=reorder(job,n), y= n)) + geom_col() + coord_flip()
ggplot(data = job_female, aes(x=reorder(job,n), y= n)) + geom_col() + coord_flip()

# 종교 유무에 따른 이혼율
# 종교를 가진 사람들이 종교가 없는 사람들보다 이혼을 덜 하는지 분석
# 종교(religion)와 혼인 상태 변수(marriage)를 검토 후 전처리한 후 변수 간 관계 분석석

class(welfare$religion)
welfare$religion <- ifelse(welfare$religion == 1, "yes", "no")  # 1이면 yes라고, 아니면 no라고 저장.
table(welfare$religion)

qplot(welfare$religion)

class(welfare$marriage)

table(welfare$marriage)
welfare$group_marriage <- ifelse(welfare$marriage == 1, "marriage", ifelse(welfare$marriage == 3, "divorce", NA))
# 1번과 3번에만 관심이 있어서 이렇게 함. 1과 3이 아닌 것들은 모두 NA로 처리함.

table(welfare$group_marriage)

# 연령대 및 종교 유무에 따른 이혼율 분석
# 종교 유무에 따른 이혼율이 연령대별로 확인

# 1. 연령대 (young,middle,old)별 이혼율 (divorce,marriage) 표 만들기
ageg_marriage <- welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(ageg, group_marriage) %>% 
  summarise(n = n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n/tot_group*100,1))  # round(x,1)은 x를 소수점 둘째자리에서 반올림해서 소수점 첫째자리까지 표시

ageg_marriage

# 2. 연령대별 이혼율 그래프 만들기
ageg_divorce <- ageg_marriage %>% 
  filter(ageg != "young" & group_marriage =="divorce") %>%   # 왜인지는 모르겠는데 연령대 young은 제외함. 
  # 이혼율을 표시해야 하니까 group_marriage == "divorce"인 행들만 추출.
  select(ageg,pct)

ageg_divorce

table(ageg_divorce)

ggplot(data=ageg_divorce, aes(x=ageg,y=pct)) + geom_col()

# 3. 연령대, 종교 유무에 따른 이혼율 표 만들기
ageg_religion_marriage <- welfare %>% 
  filter(!is.na(group_marriage) & ageg != "young") %>% 
  group_by(ageg, religion, group_marriage) %>% 
  summarise(n= n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n/tot_group*100,1))
ageg_religion_marriage

# 4. 연령대 및 종교 유무에 따른 이혼율 그래프 만들기
df_divorce <- ageg_religion_marriage %>% 
  filter(group_marriage == "divorce") %>% 
  select(ageg, religion, pct)

df_divorce

ggplot(data = df_divorce, aes(x=ageg, y=pct, fill=religion)) + 
  geom_col(position = "dodge")

# 지역별 연령대 비율
# 고령 사회가 되면서 노인들을 위한 시설을 마련하는 일이 중요해지게 되었다.
# 시설 마련을 위해 어느 지역에 노인 인구가 많은지를 파악
# code_region과 ageg 변수 사용

class(welfare$code_region)
table(welfare$code_region)

list_region <- data.frame( code_region = 1:7, region = c("서울","수도권","부산/경남/울산","대구/경북","대전/충남","강원/충북","광주/전남/전북/제주"))
# code_region이라는게 welfare에 변수로 있으니까 새로운 표를 만들 때에도 left_join을 하기 위해서 겹치는 변수명이 있어야 함.

list_region

welfare <- left_join(welfare, list_region, id = "code_region")

welfare %>% select(code_region, region) %>% 
  head()


# 지역별 연령대 비율 분석
region_ageg <- welfare %>% 
  group_by(region,ageg) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n/tot_group*100,2))   
# round에 있는 ,1 이나 ,2는 소숫점 몇 째 자리까지 표시할건지 정하는 거.
# round(x,1) 이면 소수점 둘 째 자리에서 반올림해서 첫째 자리까지 표시
# round(y,2) 이면 소수점 셋 째 자리에서 반올림해서 둘째 자리까지 표시

head(region_ageg)

ggplot(data = region_ageg, aes(x=region, y=pct, fill= ageg)) + geom_col() + coord_flip()
       