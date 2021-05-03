install.packages("dplyr")
library(dplyr)

df_raw <- data.frame(var1 = c(1,2,1),var2=c(2,3,2))
df_raw

df_new <- df_raw
df_new

df_new <- rename(df_new, class = var2)   # rename()함수. 변수명을 바꿔줌. rename(데이터프레임이름, 사용할 변수명 = 변수)
df_new
