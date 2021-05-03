df <- data.frame(sex = c("M","F",NA,"M","F"), score = c(5,4,3,4,NA))

df  # 결과에서 <NA>는 문자열이라서 이렇게 나온거고, 그냥 NA는 숫자라서 이렇게 나온 거. 별로 안 중요한 듯

is.na(df)

table(is.na(df))          
table(is.na(df$sex))
table(is.na(df$score))

mean(df$score)  # df$score에 결측치 (NA)가 존재해서 mean()함수와 sum()함수가 적용되지 않음.
sum(df$score)

library(dplyr)

df

df %>% filter(is.na(score))    # score가 NA인 것들을 뽑음
df %>% filter(!is.na(score))   # !(not)을 이용해서 score가 NA가 아닌 것들을 뽑음

df_nomission <- df %>% filter(!is.na(score))
df_nomission
mean(df_nomission$score)  # score에 결측치 (NA)가 없어서 mean()함수 적용 가능
sum(df_nomission$score)   # score에 결측치 (NA)가 없어서 sum()함수 적용 가능


# 예제. df에서 score와 sex에 모두 결측치가 없는 데이터만 추출하세요. 
# 위 문장은 'df에서 score에 결측치가 없고, sex에 결측치가 없는 데이터만 추출하세요.'라고 해석 가능

# 방법 1)
df_nomiss1 <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss1

# 방법 2) na.omit() 결측치가 들어있는 행 전체를 데이터 셋에서 제거함 
df_nomiss2 <- na.omit(df)   
df_nomiss2


mean(df$score, na.rm = TRUE)  # mean()과 같은 수치 연산 함수들은 na.rm = TRUE 혹은 na.rm=T 를 통해 결측치를 제외하고 연산 가능
sum(df$score, na.rm = TRUE)   # na.rm을 제공하지 않는 함수는 filter() 사용.

exam <- read.csv("csv_exam.csv")
exam
exam[c(3,8,15),"math"] <- NA       # exam의 3행,8행,15행의 "math"열에 NA(결측치)를 할당   인덱싱 참고사항: [ 행 , 열 ] 
exam

exam %>% summarise(mean_math = mean(math))
exam %>% summarise(mean_math = mean(math, na.rm=T))
exam %>% summarise(mean_math = mean(math,na.rm=T),
                   sum_math = sum(math,na.rm=T),
                   median_math = median(math,na.rm=T))                   