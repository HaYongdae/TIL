######################## FILE IO EX #########################

###### I

## EXCEL
install.packages("readxl")
library(readxl)

excel_data_ex <- read_excel("경로", (sheet = n))
View(excel_data_ex)


##TXT

data <- read.table("경로",header = T/F, skip = n부터, nrows = n까지, sep="구분자" col.names = "이름 백터")

###### O

## SAVE, LOAD

save(데이터, file ="저장할 파일명.rda")
load("경로명")
write.csv(데이터, file = "파일명.csv")
write.table(데이터, file = "파일명.txt")
