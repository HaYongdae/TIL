install.packages("KoNLP")
install.packages("wordcloud2")
library(KoNLP)
library(wordcloud2)

# 사전 설정 및 한글 처리
useSystemDic()  #시스템 사전 설정
useSejongDic()  #세종 사전 설정
useNIADic()     #NIADic 사전 설정

# 데이터 입력
word_data <- readLines("C:/Users/student/Desktop/script",encoding = "UTF-8")
word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)

# add_words <- c() - 사전에 등록되어 있지 않지만 임의로 등록할 단어 벡터 생성
# 벡터를 사전에 등록
# buildDictionary(user_dic = data.frame(add_words, rep("ncn",length(add_words))), replace_usr_dic = T)

# 메트릭스화
undata <- unlist(word_data2)
word_table <- table(undata)

# 2글자 이하 단어 제거
undata2 <- Filter(function(x) {nchar(x) >=2 }, undata)
# gsub("찾는단어","바꿀단어",찾을 대상) - 단어 제거 가능
undata2 <- gsub("[0-9]","",undata2)
undata2 <- gsub("[.,/()^\"\\?^\]-#$]","",undata2)
undata2 <- gsub("]","",undata2)
undata2 <- gsub("^","",undata2)
undata2 <- gsub("ㅋ","",undata2)
undata2 <- gsub("ㅠ","",undata2)
undata2 <- gsub(" ","",undata2)
undata2 <- gsub("[a-zA-Z]","",undata2)
undata2 <- gsub("멀캠","",undata2)
# 빈도 숫자대로 솔팅
word_table2 <- table(undata2)
sort(word_table2, decreasing = T)
class(word_table2)
str(word_table2)

wordcloud2(word_table2)
help("wordcloud2")
