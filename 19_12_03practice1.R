install.packages("foreign")   # sav 파일을 읽어오기 위해 foreign 패키지 다운로드
install.packages("readxl")
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

raw_welfare <- read.spss(file="Koweps_hpc10_2015_beta1.sav", to.data.frame = T)  # read.spss() 을 이용하여 .sav 파일 읽어옴
                                                                  # to.data.frame = T 를 이용해서 데이터 프레임으로 읽어옴
welfare <- raw_welfare

head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)

welfare <- rename(welfare,
                  sex = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)

class(welfare$sex)
table(welfare$sex)
table(is.na(welfare$sex))  # is.na(welfare$sex)를 사용하면 결측치면 TRUE, 아니면 FASLE.
welfare$sex <- ifelse(welfare$sex == 1 , 'male','female') # welfare$sex가 1이면 male, 아니면 female
table(welfare$sex)
qplot(welfare$sex)   # qplot()을 이용해서 빈도를 나타내는 간단한 막대 그래프 그리기

ggplot(welfare, aes(x=sex)) + geom_bar()  # qplot(welfare$sex)와 동일한 그래프 그려줌. 대신 ggplot은 x축 y축에 이름 붙음

class(welfare$income)
summary(welfare$income)   # summary()이용해서 최소값, 하한사분위수, 중앙값, 평균, 상한 사분위수, 최대값, NA개수 출력
qplot(welfare$income)
qplot(welfare$income) + xlim(0,1000)

table(is.na(welfare$income))
welfare$income <- ifelse(welfare$income %in% c(0,9999),NA,welfare$income)
table(is.na(welfare$income))

sex_income <- welfare %>% 
  filter( !is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(mean_income = mean(income))
sex_income

ggplot(data = sex_income, aes(x=sex,y=mean_income)) + geom_col()


# 데이터 분석 프로젝트 파일 2번째. 슬라이드 4
class(welfare$birth)
summary(selfare$birth)
qplot(welfare$birth)
table(is.na(welfare$birth))
welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)
table(is.na(welfare$birth))
welfare$age <- 2019 - welfare$birth + 1  # welfare에 age라는 변수 만들어 줌. 손코딩으로 나올만한 듯듯
summary(welfare$age)
qplot(welfare$age)

age_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age) %>% 
  summarise(mean_income = mean(income))
head(age_income)

ggplot(data = age_income, aes(x=age,y=mean_income)) + geom_line()

welfare <- welfare %>% 
  mutate(ageg = ifelse(age < 30, "young", ifelse(age <= 59, "middle","old")))  # mutate사용해서 파생변수 만든 거.
# 위 코드에서는 welfare가 파이프를 타고 mutate함수 안으로 들어가있기 때문에 welfare$age라고 안해도 됨.

# welfare$ageg <- ifelse(welfare$age >=60, "old",ifelse(welfare$age>=30,"middle","young"))

table(welfare$ageg)
qplot(welfare$ageg)

ageg_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg) %>% 
  summarise(mean_income = mean(income))
ageg_income

ggplot(data = ageg_income, aes(x=ageg,y=mean_income)) + geom_col()

ggplot(data = ageg_income, aes(x=ageg,y=mean_income)) + geom_col() + scale_x_discrete(limits = c("young","middle","old"))
# x축의 순서를 young, middle, old로 정해줌