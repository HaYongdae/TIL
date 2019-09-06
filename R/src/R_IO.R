######################## FILE IO EX #########################

#현재 working directory출력
getwd()
#현재 working directory의 파일 목록 출력
print(list.files())
print(list.files(recursive = T)) 
print(list.files(all.files = T)) # 모든 파일을 다 보여준다.
file.choose() # 파일 탐색기 실행
# read.xlsx(file.choose(),sheetIndex=1,encoding="UTF-8")

###### I

## EXCEL 파일

install.packages("xlsx")   
install.packages("rJava")   # rJava(xlsx 의 상위 패키지) 패키지 설치 

install.packages("readxl")

library(xlsx)
library(rJava)

library(readxl)


excel_data_ex <- read_excel("경로", (sheet = n))
choosing_excel_data <- read.xlsx(file.choose(),sheetIndex=1, encoding="UTF-8")

##TXT

################################################
#텍스트파일 읽기 readLines(), read.table()
################################################
#아래 내용을 메모장에 작성해서 작업디렉토리의 datas디렉토리 아래 fruits.txt로 저장하세요
#no  name  price   qty  
#1   apple   500     5  
#2   banana  200     2  
#3   peach   200     7  
#4   berry    50     9  

# 텍스트 파일 읽기, 라인 단위를 문자열로 로딩, 라인단위로 저장되는 벡터 객체로 생성함
file1 <- readLines("./data/fruits.txt")  
print(file1)
str(file1)

#텍스트 파일의 내용을 읽어서 data.frame객체로 생성함
data <- read.table("경로/파일") 
data <- read.table("경로/파일", header=T)
data <- read.table("경로/파일", header=T, stringsAsFactor=FALSE)
data <- read.table("경로/파일", header=T, skip = n부터, nrows = n까지, sep="구분자" col.names = "이름 백터")

###### O

## SAVE, LOAD

save(데이터, file ="저장할 파일명.rda")
load("경로명")
write.csv(데이터, file = "파일명.csv")
write.table(데이터, file = "파일명.txt")

######################################################