q <- c('A','B','AB','O','AB','A','A','O','AB','B')
q2 <- as.factor(q)  # as.factor는 인자를 factor로 변환해 줌.
q2
str(q2)             #추가로 해본 거. q2의 구조는 factor이다.
as.numeric(q2)      #체크~!!! 컴퓨터가 알아서 원소들에 Levels의 순서에 따라서 A는 1 AB는 2, B는 3, O는 4 라는 순서로 매김

factor(x = c('A','B','AB','O','AB','A','A','O','AB','B'), levels=c('A','B','AB','O'),ordered=TRUE)
# factor() 함수에서 levels 옵셥과 ordered 옵션을 통해 사용자가 원하는 'A','B','AB','O' 순서로 Levels 지정함.
# 출력결과에 Levels: A < B < AB < O 라고 나옴 (부등호 표시가 되서 나오네!!)

###밑에 코드는 추가로 해본 거### 출력 결과 비교해보기.

factor(x = c('A','B','AB','O','AB','A','A','O','AB','B'), levels=c('A','B','AB','O'),ordered=FALSE)
# 위에랑 같은 코드인데 ordered=FALSE로 함.
# 출력결과에 Levels: A B AB O 라고 나옴.

factor(x = c('A','B','AB','O','AB','A','A','O','AB','B'), levels=c('A','B','AB'),ordered=TRUE)
#levels에서 'O'를 빼고 지정함.