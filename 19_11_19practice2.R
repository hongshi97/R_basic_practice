library(ggplot2)
library(ggthemes)

str(diamonds)

ggplot(diamonds,aes(x=x,y=price)) + geom_point()  # x(diamonds 데이터에 x라는 이름의 변수 존재함)가 증가함에 따라 price가 증가함을 알 수 있다.
ggplot(diamonds,aes(x=x,y=price,colour=clarity)) + geom_point()  # clarity에 따라 색깔 표시
ggplot(diamonds,aes(x=x,y=price,colour=clarity)) + geom_point() + theme_solarized_2() # 테마 적용
ggplot(diamonds,aes(x=x,y=price,colour=clarity)) + geom_point(alpha=0.03) + theme_solarized_2() #alpha:  point의 투명도 조절.
# 그런데 범례까지 같이 투명해짐

ggplot(diamonds,aes(x=x,y=price,colour=clarity)) + geom_point(alpha=0.03) + 
  guides(colour = guide_legend(override.aes = list(alpha=1))) +theme_solarized_2() # 위 그래프에서는 legend까지 투명하게 나왔는데
                                                                                   # 범례(legend)는 잘 보이게 다시 만듦.
ggplot(diamonds,aes(x=x,y=price,colour=clarity)) + geom_point(alpha=0.03) +  
  geom_hline(yintercept=mean(diamonds$price),color="turquoise3",alpha=.8) +  # hilne은 그래프 위에 선을 그려줌.
  guides(colour = guide_legend(override.aes = list(alpha=1))) + xlim(3,9) + theme_solarized_2()
