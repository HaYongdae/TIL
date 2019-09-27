# R_Scraping

> 웹에서 데이터 가져오기

## package

```R
install.packages('rvest')
library(rvest)
```

> rvest 패키지



### 1. 사용 방법

```R
#########################################################################################
# read_html() : url에서 html 파일을 읽어오고 저장한다.
# html_table() :  테이블추출
# html_node()는 매칭되는 한 요소만 반환하고, 
# html_nodes()는 모든 요소를 반환한다.
# id를 찾을 경우에는 html_node()를 사용하면 되고, tag, class로 같은 요소를 모두 추출하고자 할 경우에 는 html_nodes()를 사용하면 된다 
# html_names()는 attribute의 이름을 가져온다.    
# ex) <img src="...." >
# html_chidren() 해당 요소의 하위 요소를 읽어온다.
# html_tag() tag이름 추출한다.
# html_attrs() attribute을 추출한다.
#########################################################################################
```



# 실습 1.

### 1. 홈페이지 지정

```R
#스크래핑할 웹 사이트 URL을 변수에 저장
url <- 'http://www.imdb.com/search/title?count=100&release_date=2016,2016&title_type=feature'

webpage <- read_html(url)  
```



### 2. 필요 노드 추출하기 (2016년 박스오피스 랭킹 100)

```R
## 랭킹
#랭킹이 포함된 CSS selector를 찾아서 R 코드로 가져오기
rank_data_html <- html_nodes(webpage,'.text-primary')

#랭킹 데이터를 텍스트로 가져오기
rank_data <- html_text(rank_data_html)
head(rank_data)

#랭킹 데이터를 수치형 데이터로 변환
rank_data<-as.numeric(rank_data) 
head(rank_data)
#str(rank_data)
#length(rank_data)


## 제목
#제목을 CSS selector를 찾아서 R 코드로 가져오기
title_data_html <- html_nodes(webpage,'.lister-item-header a')

#제목 데이터를 텍스트로 가져오기
title_data <- html_text(title_data_html)
str(title_data)

## 설명
#설명을 CSS selector를 찾아서 R 코드로 가져오기 <바로 앞의 div 태그 class + p 태그의 class 설정>
desc_data_html <- html_nodes(webpage,'.ratings-bar+.text-muted')

#install.packages("stringr")
library(stringr)
#설명 데이터를 텍스트로 가져오기
desc_data <- html_text(desc_data_html)
desc_data <- gsub("\n","",desc_data)
desc_data <- str_trim(desc_data)
str(desc_data)


## 런타임
#런타임을 CSS selector를 찾아서 R 코드로 가져오기
rt_data_html <- html_nodes(webpage,'.runtime')

#런타임 데이터를 텍스트로 가져오기
rt_data <- html_text(rt_data_html)
rt_data <- gsub(" min","",rt_data)
rt_data <- gsub(",","",rt_data)
str(rt_data)

## 장르
#장르을 CSS selector를 찾아서 R 코드로 가져오기
genre_data_html <- html_nodes(webpage,'.genre')

#장르 데이터를 텍스트로 가져오기
genre_data <- html_text(genre_data_html)
genre_data <- gsub("\n","",genre_data)
genre_data <- str_trim(genre_data)

# 장르에서 ,뒤의 .(텍스트) *(여러개)를 지워버려라
genre_data <- gsub(",.*","",genre_data)

genre_data <- as.factor(genre_data)
str(genre_data)


## 평점
#평점을 CSS selector를 찾아서 R 코드로 가져오기
rating_data_html <- html_nodes(webpage,'.ratings-imdb-rating strong')

#평점 데이터를 텍스트로 가져오기
rating_data <- html_text(rating_data_html)
rating_data <- as.numeric(rating_data)
str(rating_data)

## 메타스코어
#메타스코어을 CSS selector를 찾아서 R 코드로 가져오기
metaScore_data_html <- html_nodes(webpage,'.metascore')

#메타스코어 데이터를 텍스트로 가져오기
metaScore_data <- html_text(metaScore_data_html)
metaScore_data <- str_trim(metaScore_data)
metaScore_data <- append(metaScore_data,NA,after=28)
metaScore_data <- append(metaScore_data,NA,after=57)
metaScore_data <- append(metaScore_data,NA,after=72)
metaScore_data <- append(metaScore_data,NA,after=95)
is.na(metaScore_data)
metaScore_data <- as.numeric(metaScore_data)
summary(metaScore_data)
str(metaScore_data)
length(metaScore_data)
class(metaScore_data)

## 투표수
#투표수을 CSS selector를 찾아서 R 코드로 가져오기
vote_data_html <- html_nodes(webpage,'.sort-num_votes-visible span:nth-child(2)') 

#투표수 데이터를 텍스트로 가져오기
vote_data <- html_text(vote_data_html)
vote_data <- gsub(",","",vote_data)
vote_data <- as.numeric(vote_data)
str(vote_data)


## 수익
#수익을 CSS selector를 찾아서 R 코드로 가져오기
gross_data_html <- html_nodes(webpage,'.sort-num_votes-visible span:nth-child(5)') 

#수익 데이터를 텍스트로 가져오기
gross_data <- html_text(gross_data_html)
gross_data <- gsub("[$]","",gross_data)
gross_data <- gsub("M","",gross_data)
gross_data <- str_trim(gross_data)
gross_data <- append(gross_data,NA,after=28)
gross_data <- append(gross_data,NA,after=54)
gross_data <- append(gross_data,NA,after=56)
gross_data <- append(gross_data,NA,after=61)
gross_data <- append(gross_data,NA,after=72)
gross_data <- append(gross_data,NA,after=92)
gross_data <- append(gross_data,NA,after=97)
gross_data <- as.numeric(gross_data)
str(gross_data)
summary(gross_data)
is.na(gross_data)

## 감독
#감독을 CSS selector를 찾아서 R 코드로 가져오기
library(dplyr)
director_data_html <- html_nodes(webpage,'.text-muted+p a:nth-child(1)')

#감독 데이터를 텍스트로 가져오기
director_data <- html_text(director_data_html)
director_data <- str_trim(director_data)
director_data <- as.factor(director_data)
str(director_data)

## 배우
#배우를 CSS selector를 찾아서 R 코드로 가져오기
library(dplyr)
actor_data_html <- html_nodes(webpage,'.lister-item-content .ghost+a')

#배우 데이터를 텍스트로 가져오기
actor_data <- html_text(actor_data_html)
actor_data <- str_trim(actor_data)
actor_data <- as.factor(actor_data)
str(actor_data)
```



