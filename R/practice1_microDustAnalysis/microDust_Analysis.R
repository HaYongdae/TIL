install.packages("readxl")
install.packages("dplyr")
install.packages("psych")

library(readxl)
library(dplyr)
library(psych)

# 파일 불러오기
dustdata <- read_excel("C:/Users/student/Desktop/git_repository/R/data/dustData.xlsx")
str(dustdata)

# 강남구 중구만 추출
dustdata_anal <- dustdata %>% filter(area %in% c("강남구","중구"))

# 데이터 확인
count(dustdata_anal, yyyymmdd) %>% arrange(desc(n))
count(dustdata_anal, area) %>% arrange(desc(n))

# 데이터 분리
dust_anal_area_gn <- subset(dustdata_anal, area == "강남구")
dust_anal_area_jg <- subset(dustdata_anal, area == "중구")

# 기본 통계 수치 확인
describe(dust_anal_area_gn$finedust)
describe(dust_anal_area_jg$finedust)

# 박스 플롯 그리기
boxplot(dust_anal_area_gn$finedust, dust_anal_area_jg$finedust, main = "finedust_compare", xlab = "AREA",
        names = c("강남구","중구"), ylab = "FINEDUST_PM", col = c("blue","green"))

# t.test ( 분포 비교 )
t.test(data = dustdata_anal, finedust ~ area, var.equal = T)

#	Two Sample t-test

# data:  finedust by area
# t = -0.73264, df = 728, p-value = 0.464
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -4.193811  1.914359
# sample estimates:
#   mean in group 강남구   mean in group 중구 
# 34.94795             36.08767 