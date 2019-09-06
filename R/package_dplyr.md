# dplyr 패키지

> 데이터 정제를 돕는 패키지



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



### 1-2. 데이터 추출

```R
# filter
# 조건 선택
filter(mtcars, cyl == 4)
filter(mtcars, cyl >=6 & mpg > 20)

# select
# 칼럼 선택
select(mtcars, am, gear)
```



### 1-3. 데이터 정렬

```R
# arrange(데이터, 컬럼1, 컬럼2, ...) 
# default는 오름차순
arrange(mtcars, wt, ...)
# 내림차순
arrange(mtcars, desc(wt), ...) 
```



### 1-4. 데이터 추가

```R
#mutate

```

