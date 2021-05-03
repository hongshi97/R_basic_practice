library(ggplot2)

rbinom(n=1,size=10,prob=0.4)   # 시행횟수 10, 사건발생확률(성공확률)이 0.4인 이항분포에서 1개의 난수 만들기
rbinom(n=5,size=10,prob=0.4)   # 시행횟수 10, 사건발생확률이 0.4인 이항분포에서 5개의 난수 만들기
rbinom(n=10,size=10,prob=0.4)  # 결과로 나오는 각 숫자 하나하나가 시행횟수 10번, 사건발생확률 0.4인 실험에서 사건이 발생한 횟수다.

rbinom(n=1,size=1,prob=0.4)
rbinom(n=5,size=1,prob=0.4)
rbinom(n=10,size=1,prob=0.4)

binomData <- data.frame(Successes=rbinom(n=10000,size=10,prob=0.3))
binomData  # 결과에는 omitted 9000 rows 됨. 즉 9000행은 생략되서 나옴
dim(binomData)  # binomData는 현재 10000행, 1열짜리 데이터 프레임
ggplot(binomData, aes(x=Successes)) + geom_histogram(binwidth=1) # histogram은 빈도수를 나타내는 거라서 x축만 지정해도 됨.

binom5 <- data.frame(Successes = rbinom(n=10000, size=5, prob=0.3), Size=5) 
# Successes라는 변수에 이항분포 난수 1만개, Size라는 변수에는 숫자 5를 할당해서 데이터프레임 만듦어서 binom5에 저장
dim(binom5)
head(binom5)

binom10 <- data.frame(Successes = rbinom(n=10000,size=10,prob=0.3), Size=10)
dim(binom10)
head(binom10)

binom100 <- data.frame(Successes = rbinom(n=10000,size=10,prob=0.3), Size=100)

binom1000 <- data.frame(Successes = rbinom(n=10000,size=10,prob=0.3), Size=1000)

binomAll <- rbind(binom5, binom10, binom100, binom1000)   # rbind는 row bind 즉, 아래로 데이터를 추가하는 거.
dim(binomAll)
head(binomAll, 10)
tail(binomAll, 10)

ggplot(binomAll, aes(x=Successes)) + geom_histogram(bins=30) + facet_wrap(~Size, scales="free") 
# facet_wrap(~Size, scales="free")를 통해 Size별로 그래프를 만들어서 한 번에 보여줌.

dbinom(x=3,size=10,prob=0.3)
dbinom(x=1:10, size=10, prob=0.3)
