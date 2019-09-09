## Input data

install.packages("xlsx")   
library(xlsx)

dataOfDust <- read.xlsx("C:/Users/student/Desktop/git_repository/R/data/dustData.xlsx",sheetIndex=1, encoding="UTF-8")


## cleaning of memory

rm(list = ls()) # 메모리에 로드된 변수 all remove


## data view

View(dataOfDust) # 자료 내역
str(dataOfDust) # 자료 형태
dim(dataOfDust) # 자료 차원
ls(dataOfDust) # 자료 데이터셋 (컬럼)

## change name of dataSet (col)

install.packages("dplyr")
library(dplyr)

changed_dataOfDust <- rename(dataOfDust, microdust = finedust)
str(changed_dataOfDust)

## 파생변수 생성 
# - 새로운 컬럼 <- 기존컬럼1 연산자 기존컬럼2

changed_dataOfDust$microdustX2 <- changed_dataOfDust$microdust + changed_dataOfDust$microdust
changed_dataOfDust$microdustX2 <- changed_dataOfDust$microdust * 2

# - 새로운 컬럼 <- 조건문(조건식 , T일 때 "대체값", F일 때 "대체값")

#if 구문
x<-3
y<-5
if(x*y >= 30) {
  cat("x*y의 결과는 30이상입니다.\n")
}else {
  cat("x*y의 결과는 30미만입니다.\n")
}

# ifelse 구문
changed_dataOfDust$warning2 <- ifelse(changed_dataOfDust$microdust >= 50, "Red", ifelse(changed_dataOfDust$microdust >= 40, "Yellow", ifelse(changed_dataOfDust$microdust >=30, "blue", ifelse(changed_dataOfDust$microdust >=20, "green", "nothing"))))

#switch (비교문, 실행문1, 실행문2, 실행문3,...)
#비교문의 변수의 값이 실행문에 있는 변수와 일치할때 , 해당 변수에 할당된 값이 출력됩니다.

#사원이름을 입력 받아서 해당 사원의 급여 출력
ename <- scan(what="") # hong 입력
switch(ename, hong=250, lee=300, park=350, kim=200) # 250 출력

#which 구문
names <- c("kim", "lee", "choi", "park")
which(names == "choi")

#for문도 사용가능 for ( n in i ) - continue에 해당하는 명령어는 next!!
i <- c(1:10)
for (n in i)
  if(n%%2 ==0) print(n)

#데이터 프레임에서 컬럼명 추출, 출력
name <- c(names(exam))
for (n in name) 
  print(n)

#while문으로 짝수 출력
# repeat { 반복 수행문장 ; 반복문 탈출할 조건문; 증감식 }
# repeat문으로 짝수 출력