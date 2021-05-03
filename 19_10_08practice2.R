### 결과값 예측해보기. 결과값 예측하는거 작년 시험에 나왔음 ###
for ( i in 1:9) {
 result = i * 3
 print(result)
}

x <- c(1,3,5,7,9)
for (i in x){
  print(i)
}

x <- 1
while(1){               # 1은 TRUE에 해당. while(1)은 break가 없다면 무한 실행. (무한 루프가 생성됨)
x <- 2*x                # 맨 처음 과정: x에 초기값으로 설정해 둔 1이 대입됨. 새로운 x로 2*1의 결과인 2가 저장.
print(x)
if(x>100) break         # x가 100보다 크면 반복을 Break(중단)하고 빠져나옴 break는 현재 수행 중인 
}                       # 루프를 중단하고 나가게 함
                        # 이 코드에서는 x가 128일 때 break 전에 print(x)가 있으므로 128을 프린트하고 
                        # if(x>100)을 만나서break하게 됨

i = 1                   # 더하기에서는 초기값을 보통 0으로, 곱셈에서는 1로 설정한다.
repeat{
  result = 2*i
  print(result)
  if(i>=9) break        # i >= 9 이면 break 해라. R에서는 if문을 이렇게 한 줄에 이어서 쓸 수도 있다.
  i = i + 1             # if(i>=9)에 FALSE라면 i = i + 1 실행하고 다시 result = 2*i로 돌아감
}