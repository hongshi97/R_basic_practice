# array 결과값 손으로 써보고, 인덱스 공부할 때는 메모장에 배열 띄워놓고 인덱스 결과 예측 손으로 써보자

theArray <- array(1:12, dim = c(2,3,2))    # dim = c(x,y,z) 에서 x는 행의 개수, y는 열의 개수, z는 층(?)의 개수. 밑에 arr1 비교.
theArray
theArray[1,,]    #주의. 1행에 해당하는 값들을 뽑아서 열을 기준으로 데이터가 입력되어 새로운 행렬의 형태로  출력된다.
theArray[1,,1]   
theArray[,1,]    #주의. 1열에 해당하는 값들을 뽑아서 열을 기준으로 데이터가 입력되어 새로운 행렬의 형태로  출력된다.
theArray[,,1]

### 추가로 해본 거 ###

arr1 <- array(1:24, dim=c(3,4,2))
arr1

arr1[1,,]   # 1층과 2층에서 1행을 뽑아서 보여주는데, 층이 2개니까 1층에 있던 1행을 하나의 열로, 2층에 있던 1행을 하나의 열로 만들어서 행렬로 보여줌
arr1[,1,]
arr1[,,1]
arr1[2,,2]
