library(dplyr)
exam <- read.csv("csv_exam.csv")

exam[c(3,8,15),"math"] <- NA
mean(exam$math,na.rm=T)
exam$math <- ifelse(is.na(exam$math),55,exam$math)
table(is.na(exam$math))
table(!is.na(exam$math))
exam
mean(exam$math)

# 실습

# 원본 mpg 데이터를 복사해서 몇 개의 값에 결측치를 할당하세요.
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212),"hwy"] <- NA
mpg

# drv와 hwy에 결측치가 몇 개 있는지 알아보세요.
table(is.na(mpg$drv))
table(is.na(mpg$hwy))       # 5개의 데이터가 결측치다.

# filter()를 이용해 hwy 변수의 결측치를 제외하고, 어떤 구동 방식의 hwy 평균이 높은지 알아보세요.
# 이렇게 문장으로 나온 문제를 해결하려면, 문장을 통째로 한 번에 풀려고 하지 말고 부분부분으로 나눠서 어떤 함수를 쓰는 게
# 좋을지 생각하면서 풀자. 
mpg %>%                        # filter()함수의 괄호 안에는 TRUE나 FALSE 값이 들어간다. ex) class == 'suv' 혹은 !is.na(hwy) 등
  filter(!is.na(hwy)) %>%    # filter()를 이용해 hwy 변수의 결측치를 제외
  group_by(drv) %>%          # 어떤 구동 방식의
  summarise(mean_hwy = mean(hwy)) %>%    # hwy평균이
  arrange(desc(mean_hwy))                # 높은지
