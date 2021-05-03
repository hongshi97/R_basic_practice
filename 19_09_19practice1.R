x <- "Data"
nchar(x)
nchar("Hello")   # nchar()는 문자열의 개수 혹은 숫자의 개수 반환. n
nchar(123)
nchar("123")
nchar(-123)      # 이 출력값은 4이다. 
class(-123)

date1 <- as.Date("2019-09-19")
date1
class(date1)
# typeof(date1)    #이거는 내가 추가적으로 해본 거거

as.numeric(date1)
class(as.numeric(date1))  #추가로 한 거

date2 <- as.POSIXct("2019-09-19 12:23")   #as.POSIXct를 이용해 시간,분까지 저장.
date2
class(date2)

#추가로 해본 거
date3 <- as.POSIXct("2019-10-26 15:35:22")   # as.POSIXct를 이용해 초까지도 저장 가능하다.
date3
class(date3)
