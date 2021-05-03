x <- 10:1
y <- -4:5
q <- c('Hotkey','Football','Baseball','Curling','Rugby','Lacrosse','Basketball','Tennis','Cricket','Soccer')

theDF <- data.frame(x,y,q)
theDF
str(theDF)

###추가로 해 본 거###
theDF2 <- data.frame(c(x,y,q))  # c(x,y,q)를 하나의 변수로 저장. 
theDF2
str(theDF2)                     # DF2는 하나의 변수에 30개의 관측치가 존재하는 데이터 프레임

v
#####################

theDF <- data.frame(First =x, Second =y, Sport = q)    # First, Second, Sport라는 변수명을 새로 할당 
theDF
nrow(theDF)      #행의 개수(관측치의 개수) 출력
ncol(theDF)      #열의 개수(변수의 개수) 출력
dim(theDF)       # 몇 행, 몇 열인지 출력
names(theDF)     # 변수명들 출력
names(theDF[3])  # theDF의 3번째 인덱스의 변수명 출력
theDF[3]
names(theDF)[3]  # names(theDF)는 "First" "Second" "Sport"인데 여기서 3번째 인덱스 출력.

rownames(theDF)
rownames(theDF) = c('one','two')    #할당하려는 행의 이름의 개수가 행의 개수보다 작으면 에러 발생
rownames(theDF) = c('one','two','three','four','five','six','seven','eight','nine','ten')
theDF
rownames(theDF) = NULL   # theDF의 행의 이름을 다시 1,2,3,,,으로 초기화시킴, 행의 이름은 디폴트가 1,2,3,...
theDF
#colnames(theDF) = NULL   #theDF의 열의 이름(변수명)을 NULL로.   colnames를 NULL로 하면 아예 변수명에 아무것도 안 나옴.
#theDF

head(theDF)
head(theDF, n=3)

tail(theDF)
tail(theDF, n=3)

class(theDF)

# typeof(theDF)          #추가로 해본 거. class()와 typeof()의 차이 알아보기. class()는 데이터의 속성 / typeof()는 자료형
                         #typeof()는 몰라도 된다. 빅통세에서 사용 안 함.
### 인덱싱 중요!!! 시험에 나오기 완벽하다 ###
### 결과 쓴느 거 나올 듯 ### 
theDF$Sport            # theDF[['Sport']]와 같은 결과값을 출력함함
theDF['Sport']
theDF[['Sport']]
class(theDF['Sport'])   # theDF['Sport']는 데이터프레임
class(theDF[['Sport']]) # theDF[['Sport']]는 팩터. 데이터 프레임은 기본적으로 문자를 팩터로 저장한다.
theDF
theDF[4,3]    # theDF의 4행 3열은 Curling인데 이것은 팩터라서 Levels가 함께 나옴
theDF[1,1]    
theDF[3,c(2:3)]  # 변수명이 함께 출력
theDF[3,2:3]
theDF[c(3,5),2]
theDF[c(3,5),2:3]
theDF[,3]             # theDF[,3]의 결과 형태랑 theDF[,2:3]의 결과 형태가 다른 거에 주의!!!
theDF[,2:3]
theDF[2,]       
theDF[2:4,]

# theDF['Sport'] 와 theDF[['Sport']]의 차이 알아두기!!! 

theDF[,c('First','Sport')]
theDF[,'Sport']            # theDF[,'Sport']의 출력값은 가로로 쭉 나열되어서 나온다. theDF[,3]과 같은 형태
class(theDF[,'Sport'])     # theDF[,'Sport']는 factor
theDF['Sport']             # 데이터 프레임 형태로 값을 출력
class(theDF['Sport'])      # 데이터 프레임
theDF[['Sport']]           # theDF 변수 안의 Sport 벡터에 해당하는 '값'을 출력.  theDF[, 'Sport']와 같은 값 출력.
class(theDF[['Sport']])    # factor.
theDF$Sport
