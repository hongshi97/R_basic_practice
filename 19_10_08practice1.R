x <- c(1,2,3,4,5)
x
y <- x + 5
y

### () 괄호, {} 괄호 사용하는 거, 각 괄호의 범위 잘 구분하기!!!

if(sum(x) < sum(y)) print(x)    # sum(x) < sum(y) 가 TRUE면 print(x) 실행

if(TRUE&FALSE) print(x)         # TRUE&FALSE는 FALSE라서 아무것도 실행 안 함
 
if(sum(x)<sum(y)) {             # sum(x) < sum(y) 이면 중괄호 {} 안에 있는 코드를 다 실행
  print(x)
  print(mean(x))   # mean() 함수. 평균 구하는 거.
  print((var(x)))  # var() 함수. 분산 구하는 거.
}

if(sum(x)<sum(y)) {print(x);print(mean(x));print(var(x))}   #이 코드는 위에 10행~14행 코드랑 같은 건데 한 줄로 표현한 거
                                                            #한 줄에 print 여러 개 하려면 ; 사용
if (mean(x) > mean(y)){
  print(paste("mean(x)가",mean(x)-mean(y),"만큼 크다."))   # paste 함수 사용. 
} else{
  print(paste("mean(y)가",mean(y)-mean(x),"만큼 크다."))
}

ifelse(mean(x) > mean(y), print("mean(x)가 크다."), print("mean(y)가 크다."))
# ifelse() 는 첫번째 인자로 조건문, 두번째 인자로는 조건이 TRUE일 때 실행할 문장, 세번째 인자로는 조건이 FALSE일때 실행할 문장

ifelse(3==4, print("참"),print("거짓"))

# ifelse 중첩문
score= 45
ifelse(score>90 & score <= 100, print('A'),ifelse(score>80&score<=90,print('B'),print('C')))

# switch문. 강의 시간에 안 다룬 거 같음. switch(비교구문, 실행 구문 1, 실행 구문 2, ...)
x <- 'KHU'
switch(x, KHU=100, SKKU=200,SNU=300)