### 3. 데이터 프레임 생성

```R
Movie_2016 <- data.frame(rank = rank_data, title = title_data, metascore = metaScore_data, desc = desc_data, runtime = rt_data, genre = genre_data, rating = rating_data, votes = vote_data, gross = gross_data, director = director_data, actor = actor_data, stringsAsFactors = F)
str(Movie_2016)
```

### 4. 활용_시각화

```
# x축 상영시간 , y축 장르별 필름 수
qplot(data = Movie_2016, runtime, fill = genre, bins = 30)

#상영시간이 가장 긴 필름의 장르는?
ggplot(movies_df,aes(x=Runtime,y=Rating))+ geom_point(aes(size=Votes,col=Genre))

#상영시간이 130-160 분인 장르중 votes가 가장 높은 것은?
ggplot((Movie_2016 %>% filter(as.numeric(runtime) >= 130 & as.numeric(runtime) <=160)),aes(x=runtime, y=rating)) + geom_point(aes(size=votes, col=genre))
```



# 실습 2.

### 1. 패키지 불러오기, url 설정

```R
##############################################
# 가격 비교를 위한 스크래핑
# rvest 패키지 : 웹 페이지에서 필요한 정보를 추출하는데 유용한 패키지
# selectr패키지, xml2 패키지가 의존 패키지이므로 함께 설치
# read_html(url) : 지정된 url에서 html 컨텐츠를 가져옵니다.
# jsonline 패키지 : json 파서/생성기가 웹용으로 최적화되어 있는 패키지
##############################################
install.packages("jsonlite")
libary(jsonlite)
libary(xml2)
libary(rvest)
libary(stringr)

url <- 'https://www.amazon.in/OnePlus-Mirror-Black-64GB-Memory/dp/B0756Z43QS?tag=googinhydr18418-21&tag=googinkenshoo-21&ascsubtag=aee9a916-6acd-4409-92ca-3bdbeb549f80'
```

### 2. 필요 노드 추출하기 (아마존 스마트폰 상품 정보)

```R
#추출할 정보 : 제목, 가격, 제품 설명, 등급, 크기, 색상

#웹 사이트로부터  HTML code 읽기
webpage <- read_html(url)  
title_html <- html_nodes(webpage, 'h1#title')
title <- html_text(title_html)
head(title)

#모든 공백과 줄 바꿈 제거
str_replace_all(title, "[\r\n]", "")

#가격 정보 태그 가져오기
price_html <- html_nodes(webpage, 'span#priceblock_ourprice')
price <- html_text(price_html)
#모든 공백과 줄 바꿈 제거
price <-str_replace_all(price, "[\r\n]", "")
head(price) 



```

