library(dplyr)

# left_join() 함수, bind_rows() 함수   !!!! dplyr 패키지 라이브러리 해야 사용 가능!

# legt_join() 함수   # 주민등록번호, 학번과 같은 Key가 필요. 이 예시에서는 id에 해당.
test1 <- data.frame(id=c(1,2,3,4,5), midterm = c(60,80,70,90,85))
test1

test2 <- data.frame(id=c(1,2,3,4,5), finterm = c(73,65,92,54,45))
test2

total <- left_join(test1,test2,by='id')  # test1과 test2를 id를 기준으로 합침
total

name <- data.frame(class = c(1,2,3,4,5),teacher=c('kim','lee','park','choi','jung'))
name

exam <- read.csv("csv_exam.csv")

exam_new <- left_join(exam,name, by= "class")   # exam은 앞에서 계속 쓰던 그 csv 파일 불러온 거.
exam_new               #주의! exam 파일에서는 class1,class2,... 등이 각각 여러 번 반복되는데 그에 따라 teacher 값이 할당됨
 
# bind_rows() 함수
group_a <- data.frame(id=c(1,2,3,4,5),test=c(60,80,70,90,85))
group_a

group_b <- data.frame(id=c(6,7,8,9,10),test=c(73,65,92,54,45)) 
# group_b에서 id=c(5,7,8,9,10)으로 하고 bind_rows 하면 id가 5 test 85(group_a에 있는 거), 
# id가 5 test가 73인 거 두 행이 나옴. 즉, 그냥 두 데이터프레임을 세로로 그대로 붙여버리는 느낌임.
group_b

group_all <- bind_rows(group_a,group_b)
group_all



# 실습_1번
fuel <- data.frame(fl = c('c','d','e','p','r'), price_fl = c(2.35,2.38,2.11,2.76,2.22),stringsAsFactors = F)
fuel

# fuel <- data.frame(fl = c('c','d','e','p','r'), category = c("CNG","diesel","ethanol E85", "premium","regular"),price_fl = c(2.35,2.38,2.11,2.76,2.22),stringsAsFactors = F)

mpg <- as.data.frame(ggplot2::mpg)

mpg1 <- left_join(mpg,fuel,by='fl')    # mpg와 fuel라는 데이터 프레임을 fl을 기준으로 합침
# mpg 데이터는 관측치가 많고, fuel는 관측치가 5개밖에 없는데 합쳐지는 이유는 
# mpg 데이터에서 수없이 반복되는 c,d,e,p,r을 찾아서 합치기 때문에 가능하다.
mpg1 %>% select(model,fl,price_fl) %>% head(5)
