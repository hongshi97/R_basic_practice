df <- data.frame(var1 = c(4,3,8), var2 = c(2,6,1))
df

df$var_sum <- df$var1 + df$var2   # var1과 var2를 더한 var_sum 변수를 생성하여 df 데이터 프레임에 저장
df

df$var_mean <- (df$var1 + df$var2)/2  # var1과 var2를 더한 후 나눠 var_mean 변수를 생성하여 df 데이터 프레임에 저장장
df


df2 <- data.frame(v1 <- c(1,2,3), v2 <- c("A","B"))  # 추가로 해본 거. 데이터 프레임의 변수의 데이터 개수는 같아야 한다!!!