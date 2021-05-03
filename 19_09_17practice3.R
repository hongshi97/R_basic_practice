x <- 4
is.numeric(x)  #integer는 정수, numeric은 실수라고 생각하면 된다
i <- 5L     #숫자 뒤에 대문자 L을 붙이면 숫자를 integer자료형으로 저장하라는 의미
is.integer(i)  # i가 integer냐?
is.numeric(i)  #integer는 numeric이기도 하므로 TRUE이다.
class(4L)
class(2.8)
4L * 2.8
class(4L * 2.8)   #integer와 numeric의 연산 결과 자료형은 numeric이다.
class(5L/2L)      #5L/2L의 결과는 2.5이므로 numeric이다.
