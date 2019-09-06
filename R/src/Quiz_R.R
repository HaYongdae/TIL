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