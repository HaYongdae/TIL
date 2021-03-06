#문> P2 matrix객체에서 2행과 4행을 제외하고 출력

result <- matrix(1:30, 5,5)[-c(2,4),]
result

#문> P2 matrix객체에서 1열과 3열을 제외하고 출력

result <- matrix(1:30, 5,5)[,-c(1,3)]
result


# 컬럼, 로우 이름 제거

rownames <- c("row1", "row2", "row3", "row4")
colnames <- c("col1", "col2", "col3")
matrix_hasNames <- matrix(c(3:14), nrow = 4, byrow = TRUE, dimnames = list(rownames, colnames))
rownames(matrix_hasNames)

matrix_NotHasNames <- matrix(matrix_hasNames,nrow(matrix_hasNames), ncol(matrix_hasNames),F, dimnames(NULL))
rownames(matrix_NotHasNames)

matrix_ <- matrix(c(3:14), nrow = 4, byrow = TRUE)
rownames(matrix_)

#문 > list 중 k3에 저장된 세번째 요소만 출력
list_data <- list(k1="RED",k2="Green",k3=c(21,32,11),k4=TRUE,k5=51.23,k6=119.1)
list_data$k3[3]

#문>
exam1<- list(1,0, 2,0, -3, 4, -5, 6, 7, -8, 9, 10)
#exam1로부터 음수를 제거한 리스트 출력
result = ifelse(exam1 > 0, exam1, exam1 <- NULL)
result = exam1[exam1 > 0]
#exam1로부터 0를 제거한 리스트 출력
result = exam1[exam1 != 0]
result

# 문)df1 데이터 프레임에서 가격이 150보다 작은 데이터들 출력
result1 <- subset(df2, df2$Price < 150)
result1
# 문)df1 데이터 프레임에서 과일명이 바나나인것만  data.frame 구조로  출력
result2 <- subset(df2, df2$Fruit == 'Banana')
result2

df2<-data.frame(x=c(1:5), 
                y=seq(2, 10, 2), 
                z=c('a', 'b', 'c', 'd', 'e'))
df2
#문) df2 데이터프레임객체의 x컬럼의 값이 2이상이고  y컬럼은 6이하인 데이터들로 구성된 데이터프레임 부분집합 생성
# result3 <- subset(subset(df2, df2$x >2), df2$y < 6)
result3 <- subset(df2, x >= 2 & y <=6)
#문> df2 데이터프레임객체의 x컬럼의 값이 2이상 또는  y컬럼은 6이하인 데이터들로 구성된 데이터프레임 부분집합 생성
result4 <- subset(df2, x >= 2 | y <=6)

#데이터 프레임에서 특정 컬럼만 추출해서 새로운 형태의 데이터프레임 생성
df5 <- subset(df1, select=c( Fruit, Price, Qty))
str(df5)
print(df5)

df6 <- subset(df1, select=-No)
str(df6)
print(df6) 



emp.data <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
  salary = c(623.3,515.2,611.0,729.0,843.25), 
  
  start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11",
                         "2015-03-27")),
  stringsAsFactors = FALSE
)
print(emp.data) 
str(emp.data)
#문> emp.data객체에서  3행, 5행의 2열과 4열의 데이터만 추출해서 출력
result5 = emp.data[c(3,5),c(2,4)]
result5


#문> str1 <-"korea123456-1234567seoul" 에서 주민번호만 추출
str1 <-"korea123456-1234567seoul"
result <- str_extract(str1, "[1-9]{6}-[1-9%]{7}")
result

#문> str2 <- "홍길동1357,이순신,유관순1012" 에서 7글자 이상 단어만 추출
str2 <- c("홍길동1357","이순신","유관순1012")
result2 <- str_subset(str2, "[가-힣0-9]{7}")



data <- read.csv("C:/Users/student/Desktop/datafile-II/datafile-II/emp3.csv")
#문) emp3.csv파일의 데이터를 data.frame객체에 저장한 후에
#IT부서에서 급여가 600이상인 사원 추출
result <- subset(data, data$sal > 600 & data$dept == "IT" )
result
##문) emp3.csv파일의 데이터를 data.frame객체에 저장한 후에
#입사날자가 2014년 7월 01일 이후인 사원추출
data$startdate <- as.Date(data$startdate)
result2 <- subset(data, data$startdate > '2014-07-01')
result2

itPerson <- subset(data, data$dept == 'IT')

write.csv(itPerson, "./itperson.csv", row.names = F)
loadTest <- read.csv("./itperson.csv")



#문> 사용자로부터 표준입력으로 점수를 입력받아서 학점을 출력하시오
#if(조건) { 실행문 } else if(조건) { 실행문장 }....else{실행문장}

score <- scan()
#점수 입력
#엔터
if(score>=90){
  result ="A학점"
}else if(score>=80){
  result ="B학점"
}else if(score>=70){
  result ="C학점"
}else if(score>=60){
  result ="D학점"
}else {
  result ="F학점"
}
cat("점수 ",score,"의 학점은 ", result)

