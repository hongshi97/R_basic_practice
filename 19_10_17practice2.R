DF <- read.csv("example_salary.csv", stringsAsFactors = T, na = "-") 
# read.csv()함수를 이용하면 csv파일을 데이터 프레임으로 읽어옴
# data.frame()함수는 변수 안에 문자형 데이터가 있으면 이의 자료형을 factor형식으로 바꾸는 성향이 있다.
# stringAsFactors = T는 문자열을 factor로 사용하겠다. 
# stringAsFactors = F 는 문자열을 factor가 아닌 문자열 그대로의 자료형으로 사용하겠다.
# na = "-" 는 na를 -로 바꾸겠다.
head(DF,5) # DF라는 자료의 위에서 5개를 출력
str(DF)    # 추가로 해본 거

###추가로 해본 거###
DF3 <- read.csv("example_salary.csv", stringsAsFactors = F, na = "-")
head(DF3,5)
str(DF3)
####################

colnames(DF)  # DF의 열이름을 출력
colnames(DF) <- c("age","salary","specialSalary","workingTime","numberOfWorker","career","sex")
# DF의 열이름을 영어로 바꿔줌. (한글로 하면 오류가 자주 발생)
str(DF)  # DF의 구조를 알려줌. 파이썬에서 변수를 문자열로 바꿔주는 함수 str()이랑 다르다!!!
search() 
detach(DF)
attach(DF)

Mean <- mean(salary,na.rm=T)     # 함수 mean()이 있어서 첫 글자 대문자로 Mean으로 함. 
Mean                             # 그냥 mean 코드 실행하면 어떤 함수인지 설명 나옴

Mid <- median(salary, na.rm = T)
Mid

Range <- range(salary, na.rm = T)
Range

### which()함수 잘 익혀두자. 시험 나올 듯 ### 
w1 <- which(DF$salary == 4064286)   # DF에서 salary라는 변수의 값이 4064286인 데이터의 "행 번호"(숫자)를 w에 저장
w1

w2 <- which(DF$salary >= 4000000) # salary가 400만 이상인 데이터들의 행번호들을 저장
w2

which(DF$salary >= 4000000) # 실행하면 salary가 400만 이상인 데이터들의 행번호만 출력됨됨

w3 <- which(DF$salary < 4000000) # salary가 400만 미만인 데이터들의 행번호들을 저장
w3

w4 <- which(salary == 4064286)   # attach(DF)를 했기 때문에 DF$salary가 아닌 그냥 salary로도 호출 가능. 물론 DF$salary도 가능
w4

DF[w1,]               #사용 형태 체크! # w1은 48에 해당. DF[w1,]은 DF[48,]과 같은 거. 따라서 DF에서 48행(관측치) 전체를 출력

Qnt<- quantile(salary, na.rm = T)  # salary의 사분위수를 Qnt라는 변수에 저장
Qnt

Salary <- list(평균월급 = Mean, 중앙값월급 = Mid, 월급범위 = Range, 월급사분위 = Qnt)   # list()함수를 통해 list 형성.
Salary

### 추가로 해본 거. 리스트에서 인덱싱 ###
Salary["평균월급"]
Salary[["평균월급"]]

class(Salary["평균월급"])
class(Salary[["평균월급"]])

Salary["중앙값월급"]
Salary["가나다"]      # Salary라는 리스트에 없는 변수명을 호출해봄. 결과값은 NULL
