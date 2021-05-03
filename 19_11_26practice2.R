rnorm(10) # 표준정규분포에서 난수 10개 뽑음  /  mean이랑 sd 별도로 지정 안 해주면 mean=0,sd=1인 표준정규분포 따름
rnorm(n=10, mean=100, sd=20)  # 평균은 100, 표준편차는 20인 정규분포에서 난수 10개 뽑음
rnorm(n=10, mean=100, sd=1)   # 표준편차가 작을수록 평균과 가까운 숫자가 나올 확률이 높음
                              # 표준편차가 1이라고 해서 99~101만 나오는 게 아니라, 97이나 102와 같은 수도 나온다.
                              # 정규분포표를 생각해보면 꼬리 부분에도 숫자가 존재하긴 한다!!!

randNorm10 <- rnorm(10)       # mean=0,sd=1인 난수 10개 뽑아서 randNorm10에 저장
randNorm10

# dnorm(): 정규분포의 확률밀도는 특정한 값에서의 확률을 표시. 즉 특정 숫자가 발생할 확률을 출력함
#          수학적으로는 불가능하기 때문에 추정값을 사용
dnorm(randNorm10)       # dnorm()을 이용해서 randNorm10에 각 숫자가 나올 확률을 각각 출력해줌
dnorm(c(-1,0,1))        # -1이 나올 확률, 0이 나올 확률, 1이 나올 확률을 각각 출력 
dnorm(c(-10,0,10))      # 표준 정규 분포표는 y축 기준으로 좌우대칭이라서 +a가 나올 확률과 -a가 나올 확률 이 동일함

randNorm <- rnorm(30000)
randDensity <- dnorm(randNorm)
library(ggplot2)
ggplot(data.frame(x=randNorm, y=randDensity)) + aes(x=x,y=y) + geom_point() + labs(x="Random Normal Variables", y="Density")
# x축에는 표준정규분포를 따르는 3만개의 난수, y축에는 각 난수가 나올 확률. 이거를 point로 표시하고 x축과 y축에 이름 붙여줌

randNorm10
# pnorm(): 왼쪽부터 시작해서 주어진 숫자까지 누적확률을 반환 (평소에 생각하는 정규분포에서의 확률)
# pnorm()은 쉽게 이해하려면 그냥 정규분포표 그리면 이해하기 쉬움.
pnorm(randNorm10)   # randNorm10이랑 pnorm(randNorm10) 같이 출력해놓고 결과 보면 이해하기 편함
pnorm(c(-3,0,3))    # P(X<=(-3))과 P(X<=0), P(X<=3)을 출력한다고 생각하면 됨
pnorm(-1)           # pnorm(-1)은 1-pnorm(1)과 같다. because, 표준정규분포는 좌우대칭
pnorm(1)
pnorm(1) - pnorm(0)
pnorm(1) - pnorm(-1)


