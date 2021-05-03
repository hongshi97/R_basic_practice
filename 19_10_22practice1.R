DF <- read.csv("example_cancer.csv",stringsAsFactors=F, na = "기록없음")  # read.csv는 별도 패키지 필요 없음. read_excel은 readxl 패키지 필요
str(DF)    # DF의 요약 정보 나옴
attach(DF) 
mean(age) 
summary(age)  # age의 최솟값,하한 사분위수, 중앙값, 평균값, 상한 사분위수, 최댓값 출력

boxplot(age)   # 이상치는 작은 원모양(점)으로 표현
boxplot(age, range=2)  # 상한과 하한 계산할 때 사분범위의 1.5배가 아닌 2배를 더하거나 빼서 상한과 하한 계산. -> 이상치의 개수가 줄어듬
grid()   # 그림에 격자 무늬 표시해줌줌

distIQR <- IQR(age, na.rm=T)  # age의 사분범위 계산해서 distIQR에 할당
distIQR

posIQR <- quantile(age)
posIQR
posIQR <- quantile(age,probs = c(0.25,0.75),na.rm=T)  # 주의. probs = c(0.25,0.75)라는 옵션을 추가해서 age의 0.25와 0.75에 해당하는 값만 할당
posIQR

posIQR[1]
posIQR[[1]]   # 이거랑 위에거 결과값 다른 거 주의!!! 알아두자!

DownWhisker <- posIQR[[1]] - distIQR*1.5
UpWhisker <- posIQR[[2]] + distIQR*1.5
DownWhisker;UpWhisker

Outlier <- subset(DF, subset=(DF$age<DownWhisker | DF$age > UpWhisker))  
#DF에 있는 DF의 age가 DownWhisker보다 작거나(or) DF의 age가 Upwhisker보다 큰 것들을 부분집합으로 만들어서 Outlier에 저장
Outlier
class(Outlier)
