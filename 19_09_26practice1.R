list(1,2,3)    # list의 요소 개수 세는 방법: 쉼표 , 개수 보고 파악하면 되네! 각 요소별로 [[1]], [[2]],...로 출력됨.
list(c(1,2,3))
list(c(1,2),c(3,4),c(5,6))    #추가로 해본 거.
list(theDF,1:10)              # Dataframe이 리스트의 하나의 요소로 들어감
list3 <- list(c(1,2,3),3:7)
list3
list5 <- list(theDF,1:10,list3) # list안에 list가 하나의 요소로 들어감.
list5

list_practice <- list(1:10,list3)  # 이거 출력 결과 손으로 써보기
list_practice

names(list5)
names(list5) <- c('data.frame','vector','list') #각 요소에 data.frame, vector, list라는 이름을 붙임
names(list5)
list5
list6 <- list(theDataFrame = theDF, TheVector = 1:10, TheList = list3)
names(list6)
list6

### 여기부터 밑에 부분 복습 제대로 하기 헷갈리기 쉽다 ###

list5[1]
list5[[1]]  # 이거랑 위에 코드랑 구분 잘하기! list5[1]는 통유리로 된 data.frame이라는 이름의 방을 밖에서 본 거. list5[[1]]은 그 방 안에 들어간거
class(list5[1])   
class(list5[[1]])

list5['data.frame']
list5[["data.frame"]]
class(list5[["data.frame"]])

list5[1]$Sport   # data.frame이라는 방 밖에서 방 안에 있는 Sport를 찾으려니까 못 찾아서 NULL
list5[[1]]$Sport # data.frame이라는 방 안에 들어가서 Sport를 찾으니까 찾을 수 있음.
list5[[1]][['Sport']]           #추가로 해본 거  $변수명 이랑 [['변수명']] 이랑 똑같은 기능을 한다는 거 확인해보려고 함함

length(list5)     # list의 요소의 개수를 셈.
list5[[4]] <- 2                 #list5에 4번째 요소를 만들고 거기에 2를 할당
length(list5)
list5
list5[['NewElement']] <- 3:6    #list5에 NewElement라는 새로운 요소를 만들고 거기에 3,4,5,6을 할당
list5
length(list5)
