exam <- read.csv("csv_exam.csv")

exam %>% select(math)     # exam 데이터프레임 안에 math 변수 추출
exam %>% select(english)  # exam 데이터프레임 안에 english 변수 추출
exam %>% select(class,math,english) # exam 데이터프레임 안에 여러 변수들을 추출
exam %>% select(-math)              # 특정 변수 제외하고 추출. 
exam %>% select(-math,-english)     # exam 데이터프레임에서 math와 english 변수 제외하고 추출출

# 파이프 연산자 연습
exam %>% select(-math) %>% str()    # exam에서 math 변수 제외한 거의 structure 보여줘

exam %>% filter(class==1) %>% select(english)  # exam에서 class는 1인 학생(관측치)의 영어 점수(english)만 추출

exam %>%
  filter(class==1) %>%
  select(math)             # 15행에서 17행 까지가 13행에 있는 한 줄짜리 파이프 연산자 쓴 코드랑 같은 거. 
                           # 줄을 나눠줌으로써 가독성을 높여준거.

exam %>% filter(class==1|class==2) %>% select(-english)
# exam에서 class가 1이거나 class가 2인 학생의 영어 점수 빼고 추출

exam %>% select(id,math) %>% head()  # exam에서 id와 math 점수를 앞의 6개만 출력
exam %>% select(-math) %>% head(10) # exam 데이터프레임에서 math 변수 제외한 거에서 앞에서 10개 보여줌


