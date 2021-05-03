# 결과 예측해서 손으로 써보기
A <- matrix(1:10, nrow=5)     # nrow 대신 ncol 써도 된다. ncol=2 처럼.
A

B <- matrix(21:30, nrow=5)
B

C <- matrix(21:40, nrow=2)
C

D1 <- matrix(1:10, nrow=3)    #추가로 해본 거  # 순환 법칙 적용 되네.
D1
D2 <- matrix(1:11, nrow=5)    #추가로 해본 거  # 순환 법칙 적용 됨.
D2

nrow(A)   # A의 row(행)의 개수 출력
ncol(A)   # A의 column(열)의 개수 출력
dim(A)    # A가 몇행 몇열인지 출력력

A + B
A * B    # 주의. 각각 대응하는 원소를 곱함. (일반적인 행렬의 곱이랑 다름. 원소들끼리 곱함.)
A == B   # 주의. A와 B의 각각의 원소가 서로 == 인지 출력

# 행렬은 크기가 다르면 연산 불가능

colnames(A)
rownames(A)
colnames(A) <- c('Left','Right')                  # A의 열에 이름을 지정함
rownames(A) <- c('1st','2nd','3rd','4th','5th')   # A의 행에 이름을 지정함
A
