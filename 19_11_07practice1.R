theMatrix <- matrix(1:9,nrow=3)
theMatrix

# apply(객체, 마진(행 or 열), 적용할 함수) 형태. 마진에서 1은 row, 2는 column을 의미
apply(theMatrix,1,sum)
apply(theMatrix,2,sum)

rowSums(theMatrix)
colSums(theMatrix)

# lapply() 함수: 리스트의 각 요소에 어떤 함수를 적용할 때 사용하며, 결과값을 리스트로 반환
# sapply() 함수: 결과값을 벡터로 반환
# lapply()와 sapply()의 차이는 결과값의 형태가 다르다는 거. 그러니까 결과값 형태 잘 알아두자!!!
theList <- list(A = matrix(1:9,3), B = 1:15, C=matrix(1:4,2),D=2)
theList

lapply(theList,sum)  # theList의 각 요소를 sum해서 결과를 리스트로 반환
sapply(theList,sum)  # theList의 각 요소를 sum해서 결과를 하나의 벡터로 반환

class(lapply(theList,sum))  # 추가로 해본 거. 결과 값의 타입을 알아보기 위해서.
class(sapply(theList,sum))  # 추가로 해본 거.

theNames <- c("Lee","Choi","Chang")
lapply(theNames,nchar)
sapply(theNames,nchar)

# mapply()함수: 여러 개의 리스트가 있을 때 각각의 리스트에 대해 어떤 함수를 적용할 때 사용
firstList <- list(A= matrix(1:16,4), B = matrix(1:16,2), c = 15)
firstList

secondList <- list(A = matrix(1:16,4), B = matrix(1:16,8), c = 15:1)
secondList

mapply(identical,firstList,secondList)  # firstList와 secondList의 각각의 요소가 identical(동일)한지 출력함
mapply(sum, firstList,secondList)       # 추가로 해본 거. 
            # firstList와 secondList의 각각의 첫번째 요소, 두번째 요소, 세번째 요소의 원소의 각각의 합을 제시
            # ex) firstList의 A요소의 원소의 총합 + secondList A요쇼의 원소의 총합

# aggregate() 함수 헷갈리니까 주의!!!
# aggregate() 함수: 형태: 틸드(~)를 사이에 두고 왼쪽과 오른쪽으로 구분되는데, 왼쪽에는 계산하고자 하는 대상이 되는 변수,
# 오른쪽에는 그룹을 나눌 때 기준이 되는 변수가 위치함
# aggregate('함수를 적용하고자 하는 변수(컬럼)' ~ '기준이 되는 컬럼', data, 함수) 형태로 사용
data(diamonds, package = 'ggplot2')        # data(불러올 데이터 셋 이름, 패키지 이름)함수를 통해 ggplot2 패키지에 있는 diamonds라는 데이터를 불러옴
head(diamonds)
aggregate(price~cut,diamonds,mean)         # diamonds 데이터에서 cut을 기준으로(cut의 값(종류)별로) price의 mean을 구함     
aggregate(price~cut+color,diamonds,mean)   # diamonds 데이터에서 기준으로 cut을 첫 번째 기준으로, color를 두 번째 기준으로 price의 mean 구함

head(aggregate(price~cut,diamonds,mean)) # diamonds 데이터에서 cut을 기준으로 price의 mean을 구한 거의 상위 6개
head(aggregate(carat~cut,diamonds,mean)) # diamonds 데이터에서 cut을 기준으로 carat의 mean을 구한 거의 상위 6개

aggregate(cbind(price,carat)~cut,diamonds,mean) # cbind(): 열(column)의 결합. 즉, 옆으로 데이터를 결합해줌. 행(row)의 갯수가 같지 않으면 오류 발생
# diamonds 데이터의 cut별로 price와 carat의 mean을 구해줌.
# cbind(price,carat) 대신 cbind(carat,price)로 순서 바꿔서 실행하면 결과도 순서 바꿔서 나옴.

aggregate(cbind(price,carat)~cut+color,diamonds,mean) # diamonds 데이터에서. cut과 color를 기준으로. price와 carat의. mean을 구함

# data.table
# 데이터베이스와 같은 인덱스 시스템을 사용하기 때문에 빠른 스피드가 장점인 패키지
# 데이터 프레임을 확장하고 기능을 개선
# 문법이 기존 데이터 프레임과 약간 달라 적응에 시간일 걸리는 것이 단점
install.packages("data.table")
library(data.table)

theDF <- data.frame(A = 1:10, B = letters[1:10], C = LETTERS[11:20], D = rep(c("One","Two","Three"),length.out=10))
# data.frame : 문자열이 기본적으로 Factor로 만들어짐.

theDT <- data.table(A = 1:10, B = letters[1:10], C = LETTERS[11:20], D = rep(c("One","Two","Three"),length.out=10))
# data.table : 문자열이 기본적으로 chr로 만들어짐.

theDF
theDT

str(theDF)
str(theDT)

class(theDF$B)
class(theDT$B)

diamondsDT <- data.table(diamonds)
diamondsDT
tables()

aggregate(price~cut,diamonds,mean)
diamondsDT[,mean(price),by=cut]
diamondsDT[,list(price = mean(price)),by=cut]
