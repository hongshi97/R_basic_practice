DF <- read.csv("example_studentlist.csv")

str(DF)
DF$age
plot(DF$age)   # DF$age의 빈도가 나옴   # 변수 하나만 넣으면 y축에 해당 변수 나옴.
plot(DF$height,DF$weight) # plot(독립변수(=설명변수), 종속변수(=반응변수))   
plot(DF$weight~DF$height) # plot(종속변수 ~ 독립변수)    # ~ (틸트)를 쓸 때는 x축과 y축이 바뀐다!!!

plot(DF$height~DF$weight)  # 혼자 해 본 거.

plot(DF$height,DF$sex)

DF2 <- data.frame(DF$height,DF$weight)
DF2
plot(DF2)   # DF$height, DF$weight 순서로 데이터프레임을 저장했더니 height가 x축, weight가 y축으로 표시됨.
plot(DF2, type = "l")   # 추가로 해본 거

DF3 <- cbind(DF2,DF$age)
DF3
plot(DF3)   # plot(값,값,값)과 같이 인자 세 개는 불가능, 그러나 plot(data.frame)은 가능

plot(DF$weight~DF$height,pch=as.integer(DF$sex))    # pch를 사용해서 다양한 모형의 기호, 상징으로 표현 가능
legend("topleft",c("man","woman"),pch=DF$sex)       # legend() 함수를 이용해서 범례 표시.
plot(DF$weight~DF$height,ann=F)         # ann=F 사용해서 고수준 그래프 함수에서 제목, 범례 등 아무 라벨도 출력되지 않게 함
title(main = "Kyung Hee University Student's Height and Weight Relationship")
title(xlab = "height")
title(ylab = "weight")
grid()

# 추가로 해본 거. title 다는 거를 포함해서 한 줄로 코딩한 거
plot(DF$weight~DF$height, main = "Kyung Hee University Student's Height and Weight Relationship", xlab = "height", ylab = "weight")
# ann=F 의 효과(?) 확인해본 거
plot(DF$weight~DF$height, ann=F ,main = "Kyung Hee University Student's Height and Weight Relationship", xlab = "height", ylab = "weight")


weightMean = mean(DF$weight)
weightMean

FreqBlood = table(DF$bloodtype)
FreqBlood

barplot(FreqBlood)  # barplot()은 막대그래프 함수 그려줌. 이산형변수, 명목형변수, 순서형 변수 사용 가능.
title(main = "Blood type frequency")
title(xlab = "blood type")
title(ylab = "frequency")

Height = tapply(DF$height, DF$bloodtype, mean)   # DF$bloodtype을 기준으로 DF$height의 mean을 구해서 Height라는 변수에 할당
Height
barplot(Height,ylim=c(0,200))  # ylim을 통해 y축의 최소값을 0으로, y축의 최대값을 200으로 정함

boxplot(DF$height)
boxplot(DF$height~DF$bloodtype)  # bloodtype별로 height의 상자그래프(boxplot) 그림. 
                                 # 이것도 그냥 x축에 bloodtype, y축에 height라고 생각하면 됨.

hist(DF$height)            # hist()함수 : 히스토그램 그리기. 수치형 연속형 변수 사용.
hist(DF$height,breaks=10)  # breaks=10을 통해 계급을 10칸으로 나누기로 함. (실제 개수는 R이 알아서 그리는 거라서 정확하지 않을 수 있음.)
hist(DF$height, breaks=10, prob=T)  # prob=T를 추가해서 상대도수밀도를 표시
DiffPoint <- c(min(DF$height),165,170,180,185,190)
hist(DF$height,breaks=DiffPoint)  
# DiffPoint에 height의 최소값, 165,170,180,185,190이라는 숫자를 지정해줘서 해당 간격에 맞게 막대를 그림
# 최소값~165에 한 개, 165~170에 한 개, 170~180에 한 개, 180~185에 한 개, 185~190에는 없어서 안 그림
