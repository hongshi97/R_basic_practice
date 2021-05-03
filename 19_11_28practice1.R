library(ggplot2)
randNorm <- rnorm(30000)
randDensity <- dnorm(randNorm)
dnorm(randNorm)   

p <- ggplot(data.frame(x=randNorm, y=randDensity)) + aes(x=x,y=y) + geom_point() + labs(x="Random Normal Variables", y= "Density")

# 아래 코드와 같이 평소처럼 aes() 함수를 ggplot() 함수 안에 넣어서 사용해도 됨.
ggplot(data.frame(x=randNorm, y=randDensity), aes(x=x,y=y)) + geom_point() + labs(x="Random Normal Variables", y= "Density")

neg1Seq <- seq(from = min(randNorm), to = -1, by = 0.1)  # randNorm에서 가장 작은 값부터 시작해서 -1까지 0.1씩 증가하는 숫자들
neg1Seq
max(neg1Seq)


lessThanNeg1 <- data.frame(x=neg1Seq, y=dnorm(neg1Seq))
head(lessThanNeg1)
p + geom_polygon(data=lessThanNeg1, aes(x=x,y=y))       # 

###이 줄 기준 위 아래 p + geom_polygon~~~ 코드 실행해서 차트 그림 비교해보기.

lessThanNeg1 <- rbind(c(min(randNorm),0), lessThanNeg1, c(max(lessThanNeg1$x),0))
# rbind는 row bind의 약자로 행(row)을 결합시켜 줍니다. 
# rbind의 경우 열 (column)의 속성이나 이름 또는 개수가 다를 경우 오류가 나게 됩니다. 
# rbind는 (위+아래)의 결합이라고 생각하면 편합니다.
# 위의 코드의 경우, c(min(randNorm),0) 와  lessThanNeg1 와 c(max(lessThanNeg1$x),0) 이렇게 세 개를 결합시켜준 거.
# max(lessThanNeg1$x),0의 경우 lessThanNeg1 데이터 프레임의 x변수 값들 중 max값을 의미.

head(lessThanNeg1)
p + geom_polygon(data=lessThanNeg1, aes(x=x,y=y))

c(min(randNorm),0)
max(lessThanNeg1$x)  
# 그냥 max(lessThanNeg1)하면 lessThanNeg1이라는 데이터프레임 안에 있는 값들 중 제일 큰 거를 고름
# 그런데 우리가 원하는 거는 lessThanNeg1에서 가장 큰 x값을 얻어야 하는데, 이 경우 y값이 제일 큰 거일 수도 있어서
# lessThanNeg1$x 를 통해  "lessThanNeg1의 x에서"라고 지정해준 거.

neg1pos1Seq <- seq(from=-1,to=1,by=0.1)
neg1pos1Seq
neg1To1 <- data.frame(x=neg1pos1Seq, y=dnorm(neg1pos1Seq))
head(neg1To1)
tail(neg1To1)
neg1To1 <- rbind(c(min(neg1To1$x),0),neg1To1,c(max(neg1To1$x),0))
p + geom_polygon(data=neg1To1, aes(x=x,y=y))

randNorm10
pnorm(randNorm10)          # 왼쪽부터 시작해서 주어진 숫자까지의 누적확률을 반환
qnorm(pnorm(randNorm10))   # pnorm()함수와 반대로 주어진 누적확률값을 주면 해당하는 분위수(x값) 반환
all.equal(randNorm10,qnorm(pnorm(randNorm10)))
