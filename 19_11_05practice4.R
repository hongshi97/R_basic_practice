library(dplyr)

# 이상치 제거하기: 존재할 수 없는 값
outlier <- data.frame(sex = c(1,2,1,3,2,1), score = c(5,4,3,4,2,6))
outlier

table(outlier$sex)
table(outlier$score)

outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)     # sex의 값에서 3을 이상치라고 가정함
outlier

outlier$score <- ifelse(outlier$score>5, NA, outlier$score)  # score의 값에서 5보다 큰 값을 이상치라고 가정함
outlier

outlier %>% 
  filter(!is.na(sex) & !is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score = mean(score))


# 이상치 제거하기 : 극단적인 값
mpg <- as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats   # boxplot()$stats 는 분포 통계치(하한, 하한 사분위수, 중앙값, 상한 사분위수, 상한)를 출력

mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))

mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy,na.rm=T))

# 실습
mpg <- as.data.frame(ggplot2::mpg)          
mpg[c(10,14,58,93),'drv'] <- "k"                  # drv에 k라는 이상치를 넣은 거
mpg[c(29,43,129,203),'cty'] <- c(3,4,39,42)       # cty에 3,4,39,42라는 값을 넣음

# drv에 이상치가 있는지 확인하세요. 이상치를 결측 처리하고 이상치가 사라졌는지 확인하세요. ( %in% 사용)
table(mpg$drv)           
mpg$drv <- ifelse(mpg$drv %in% c('4','f','r'), mpg$drv, NA) # mpg$drv 값이 4,f,r 중 하나가 참이면 그대로 사용, 아니면 NA 할당


table(mpg$drv)

# 상자 그림을 이용해 cty에 이상치가 있는지 확인하세요, 정상 범위를 벗어나는 값을 결측 처리한 후 다시 상자그림을 그리세요.
boxplot(mpg$cty)
boxplot(mpg$cty)$stats                                    # boxplot(mpg$cty)$stats을 통해 하한과 상한을 확인
mpg$cty <- ifelse(mpg$cty<9 | mpg$cty > 26,NA,mpg$cty)    # $stats를 통해 확인한 상한보다 큰 값, 하한보다 작은 값을 결측 처리
boxplot(mpg$cty)

# 두 변수의 이상치를 결측 처리한 후 drv 별로 cty 평균을 구하세요.
mpg %>% 
  filter(!is.na(drv)&!is.na(cty)) %>% 
  group_by(drv) %>% 
  summarise(mean_cty = mean(cty))
