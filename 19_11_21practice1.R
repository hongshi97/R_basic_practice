library(ggplot2)
mpg
ggplot(data = mpg, aes(x=displ, y=hwy))
ggplot(data = mpg, aes(x=displ, y=hwy)) + geom_point()
ggplot(data = mpg, aes(x=displ, y=hwy)) +
  geom_point()+
  xlim(3,6) + ylim(10,30)  # 특정 부분만 보고 싶을 때 (그래프를 확대해주는 역할이라고 생각하면 됨)
                           # 이 경우 xlim(3,6)을 통해 x축은 3에서 6까지, y축은 10에서 30까지에 해당하는 영역만 보여줌.


# 실습
# mpg 데이터를 이용하여 다음 차트를 만들어보세요.
# mpg 데이터의 cty와 hwy 간에 어떤 관계가 있는지 알아보려고 합니다. x축은 cty, y축은 hwy로 된 산점도를 만들어 보세요.
ggplot(data = mpg, aes(x=cty, y=hwy)) + geom_point()

# midwest 데이터를 이용하여 다음을 분석하세요
# 1) midwest 데이터를 이용해 전체 인구와 아시아인 인구 간에 어떤 관계가 있느지 알아보려고 합니다.
#    x축은 poptotal, y축은 popasian으로 산점도를 만들어 보세요.
ggplot(data = midwest, aes(x=poptotal, y=popasian)) + geom_point()

options(scipen=99)  # 이 코드를 실행하고 19행에 있는 그래프 그리는 코드 실행하면 지수형으로 표시된 값이 자연수로 표시됨

options(scipen=0)   # 이 코드를 실행하고 19행에 있는 그래프 그리면 다시 지수로 표시됨

# 2) 전체 인구는 50만 이하, 아시아인 인구는 1만명 이하인 지역만 산점도에 표시되게 하세요.
ggplot(data = midwest, aes(x=poptotal, y=popasian)) + geom_point() + xlim(0,500000) + ylim(0,10000)

