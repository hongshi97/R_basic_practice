install.packages("data.table")
library(data.table)

DF = fread("example_studentlist.csv", data.table = F)  # 변수 DF는 Data Frame 자료형
search()    # attach(DF)를 실행한 후 다시 search()를 실행하면 DF가 나온다.
#detach(DF) # attach했던 DF를 detach하는 거
attach(DF)  # attach(DF)를 하면, DF라는 데이터 프레임 안의 변수를 부를 때 일일이 "DF$변수명" 형태가 아니라 그냥 변수명만 해도 호출 가능
search()    
mean(height,na.rm=T)      #mean()함수: 평균 구하기# na.rm = T 는 na값을 제거할 거다. 라는 옵션
median(height,na.rm=T)    #median()함수: 중앙값 구하기
range(height, na.rm = T)  #range()함수: 최소값, 최대값 출력
quantile(height,na.rm=T)  #quantile()함수: 사분위수 구하기
IQR(height,na.rm = T)     #IQR()함수: 사분범위(=상한 사분위수 - 하한 사분위수) 구하기

summary(height, na.rm=T)  #summary()함수: 최솟값, 하한 사분위수, 중앙값, 평균값, 상한 사분위수, 최댓값 출력
boxplot(height)           #boxplot()함수: height를 boxplot(상자 수염 다이어그램) 형태로 보여줘.
boxplot(height,weight)    # height와 weight 두 개의 boxplot을 출력

cor(height,weight)        # height와 weight라는 변수의 상관계수를 구함. 
                          # 결과값이 양인 경우: 한 변수가 증가하면 다른 변수도 증가한다.
                          # 결과값이 음인 경우: 한 변수가 증가하면 다른 변수는 감소한다.
cor(DF[,c(3,7,8)])        # DF의 3열,7열,8열 간에 상괸계수 구하기.

head(DF)

detach(DF)
search()                  # detach(DF)하고 나서 search()하면 DF가 안 나옴

DF2 = DF                  # DF2에 DF를 저장 (이유: 원본은 놔두고 복제본을 조작하면서 사용하기 위해서)
DF2[2,7] = NA             # DF2의 2행 7열 원소에 NA 할당
DF2[4,8] = NA             # DF2의 4행 8열 원소에 NA 할당
DF2         
attach(DF2)               
search()
cor(height,weight)        #주의. DF2 안에 height와 weight의 값들 중에 NA가 존재하기 때문에 이 결과는 NA

cor(age,height)           # height에 NA가 있어서 NA 출력. 

cor(height,weight, use="complete.obs")   # use="complete.obs"는 na.rm = T랑 같은 역할 (NA값을 빼고 계산함)
                                         # 결측값이 있는 case는 모두 제거된 상태에서 상관계수 계산

detach(DF2)
search()
attach(DF)

var(height,na.rm = T)              # var()함수: 분산 구하기
var(DF[,c(3,7,8)],na.rm = T)       # DF의 3열(age), 7열(height),8열(weight)의 분산 구함. NA는 제외하고.
sd(height,na.rm = T)               # sd()함수: 표준 편차 구하기
(height-mean(height)/sd(height))   # 이거 손코딩 문제 나올 거 같음.이 식은 height라는 변수의 표준 점수(z-score) 구하는 식임. 
sd(height)/mean(height) 
sd(weight)/mean(weight)

detach(DF)
search()
