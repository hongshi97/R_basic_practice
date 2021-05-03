library(ggplot2)
library(ggthemes)

DF <- read.csv("example_studentlist.csv")
str(DF)   # name, sex, absence, bloodtype이라는 chr들을 자동으로 Factor형으로 불러들임.

g1 <- ggplot(DF, aes(x=height, y=weight,colour=bloodtype))  # colour = bloodtype: bloodtype별로 색깔을 표시
g1 + geom_point()
# 위 그래프 결과를 통해 height가 커질스록 weight가 커진다는 경향을 파악할 수 있다. (우리 수업 범위 밖임.)

g1 + geom_line()  # bloodtype별로 색깔을 표시하기 때문에 line도 4개 나옴
g1 + geom_point() + geom_line() # g1에서 bloodtype별로 색깔을 표시한다고 저장해놨기 때문에 결과도 bloodtype에 따라 색깔 표시
g1 + geom_point(size=10) + geom_line(size=1) # size를 통해 점이나 선의 size를 조절함.
# geom_line()안에 aes()로 따로 색깔을 지정해줬을 때와 안 해줬을 때 그래프 결과 구분
g1 + geom_point(size=10) + geom_line(aes(colour=sex),size=1) # point는 bloodtype에 따라, line은 sex에 따라 색깔을 표시

#facet_grid()이용해서 두 개의 그래프 따로 출력
g1 + geom_point(size=10) + geom_line(size=1) + facet_grid(.~sex)  # facet_grid(.~sex): sex에 따라서 그래프를 세로로 출력
g1 + geom_point(size=10) + geom_line(size=1) + facet_grid(sex~.)  # facet_grid(sex~.): sex에 따라서 그래프를 가로로 출력
g1 + geom_point(size=10) + geom_line(size=1) + facet_grid(sex~.,scales="free")

# 테마 적용하기
g1 + geom_point() + geom_line() + theme_wsj()

