DF <- read.csv("example_salary.csv",stringsAsFactors = F, na = "-")
head(DF,5)
colnames(DF)
colnames(DF) <- c("age","salary","specialSalary","workingTime","numberOfWorker","career","sex")
temp <- tapply(DF$salary,DF$sex,mean,na.rm=T)  # tapply("함수"에 들어갈 값, 기준, "함수", "함수" 옵션) # mean()으로 하면 오류
temp

library("reshape2")   #library(reshape)도 가능. install.packages()를 사용할 때는 "" 꼭 사용해야 함
library("ggplot2")
melt <- melt(temp)
melt                  # temp 출력값이랑 melt 출력값 비교해보기   (은근 간단해서 시험 나올 거 같기도 함.)   
# temp에서는 변수명이던 '남'과 '여'가 melt에서는 Var1라는 변수의 관측치로 들어감. 평균값은 value라는 변수의 관측치로 들어감.

ggplot(melt,aes(x=Var1, y=value,fill=Var1)) + geom_bar(stat="identity")

tapply(DF$salary,DF$sex,sd,na.rm=T)      # tapply()함수 복습하기!!! sex별 salary mean 구하기.

# tapply 함수 :주어진 함수를 그룹별로 각 자료 값에 적용하는 함수이다.
# tapply( 벡터 , **index, 적용함수, 추가인자) => 배열로 반환
# ** index: 데이터를 그룹으로 묶을 색인,팩터 지정
# 예시: 데이터 내에서 A 변수별 B 구하기
#     => tapply(B,A,적용함수)

tapply(DF$salary,DF$sex,range,na.rm=T)    # DF에서 sex별 salary의 range 구하기(range()함수 사용할 때 na.rm = T) 
temp <- tapply(DF$salary,DF$career,mean,na.rm=T)  # DF에서 career별 salary의 mean 구하기(mean()함수 사용할 때 na.rm = T)
melt <- melt(temp)
temp
melt

ggplot(melt,aes(x=Var1,y=value,group=1)) + geom_line(colour="skyblue2",size=2) + coord_polar() + ylim(0,max(melt$value))

tapply(DF$salary,DF$career,sd,na.rm=T)       # career별로 salary의 표준편차 구함함
tapply(DF$salary,DF$career,range,na.rm=T)

a1 <- DF[which(DF$salary == 1172399),]   # DF$salary == 1172399인 관측치(행)을 모든 열에 대해서 출력력
a1
a2 <- DF[which(DF$salary == 1685204),]
a3 <- DF[which(DF$salary == 1117605),]
a4 <- DF[which(DF$salary == 1245540),]
a5 <- DF[which(DF$salary == 1548036),]
list <- list(a1,a2,a3,a4,a5)
list

### 추가로 해본 거 ###
list[1]
list[[1]]
class(list[1])
class(list[[1]])
