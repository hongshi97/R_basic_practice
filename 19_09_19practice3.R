x <- c(1,2,3,4,5,6,7,8,9,10)
x
x*3
x+2
x-3
x/4
x^2      # x^2는 x의 제곱, x^5는 x의 5제곱을 의미
sqrt(x)  #sqrt()는 루트의 기능

x<-1:10
y<- -5:4
x+y
x-y
x*y
x/y     # Inf는 무한을 의미 6/0 에서 0으로 나눠서 Inf를 출력함
x^y

length(x)   # length()함수: 몇개의 원소가 있는지 출력
nchar(x)    # nchar()함수: 각 원소의 문자 개수, 숫자 개수 출력 -도 카운트한다!!
length(y) 
nchar(y)
length(x+y)
length(x) + length(y)

#######이 밑에꺼 잘 알아두자!!! 순환 법칙~!!!###########
class(var5)
class(x)
x+c(1,2)      #10개의 x 원소에 1,2를 반복해서 더함
x+c(1,2,3)    #10개의 x 원소에 1,2,3을 반복해서 더하는데 마지막에는 숫자가 남아서 warning이 뜸

x<=5          # 각 원소가 TRUE인지 FALSE인지 비교 연산. x의 원소들 중 5이하에 해당하는 원소들은 TRUE, 5보다 큰 원소들에는 FALSE 출력
x>y           # 첫 번째 원소끼리, 두 번째 원소끼리,... 비교해서 TRUE인지 FALSE인지 출력

x <- 10:1     # 10,9,8,7,6,5,4,3,2,1 순서로 x에 할당
y <- -4:5
any(x<y)      # 하나라도 x<y가 TRUE면 any(x<y)는 TRUE
all(x<y)      # 대응하는 x원소와 y원소가 다 x<y가 TRUE여야 all(x<y)는 TRUE