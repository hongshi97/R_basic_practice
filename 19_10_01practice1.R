x <- c(1,2,3)
mean(x)
max(x)
min(x)

# paste() 함수 사용: 나열된 원소를 이어붙여서 결과값으로 제공
str6 <- c("Hello!","World","is","good!!")
paste(str6, collapse=" ")                    # str6의 각 단어들 사이를 " " (띄워쓰기 한 번)을 넣고 붙여줌
paste(str6, collapse= ",")                   # 추가로 해 본 거
paste(str6)                                  # collapse를 안 써주면 어떻게 되는지 확인!!!
                                             # str6에 할당된 문자열들이 한 개씩 출력됨 = 그냥 str6 결과랑 같음
paste(c("Hello","World"),collapse="-")

# 함수의 반환값을 새로운 변수에 저장
mean_x <- mean(x)
mean_x
str_paste <- paste(str6, collapse=" ")
str_paste
