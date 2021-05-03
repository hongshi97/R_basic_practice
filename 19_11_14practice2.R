library(ggplot2)

ggplot(data = diamonds) # 이 코드는 단순히 어떤 데이터를 이용할 건지만 정한 거. 따라서 그래프는 안 보여줌

# aes()는 ggplot()함수 안에서 써도 되고, geom_histogram()함수 안에 써도 된다.
ggplot(data = diamonds) + geom_histogram(aes(x=carat))     # aes(x=carat)을 통해 x축으로 carat을 지정 
ggplot(data = diamonds, aes(x=carat)) + geom_histogram()   

ggplot(data=diamonds) + geom_density(aes(x=carat),fill="gray50")  # 그래프를 채우는 색깔을 "gray50"으로 정함
ggplot(data=diamonds) + geom_density(aes(x=carat),fill="red")     # 그래프를 채우는 색깔을 "red"로 정함

ggplot(data=diamonds, aes(x=carat,y=price)) + geom_point()   # aes()를 ggplot함수 안에 쓴 경우
ggplot(data=diamonds) + geom_point(aes(x=carat,y=price))     # aes()를 geom함수 안에 쓴 경우

g1 <- ggplot(data=diamonds,aes(x=carat,y=price))   # ggplot()함수를 g1이라는 변수에 저장
g2 <- geom_point(aes(color = color))               # geom_point()함수를 g2에 저장
# 앞에 color는 aes()의 옵션, 뒤에 color는 diamonds 데이터 안의 변수 이름 
g1 + g2        # ggplot()과 geom_point()를 저장해 둔 변수를 이용해서 함수 그리기 가능!

g3 <- ggplot(data = diamonds)   # diamonds를 그릴 것이다.
g4 <- geom_point(aes(x=carat,y=price,color = color))   # x축은 carat, y축은 price, 색깔은 color에 따라서 point 그래프 그릴 것이다.
g3 + g4 

table(diamonds$carat)  # 혼자 해 본 거. carat이 어떤 값이 있는지 확인해본 거.

ggplot(diamonds, aes(x=carat)) + geom_histogram() + facet_wrap(~color)
# facet_wrap()을 통해서 그래프 하나를 데이터셋에 포함된 요인에 따라 다수 그래프로 쪼갤 수 있다.
# 위 코드의 경우, diamonds의 color에 따라 여러 개의 그래프를 만든다. 
# 각 그래프는 x축에는 carat이 오고 y축에는 적당한 변수(이 경우 count)가 옴

ggplot(diamonds,aes(y=carat,x=1)) + geom_boxplot()
ggplot(diamonds,aes(y=carat,x=cut)) + geom_boxplot()  # x축은 cut, y축은 carat으로 boxplot을 그림. cut별로 carat을 y축으로 boxplot 그림.
ggplot(diamonds,aes(y=carat,x=cut)) + geom_violin()   # x축은 cut, y축은 carat으로 violin 모양 그래프를 그림
ggplot(diamonds,aes(y=carat,x=cut)) + geom_point() + geom_violin()  # 한 그래프에 두 개의 geom()을 동시에 사용해서 동시에 표현
ggplot(diamonds,aes(y=carat,x=cut)) + geom_violin() + geom_point()  # geom_point()와 geom_violin() 중 뭐를 먼저 쓰는지 순서에 따라 그래프 결과가 다르다!
