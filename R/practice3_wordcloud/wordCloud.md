# wordCloud 생성

> script의 단어 빈도수를 그래프화

## 1. 원하는 데이터 다운로드

- 카카오톡 대화창 - ctrl + s : 일정 기간의 대화내역 저장 가능

------

## 2. 필요 패키지 install / load

```R
install.packages("KoNLP")
install.packages("wordcloud2")
library(KoNLP)
library(wordcloud2)
```

## 3. 사전 설정

```R
# 사전 설정 및 한글 처리
useSystemDic()  #시스템 사전 설정
useSejongDic()  #세종 사전 설정
useNIADic()     #NIADic 사전 설정
```

## 4. 데이터 로드

```R
# 데이터 읽어오기
word_data <- readLines("C:/Users/student/Desktop/script",encoding = "UTF-8")
word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
```

## 5. 데이터 정제

```R
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
undata2 <- gsub("[.,/()^\"\\?\]]","",undata2)
undata2 <- gsub("^","",undata2)
undata2 <- gsub("ㅋ","",undata2)
undata2 <- gsub("ㅠ","",undata2)
undata2 <- gsub(" ","",undata2)
undata2 <- gsub("[a-zA-Z]","",undata2)

# 빈도 숫자대로 솔팅
word_table2 <- table(undata2)
sort(word_table2, decreasing = T)
```



## 6. 워드클라우드 그리기

```R
wordcloud2(word_table2)
```

```R
# Usage
wordcloud2(data, size = 1, minSize = 0, gridSize =  0,
    fontFamily = 'Segoe UI', fontWeight = 'bold',
    color = 'random-dark', backgroundColor = "white",
    minRotation = -pi/4, maxRotation = pi/4, shuffle = TRUE,
    rotateRatio = 0.4, shape = 'circle', ellipticity = 0.65,
    widgetsize = NULL, figPath = NULL, hoverFunction = NULL)
# Arguments
data 				# [단어] [빈도수] 컬럼으로 이뤄진 데이터
size  				# 폰트 크기 (1~)
minSize				# 최소 폰트 크기
gridSize 			# 폰트 사이즈 겝
fontFamily 			# 폰트
fontWeight 			# 폰트 굵기 ( bold or 600 )
color 				# 폰트 색상 ('random-dark' or 컬러 벡터) 
backgroundColor		# 배경색
minRotation			# 최저 빈도 수 (이하인 단어는 출력 x)
maxRotation			# 최대 빈도 수
shuffle				# 실행마다 결과를 변경시킬 것인지 (T/F)
rotateRatio			# 
shape				# 클라우드 모양 
 -> ('circle','cardioid','diamond','triangle-forward','triangle', 'pentagon', 'star')
ellipticity			# 평준화
widgetsize			# 위젯 사이즈
figPath				# 마스크로 사용할 경로
hoverFunction		# 마우스 hover 시 실행될 java script 함수 선언
```

