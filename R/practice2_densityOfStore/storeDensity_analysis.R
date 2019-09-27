install.packages("readxl")
install.packages("dplyr")
install.packages("treemap")

library(treemap)
library(readxl)
library(dplyr)


# 파일 불러오기
storedata <- read_excel("C:/Users/student/Desktop/git_repository/R/data/storeData.xlsx")

# 동이름만 남기기
addr <- gsub(" ","",(gsub("[0-9]","",substr(storedata$소재지전체주소,11,16))))
head(addr)

# DF 생성
addr_count <- arrange(addr %>% table() %>% data.frame(), desc(Freq))
head(addr_count)

# 트리 맵 그리기
treemap(addr_count,index=".",vSize="Freq",title="서대문구 동별 치킨 분포")

