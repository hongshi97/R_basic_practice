install.packages("readxl")
library(readxl)

df_exam <- read_excel("excel_exam.xlsx")   # read_excel()함수는 readxl 패키지 안에 내장된 함수
df_exam

mean(df_exam$english)    # 데이터프레임명$변수명  형태. 달러$ 표시 뒤에는 불러오고 싶은 데이터 프레임의 변수명!!! df_exam$english는 df_exam[["english]]와 동일
mean(df_exam$science)    # df_exam이라는 데이터 프레임에서 science 변수를 불러와서 그 변수 안에 있는 값들의 평균을 구함
                         
df_exam_novar <- read_excel("excel_exam_novar.xlsx",col_names = F) #col_names = F를 안 써주면 자동으로 첫번째 행이 변수명이 됨.
df_exam_novar

df_exam_novar2 <- read_excel("excel_exam_novar.xlsx") #col_names=F를 안 써주면 첫 번째 행이 변수명으로 사용 됨.
df_exam_novar2

df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)  # sheet=3을 써주면 3번째 시트에 있는 데이터를 불러옴
df_exam_sheet

df_exam_sheet2 <- read_excel("excel_exam_sheet.xlsx") # sheet =3 이라고 지정 안 해주면 자동으로 sheet=1에서 가져오는 듯.
df_exam_sheet2                                        # "excel_exam_sheet.xslx" 파일의 첫 번째 시트는 빈 시트임.

df_csv_exam <- read.csv("csv_exam.csv")  # read.csv() 함수, read_excel()함수 구분!!! csv 불러올 때는 사이에 . excel 불러올 때에는 사이에 _ 사용
df_csv_exam

df_csv_exam <- read.csv("csv_exam.csv", stringsAsFactors = F)  # stringsAsFacotrs = F 를 안 써주면 데이터프레임에서는 문자를 자동으로 factor로 읽어옴.
df_csv_exam                                                    # stringsAsFactors = F 를 써주면 factor가 아닌 문자형으로 가져옴.

df_midterm <- data.frame(english=c(90,80,60,70), math=c(50,60,100,20),class=c(1,1,2,2)) 
#변수가 3개(english,math,class), observation은 4개인 데이터 프레임을 만듦
df_midterm    

df_midterm2 <- data.frame(english=c(90,80,60,70), math=c(50,60,20),class=c(1,1,2,2)) 
#data.frame() 함수를 이용해 데이터 프레임을 만들 때 각 변수의 데이터 개수가 다르면 오류 발생

write.csv(df_midterm, file="df_midterm.csv") 
# write.csv()함수. csv파일로 저장히는 함수. 첫번째 인자는 저장할 변수의 이름. file = 에는 어떤 이름으로 파일을 저장할지. 
# Working Directory가 아닌 다른 곳에 저장하려면 절대  경로를 써주면 됨. ex) "C:/Users/hongs/OneDrive/Notability"
# R에서는 경로 설정할 때 C:\Users\hongs\OneDrive\Notability와 같이 \ 기호가 아닌 /나 \\를 사용한다.
# 절대 경로 설정할 때 경로 안에 한글 이름 들어가면 오류 발생의 원인이 된다.

df_csv_midterm <- read.csv("df_midterm.csv")
df_csv_midterm

