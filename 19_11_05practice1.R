library(dplyr)

# ggplot2 패키지에 포함된 midwest 데이터를 이용하세요.
midwest <- as.data.frame(ggplot2::midwest)

str(midwest)

# popadults는 해당 지역의 성인 인구, poptotal은 전체 인구를 나타냅니다.
# midwest 데이터에 "전체 인구 대비 미성년 인구 백분율" 변수를 추가하세요.
midwest <- midwest %>% mutate(ratio_child = (poptotal-popadults)/poptotal*100)
# midwest <- 부분이 없으면 mutate 함수로는 새로운 변수를 저장 못한다!!!

str(midwest)

# 미성년 인구 백분율이 가장 높은 상위 5개 county의 미성년 백분율을 출력하세요.
midwest %>% 
  arrange(desc(ratio_child)) %>% 
  select(county, ratio_child) %>% 
  head(5)

# 미성년 인구 백분율이 40 이상이면 large, 30이상 40미만이면 middle, 30 미만이면 small로 입력
midwest <- midwest %>% 
  mutate(grade = ifelse(ratio_child>=40,"large",ifelse(ratio_child>=30&ratio_child<40,"middle","small")))

table(midwest$grade)

# popasian은 해당 지역의 아시아인구를 표시합니다. '전체 인구 대비 아시아인 인구 백분율' 변수를 추가하고
# 하위 10개 지역의 state, county, 아시아인 인구 백분율을 출력하세요.
midwest1 <- midwest %>% 
  mutate(ratio_asian = (popasian/poptotal)*100) %>% 
  arrange(ratio_asian) %>% 
  select(state, county, ratio_asian) %>% 
  head(10)
# 위 코드(교수님이 알려주신 거)를 실행하면 midwest에서 ratio_asian이라는 변수를 만들고 그 중, state,county, ratio_asian만 추출해서 
# 앞에서 10개를 midwest1이라는 변수에 저장함 

midwest1

# 위에 처럼 한 번에 다 코딩하는 방법도 있고 
midwest1 <- midwest %>% mutate(ratio_asian = popasian/poptotal * 100)
midwest1 %>% select(state,county,ratio_asian) %>% arrange(ratio_asian) %>% head(10)
# 과 같이 두 번으로 나눠서 코딩하는 방법 (내가 개인적으로 한 거)도 된다!!! 
# 단, 밑에 코딩의 midwest1은 기존 midwest에서 ratio_asian이라는 변수가 추가된 상태다! 위에 코딩의 경우 midwest1에는 일부만 들어있는 것과 다름


