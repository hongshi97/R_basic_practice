DF <- read.csv("example_studentlist.csv")


# 한 화면에 여러 개 그래프 그리기. par()함수 사용.
opar <- par(no.readonly=TRUE)   # 원래의 그래프 파라메터를 모두 저장
par(mfrow = c(2,3))             # 2행 3열로 만듬  
# mfrow=c(2,3)으로 하면 행을 기준으로 그래프가 순서대로 추가. 
# Plus. 내가 찾아본 거: mfcol=c(2,3)을 하면 똑같이 2행 3열 만드는데 그래프가 열을 기준으로 순서대로 추가
plot(DF$weight, DF$height)      # 첫번째 차트
plot(DF$sex,DF$height)          # 두번째 차트
barplot(table(DF$bloodtype))    # 세번째 차트   DF의 bloodtype의 value별 빈도 수를 barplot으로 표현
boxplot(DF$height)              # 네번째 차트
boxplot(DF$height~DF$bloodtype) # 다섯번째 차트
hist(DF$height,breaks=10)       # 여섯번째 차트
par(opar)          # opar은 위에서 par(no.readonly=TRUE)라고 저장해둔 거. 2행 3열로 분할하기로 설정했던 것을 초기화 함


# 넘겨가면서 그래프 보기

plot(DF$weight~DF$height + DF$age + DF$grade + DF$absence + DF$sex) 
# DF$weight를 y축에 고정시켜놓고 x축은 <Enter>를 누르면서 height,age,grade,absence,sex로 바꿔가면서 보여줌


# 한 그래프에 두 그래프 겹쳐 표시.

TS1 <- c(round(runif(30)*100)) # runif(30)은 0부터 1사이 임의의 숫자를 30개 뽑음. round()는 반올림하는 거.
TS2 <- c(round(runif(30)*100))        

###추가로 한 거###
runif(10)  #  runif() 확인해본 거. 0부터 1사이의 임의의 숫자를 10개 뽑음
runif(10)*100   # 0부터 1사이 임의의 숫자 10개에 100을 곱함
round(runif(10)*100)  # 0부터 1사이 임의의 숫자 10개에 100을 곱한 후 반올림함. 
##################

TS1 <- sort(TS1, decreasing = F)  # sort(), decreasing=F 옵션을 이용해서 오름차순으로 정렬. 디폴트가 오름차순이라서 decreasing=F 안 써줘도 됨
TS1                               # sort()의 디폴트 정렬순은 오름차순.내림차순으로 하려면 decreasing = TRUE 옵션을 사용
TS2 <- sort(TS2, decreasing = F)
TS2

# 고수준함수인 plot()과 저수준함수인 line() 함수를 사용.
# 그래프를 겹쳐 표현할 때는 라인 그래프를 이용하는 것이 유리
plot(TS1, type="l")
lines(TS2,lty="dashed",col="red")   # 기존의 그래프에 TS2를 line type은 dashed(점선)이고, color는 red로 line을 하나 더 추가함. 

x1 <- seq(1,100,1)         # seq(시작,끝,interval)
y1 <- dbinom(x1,100,0.25)  # 이항분포. 

dbinom(1,100,0.25) # 혼자 해본 거. dbinom(1,100,0.25)는 성공확률이 25%인데 100번 중 1번 성공할 확률 계산해 줌.
dbinom(25,100,0.25) # 성공확률 25%니까 100번 중 25번 성공할 확률이 제일 높음. 밑에 그래프들 보면 확인 가능

plot(x1,y1,type="p")  # 점      # x1이 x축, y1이 y축으로 point로 표현
plot(x1,y1,type="l")  # 선
plot(x1,y1,type="h")  # 히스토그램
plot(x1,y1,type="s")  # 계단식
