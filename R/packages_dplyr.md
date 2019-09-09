# dplyr 패키지

> 데이터 정제를 돕는 패키지
>
> SQL 구문과 흡수한 메소드들을 사용한다.



## 1. 함수 (dplyr::)

| 함수명      | 기능                | 함수명        | 기능                      |
| ----------- | ------------------- | ------------- | ------------------------- |
| filter()    | 조건에 맞는 행 추출 | distinct()    | 중복 값 제거              |
| arrange()   | 지정 열 기준 정렬   | group_by()    | 데이터 그룹 생성          |
| select()    | 열 추출             | sample_n()    | n개의 샘플 추출           |
| mutate()    | 열 추가             | sample_frac() | n% 비율의 샘플 추출       |
| summarize() | 데이터 요약         | %>%           | 파피프 연산자, 함수 연결  |
|             |                     | %in%          | 컬럼 탐색 조건 %in% c("") |

### 1-1. 로드

```R
install.packages("dplyr")
library(dplyr)
```

---



### 1-2. 데이터 추출

```R
##########################################
# filter
# 조건 선택
##########################################
filter(mtcars, cyl == 4)
filter(mtcars, cyl >=6 & mpg > 20)

#    mpg cyl disp  hp drat    wt  qsec vs am gear carb
# 1 21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
# 2 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
# 3 21.4   6  258 110 3.08 3.215 19.44  1  0    3    1

##########################################
# select
# 칼럼 선택 (-)제외 옵션도 가능
##########################################

filter(mtcars, cyl >=6 & mpg > 20) %>% select(gear)

# gear
# 1    4
# 2    4
# 3    3


##########################################
# sample_n(), sample_frac()
# 개수, 비율 기준으로 셈플 데이터를 추출
##########################################

sample_n(mtcars, 10(뽑아낼 개수))
sample.frac(데이터, 뽑아낼 데이터의 비율(1%면 1입력), replace = T/F)
```

---



### 1-3. 데이터 요약

> - group_by(컬럼) 후에 summarise()
>
> - distinct()로 값의 범주 탐색 가능

```R
# summarize(데이터, 요약 결과 저장 열이름 = 통계함수)

summarise(mtcars, cyl_mean = mean(cyl), cyl_min = min(cyl), cyl_max = max(cyl))

#   cyl_mean cyl_min cyl_max
# 1   6.1875       4       8


# group_by로 컬럼별 묶어 통계 계산
# -> summarise 를 group_by 옵션으로 실행하기

gr_cyl<- group_by(mtcars, cyl)
summarise(gr_cyl, n())

#  A tibble: 3 x 2
#     cyl `n()`
#   <dbl> <int>
# 1     4    11
# 2     6     7
# 3     8    14
```

#### 1-3-1. summarise()의 종류

| 함수       | 기능   |
| ---------- | ------ |
| n()        | 빈도   |
| min()      | 최솟값 |
| max()      | 최대값 |
| quantile() | 분위수 |
| sum()      | 합계   |
| mean()     | 평균   |

```R
# data %>% group_by(컬럼) %>% summarise(새로운 컬럼명 = 집계함수(기존 컬럼))
data %>% group_by(AREA) %>% summarise(SUM_Y17_AMT = sum(Y17_AMT))
```



#### 1-3-2. distinct 함수

```R
distinct(mtcars, cyl)

# cyl
# 1   6
# 2   4
# 3   8
```

---



### 1-4. 데이터 정렬

```R
# arrange(데이터, 컬럼1, 컬럼2, ...) 
# default는 오름차순
arrange(mtcars, wt, ...)
# 내림차순
arrange(mtcars, desc(wt), ...) 
```

---



### 1-5. 데이터 추가(열)

```R
#mutate(데이터, 추가할 열 이름 = 조건1, ...)

head(mutate(mtcars, years = "1974"))

# years 컬럼 추가

#    mpg cyl disp  hp drat    wt  qsec vs am gear carb years
# 1 21.0   6  160 110 3.90 2.620 16.46  0  1    4    4  1974
# 2 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4  1974
# 3 22.8   4  108  93 3.85 2.320 18.61  1  1    4    1  1974
# 4 21.4   6  258 110 3.08 3.215 19.44  1  0    3    1  1974
# 5 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2  1974
# 6 18.1   6  225 105 2.76 3.460 20.22  1  0    3    1  1974


head(mutate(mtcars, mpg_rank = rank(mpg)))

#    mpg cyl disp  hp drat    wt  qsec vs am gear carb mpg_rank
# 1 21.0   6  160 110 3.90 2.620 16.46  0  1    4    4     19.5
# 2 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4     19.5
# 3 22.8   4  108  93 3.85 2.320 18.61  1  1    4    1     24.5
# 4 21.4   6  258 110 3.08 3.215 19.44  1  0    3    1     21.5
# 5 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2     15.0
# 6 18.1   6  225 105 2.76 3.460 20.22  1  0    3    1     14.0
```

---



### 1-6. 데이터 병합(행)

```R
# 세로 결합
# bind_rows(데이터1, 데이터2)

# 가로 결합
# left_join(데이터1, 데이터2, by="컬럼명")
# inner_join(데이터1, 데이터2, by="컬럼명")
# full_join(데이터1, 데이터2, by="컬럼명")
```



