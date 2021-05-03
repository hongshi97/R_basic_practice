z <- c(1,2,NA,8,3,NA,3)
z
is.na(z)    # 변수 z의 원소 하나씩 NA면 TRUE, NA가 아니면 FALSE 출력
mean(z)     # 원소에 NA가 하나라도 있으면 mean()은 NA를 출력
mean(z,na.rm = TRUE)    #na.rm=TRUE를 통해 NA를 제거하고 평균을 구함.
                        #na.rm=TRUE를 통해 NA 원소 자체를 제거하고 1 + 2 + 8 + 3 + 3 / 5 를 구함

z <- c(1,2,NULL,8,3,NULL,3)  # null이라고 소문자라고 치면 안 된다. 대문자로 NULL !!!
z
is.null(z)   # 변수 z가 모두 NULL이면 TRUE를 출력 (z가 NULL이냐?)
mean(z)      # NULL은 아예 없다고 취급하기 때문에 mean(z)가 정상적으로 실행됨

z2 <- c(2,4,6,NULL)
mean(z2)
