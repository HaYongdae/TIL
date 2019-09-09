######################## FILE IO EX #########################

#현재 working directory출력
getwd()
#현재 working directory의 파일 목록 출력
print(list.files())
print(list.files(recursive = T)) 
print(list.files(all.files = T)) # 모든 파일을 다 보여준다.
file.choose() # 파일 탐색기 실행
# read.xlsx(file.choose(),sheetIndex=1,encoding="UTF-8")

################################################
# input
################################################

###
# EXCEL 파일
################################################

install.packages("xlsx")   
install.packages("rJava")   # rJava(xlsx 의 상위 패키지) 패키지 설치 

install.packages("readxl")

library(xlsx)
library(rJava)

library(readxl)


excel_data_ex <- read_excel("경로", (sheet = n))
choosing_excel_data <- read.xlsx(file.choose(),sheetIndex=1, encoding="UTF-8")

###
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
data <- read.table("경로/파일", header=T, skip = n부터, nrows = n까지, sep="구분자", col.names = "이름 백터")


###
# XML데이터
################################################

install.packages("XML")
library(XML)


data2 <- xmlParse(file = "C:/Users/student/Desktop/git_repository/R/data/employees.xml")

print(data2)

#Root NODE만 추출
rootnode <- xmlRoot(data2)
#ROOT NODE 자식 노드 갯수
rootSize <-xmlSize(rootnode)
rootnode[1]
rootnode[[1]][[3]]

#xml을 R의 지원형식인 data.frame 으로 로딩
xmldataframe <- xmlToDataFrame("C:/Users/student/Desktop/git_repository/R/data/employees.xml" ,stringsAsFactors=FALSE)
str(xmldataframe)

###
# JSON 데이터
################################################

install.packages("rjson")
library(rjson)

jsonEmp <- fromJSON(file = "C:/Users/student/Desktop/git_repository/R/data/employees2.json")

# dataframe 변환
emp.dataframe <- as.data.frame(jsonEmp)

# 저장
result <- toJSON(emp.dataframe)
write(result, "C:/Users/student/Desktop/git_repository/R/data/employees2.json")
list.files("C:/Users/student/Desktop/git_repository/R/data/")

###
# HTML 데이터
################################################

# httr 패키지는 지정한 url의 HTML소스를 가져오는 GET() 함수를 제공하고
# <table> 태그의 내용을 읽어올 수 있는 readHTMLTable()함수를 제공합니다.
# readHTMLTable()에 사용되는 속성 
# - get_url$content  : GET(url)함수에 의해서 가져온 HTML소스의 내용
# - rawToChar() : 바이너리(binary) 소스를 HTML 태그로 변환
# - stringsAsFactors = F : 문자열을 요인으로 처리하지 않고 순수한 문자열로 가져오기

# https://ssti.org/blog/useful-stats-capita-personal-income-state-2010-2015

install.packages("httr")
library(httr)

url <- "https://ssti.org/blog/useful-stats-capita-personal-income-state-2010-2015"
get_url <- GET(url)
html_cont <- readHTMLTable(rawToChar(get_url$content), stringsAsFactors=FALSE)
str(html_cont)
View(html_cont)
html_cont.dataframe <- as.data.frame(html_cont)
str(html_cont.dataframe)

## 컬럼의 이름에 NULL이 붙기 때문에 변경해준다. (이 과정을 생략하는 방법은 ??)
names(html_cont.dataframe) <- c("State", "y2010", "y2011","y2012", "y2013", "y2014", "y2015")
str(html_cont.dataframe)


###
# sink()로 열기 - 명령어의 내역이 모두 자동 저장된다.
################################################

sink("C:/Users/student/Desktop/git_repository/R/data/data.csv", "a")
url <- "https://ssti.org/blog/useful-stats-capita-personal-income-state-2010-2015"
get_url <- GET(url)
html_cont <- readHTMLTable(rawToChar(get_url$content), stringsAsFactors = F)
str(html_cont)
class(html_cont)
print(html_cont)
html_cont <- as.data.frame(html_cont)
head(html_cont)
str(html_cont)
class(html_cont)
names(html_cont) <- c("State", "y2010", "y2011","y2012", "y2013", "y2014", "y2015")
tail(html_cont)
sink()             #오픈된 파일 close

###
# write.table() - R 스크립트에서 처리된 결과를 테이블 형식으로 저장할 수 있는 함수
# - row.names :  행번호를 제거하는 속성
# - quote :  따옴표 제거
###############################################################
library(xlsx)
studentx <-read.xlsx(file.choose(), sheetIndex=1, encoding="UTF-8")
print(studentx)
str(studentx)
class(studentx)
write.table(studentx, "C:/Users/student/Desktop/git_repository/R/data/student1.txt")   #행번호, 따옴표 출력?
write.table(studentx, "C:/Users/student/Desktop/git_repository/R/data/student2.txt", row.names = FALSE, quote=FALSE) 
data <- read.table("C:/Users/student/Desktop/git_repository/R/data/student2.txt", stringsAsFactors = FALSE)
data1 <- read.table("C:/Users/student/Desktop/git_repository/R/data/student1.txt", stringsAsFactors = FALSE)

str(data1)

################################################
# output
################################################

## SAVE, LOAD

save(데이터, file ="저장할 파일명.rda")
load("경로명")
write.csv(데이터, file = "파일명.csv")
write.table(데이터, file = "파일명.txt")

######################################################

