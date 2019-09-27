##############################################
# 가격 비교를 위한 스크래핑
# rvest 패키지 : 웹 페이지에서 필요한 정보를 추출하는데 유용한 패키지
# selectr패키지, xml2 패키지가 의존 패키지이므로 함께 설치
# read_html(url) : 지정된 url에서 html 컨텐츠를 가져옵니다.
# jsonline 패키지 : json 파서/생성기가 웹용으로 최적화되어 있는 패키지
##############################################
install.packages("jsonlite")
#install.packages("xml2")
install.packages("rvest")
install.packages("stringr")

library(jsonlite)
# libary(xml2)
library(rvest)
library(stringr)

url <- 'https://www.amazon.in/OnePlus-Mirror-Black-64GB-Memory/dp/B0756Z43QS?tag=googinhydr18418-21&tag=googinkenshoo-21&ascsubtag=aee9a916-6acd-4409-92ca-3bdbeb549f80'


#추출할 정보 : 제목, 가격, 제품 설명, 등급, 크기, 색상

#웹 사이트로부터  HTML code 읽기
webpage <- read_html(url)  
title_html <- html_nodes(webpage, 'h1#title')
title <- html_text(title_html)
head(title)

#모든 공백과 줄 바꿈 제거
title <- str_replace_all(title, "[\r\n]", "")
title <- str_trim(title)
#가격 정보 태그 가져오기
price_html <- html_nodes(webpage, 'span#priceblock_ourprice')
price <- html_text(price_html)
#모든 공백과 줄 바꿈 제거
price <-str_replace_all(price, "[\r\n]", "")
price <-str_replace_all(price, "\u20b9", "")
price <- str_trim(price)
head(price)

rate_html <- html_nodes(webpage, 'a#a-popover-trigger')

rate <- html_text(rate_html)
head(rate)