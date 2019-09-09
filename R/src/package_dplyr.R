install.packages("dplyr")
library(dplyr)


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

sample_n(mtcars, 10)
sample_frac(mtcars, 1, replace = TRUE)


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

# 데이터 요약 ( summarise 함수 실습)

summarise(mtcars, cyl_mean = mean(cyl), cyl_min = min(cyl), cyl_max = max(cyl))

# -> summarise 를 group_by 옵션으로 실행하기
gr_cyl<- group_by(mtcars, cyl)
summarise(gr_cyl, n())

# distinct 함수 실습

distinct(mtcars, cyl)