# ifelse(조건식, 참인 경우 처리문, 거짓인 경우 처리문)
#문) 사용자로부터 표준입력으로 정수를 입력받아서 짝수 또는 홀수 평가결과를 출력하시오
result <- ifelse(score%%2==0, "짝수","홀수")
cat(score,"는 ", result,"입니다")

########################################################################

no<-c(1:5)
name <- c("홍길동", "이순신", "강감찬", "유관순", "김유신")
score <-c(85,90,78,74,80)
exam <- data.frame(학번=no, 이름=name, 성적=score)
# 문> which함수를 사용해서 유관순의 학번, 이름, 성적을 출력
exam[which(exam$이름 == "유관순"),]

########################################################################


# 문1> 함수 정의하시오 (매개변수는 정수1개, 매개변수가 0이면 0을 반환
#                   0이 아니면 매개변수의 2배의 값 반환)

f4 <- function(x) {
  if(x == 0) {
    return(0)
  }else {
    return(x*2)
  }
}
print(f4(0))
print(f4(3))
print(f4(-3))


########################################################################

#문> 함수를 정의하시오 (첫번째 매개변수는 벡터객체, 
#                 두번째 매개변수는 함수타입 - mean, sum, median을 문자열로 입력받아서
#                 mean인경우 벡터의 평균을 반환, sum은 벡터 요소의 합계 반환
#                 median은 벡터 요소의 중앙값 반환)




install.packages("dplyr")
library("dplyr")

install.packages("hflights")
library(hflights)
#2011년도 미국 휴스턴 출발 모든 비행기의 이착률 정보 기록
#대략 22만건, 21개의 변수(컬럼)로 구성된 데이터셋
str(hflights)
flights_df <- tbl_df(hflights) #현재 R콘솔 창크기에서 볼수 있는 만큼 10개행? 8개 컬럼?
flights_df

#hflights데이터셋으로부터 1월의 2일 모든 비행기의 이착률 정보 추출
filter(flights_df, Month == 1 & DayofMonth == 2)

#hflights데이터셋을 년, 월, 출발시간, 도착시간순으로 오름차순 정렬
arrange(flights_df, Year, Month,DepTime, ArrTime)


#hflights데이터셋을 년(오름차순), 월(오름차순), 출발시간(내림차순), 도착시간(오름차순) 정렬
arrange(flights_df, Year, Month,desc(DepTime), desc(ArrTime))

#hflights데이터셋으로부터 년, 월, 출발시간, 도착시간 컬럼만 검색
flights_df %>% select(Year, Month, DepTime, ArrTime)


#hflights데이터셋으로부터 출발지연시간과 도착지연시간과의 차리를 계산한 컬럼 추가
mutate(flights_df, gap_Time = (ArrTime) - (DepTime) %/% 60)

#hflights데이터셋으로부터 도착 시간에 대한 평균, 표준편차 계산
summarize(flights_df,cnt = n(), avg_arr_Time = mean(ArrTime, na.rm = T))
summarize(flights_df, arrTimeSD = sd(ArrTime, na.rm = T), arrTimeVAR = var(ArrTime, na.rm = T))


sub_time <- select((flights_df %>% mutate(arr_dep =ArrDelay - DepDelay)),arr_dep)
print(sub_time)
sub_time_sel <- flights_df %>% select(arr_dep)

install.packages("ggplot2")
library(ggplot2)
#자동차 배기량에 따라 고속도록 연비 ...데이터 셋
mpg <- as.data.frame(ggplot2::mpg)
print(mpg)
str(mpg)
#displ 배기량
#manufaturer 제조사
#cty 도시연비
#hwy 고속도로 연비
#class차종
library(dplyr)

table(mpg$class)

#Quiz> 회사별로 분리, suv 추출, 통합 연비(도시연비+고속도로 연비) 변수 생성, 
#통합 연비 평균 산출, 내림차순 정렬, 1~5위까지 출력
mpg %>% group_by(manufacturer) %>% filter(class == "suv") %>% mutate(total_y = (cty + hwy)/2) %>%summarise(mean(total_y)) %>% arrange() %>% head()

#Quiz> 어떤 회사에서 "compact"(경차) 차종을 가장 많이 생산하는지 알아보려고 합니다. 
#각 회사별로 "compact" 차종을 내림차순으로 정렬해 출력하세요
mpg %>% filter(class == "compact") %>% group_by(manufacturer) %>% summarise(count =n()) %>% arrange(desc(count))


#Indometh 데이터셋으로부터 subject와 time을 구분변수로 long 형식으로 변환


#Indometh 데이터셋으로부터 subject구분변수로 특정변수 농도의 합계 통계량 계산


#Indometh 데이터셋으로부터 subject구분변수로 특정변수 농도의 평균, 최소값~최대값 범위를 계산