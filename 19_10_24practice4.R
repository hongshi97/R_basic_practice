exam <- read.csv("csv_exam.csv")
exam

# exam에서 math 변수만 추출
exam %>% select(math)

# exam에서 english 변수만 추출
exam %>% select(english)

# exam에서 여러 변수 추출
exam %>% select(math,english,science)

# 특정 변수 제외하고 추출
# exam에서 math만 제외하고 추출
exam %>% select(-math) 
# exam에서 math랑 english 제외하고 추출
exam %>% select(-math,-english)

# filter()와 select()를 조합해서 class가 1인 학생의 영어 점수만 추출
exam %>% filter(class==1) %>% select(math)

exam %>% 
  filter(class==1) %>% 
  select(math)        # 이 세줄짜리 코드는 exam %>% filter(class==1) %>% select(math) 와 동일한건데 가독성 좋게 줄을 나눈 거.

# exam에서 id랑 math 변수 앞에서 6개 추출
exam %>% select(id,math) %>% head()
