# reshape2 패키지

> 데이터 셋의 구성이 구분변수(identifier variable)에 의해서 특정 변수가 분류된 경우 
> 데이터 셋의 모댱을 변경하는 패키지
> 구분변수(identifier variable) : 데이터 셋에 1개 이상으로 분류되는 집단변수
> 측정변수(measured variable): 구분변수에 의해서 구분되는 변수

```R
#reshape(), melt() : 구분변수를 기준으로 측정변수를 분류하여 새로운 컬럼을 생성
reshape(data.frame, varying="반복되는 측정 색인",
        v.names="반복되는 측정값", timevar="반복되는 측정 시간",
        idvar="1개 이상의 값으로 분류되는 변수", direction="wide/long")
#wide는 기준변수와 관련 변수가 1:n 관계로 관측치가 구성
#long은 기준변수와 관련 변수가 1:1 관계로 관측치가 구성
################################################################
```

## 0. 로드 

```R
install.packages("reshape")
library(reshape)
```



## 1. 함수 (reshape2::)

| 함수   | 기능              | 함수   | 기능              |
| ------ | ----------------- | ------ | ----------------- |
| melt() | 가로 => 세로 행렬 | cast() | 세로 => 가로 행렬 |



### 1-1. melt 함수

- 가로 데이터를 세로 데이터로 변환
- Data.frame, list, array에 사용 가능 (주로 DF에 적용)

```R
# DataFrame 적용 방법

melting_DF <- melt(데이터, id.var = "기준 col", measure.vars = "변환 col")

# EX_

head(airquality)

#   ozone solar.r wind temp month day
# 1    41     190  7.4   67     5   1
# 2    36     118  8.0   72     5   2
# 3    12     149 12.6   74     5   3
# 4    18     313 11.5   62     5   4
# 5    NA      NA 14.3   56     5   5
# 6    28      NA 14.9   66     5   6


install.packages("reshape2")
library(reshape2)

names(airquality) <- tolower(names(airquality))

melt_test2 <- melt(airquality, id.vars = c("month","wind"), measure.vars = "ozone")
head(melt_test2)

#   month wind variable value
# 1     5  7.4    ozone    41
# 2     5  8.0    ozone    36
# 3     5 12.6    ozone    12
# 4     5 11.5    ozone    18
# 5     5 14.3    ozone    NA
# 6     5 14.9    ozone    28
```

----



### 1-2. cast 함수

- 세로 데이터를 가로로 전환
- dcast(DF에 대하여 melt 반대로 작용) acast(특정 컬럼 기준으로 데이터를 나눠줌)



#### 1-2-1. dcast 함수

```R
# DataFrame 적용 방법

dcast(데이터, 기준 열 ~ 변환 열)
acast(데이터, y축 ~ x축 ~ 변환 열, 집계함수)

# melt를 역으로 풀어가는 과정


# ---------------- melt 과정
install.packages("reshape2")
library(reshape2)

names(airquality) <- tolower(names(airquality))

aq_melt <- melt(airquality, id.vars = c("month","wind"), na.rm = TRUE)
head(melt_test2)
#   month wind variable value
# 1     5  7.4    ozone    41
# 2     5  8.0    ozone    36
# 3     5 12.6    ozone    12
# 4     5 11.5    ozone    18
# 5     5 14.3    ozone    NA
# 6     5 14.9    ozone    28

#----------------------------#


# ------------------- dcast 과정

aq_dcast <- dcast(aq_melt, month + day ~ variable)
head(aq_dcast)

#   month day ozone solar.r wind temp
# 1     5   1    41     190  7.4   67
# 2     5   2    36     118  8.0   72
# 3     5   3    12     149 12.6   74
# 4     5   4    18     313 11.5   62
# 5     5   5    NA      NA 14.3   56
# 6     5   6    28      NA 14.9   66

#----------------------------#


# -------------------- acast과정

acast(aq_melt, day ~ month ~ variable)
# y축을 day, x축을 month로 하는 variable별 테이블 반환

acast(aq_melt, month ~ variable, mean)

#      ozone  solar.r      wind     temp
# 5 23.61538 181.2963 11.622581 65.54839
# 6 29.44444 190.1667 10.266667 79.10000
# 7 59.11538 216.4839  8.941935 83.90323
# 8 59.96154 171.8571  8.793548 83.96774
# 9 31.44828 167.4333 10.180000 76.90000

acast(aq_melt, month ~ variable, sum)

#   ozone solar.r  wind temp
# 5   614    4895 360.3 2032
# 6   265    5705 308.0 2373
# 7  1537    6711 277.2 2601
# 8  1559    4812 272.6 2603
# 9   912    5023 305.4 2307

# 집계함수 사용 - month를 기준으로 데이 값들이 모두 합산되어 반환

# ------------------------------#

###################################################################
```



