# R

> [오픈소스] 통계용 프로그래밍 언어

- 객체 지향



## [들어가기] - 환경 설치/설정 , 단축키

###### 1. 다운로드

​	[R 다운로드](https://cran.seoul.go.kr/) - 기본 엔진 다운로드

​	[R-studio 다운로드](https://www.rstudio.com/products/rstudio/download/#download) - R IDE



###### 2. 환경설정

​	[Tools - Global Options... ] - 설정창

	> => General : Default working... 설정 시 워크 스페이스 설정 가능 
	>
	> => Code : Saving : Default text encoding - change  기본 저장 형식 UTF-8 설정 가능



###### 3. 단축키 (R - studio) 

​	컨트롤+쉬프트+N = 새 스크립트 창 열기

​	실행 : ctrl+enter = 부분 / ctrl + alt + enter = 전체 / ctrl + shift + enter = 직전 명령어 재실행



##### 4. [조회 명령어]()

```R
# R페키지 개수 확인
dim(available.packages())
available.packages()

# R session - R콜솔 시작 ~ 종료)
# R 프로그램 버전, 운영체제, 지원 언어, 기본 패키지 조회
sessionInfo()

# 설치된 R 패키지의 목록 확인 - 우하단의 Packages에서 확인 가능
installed.packages()

# R패키지 설치
install.packages("package_name")
update.packages("package_name")
remove.packages("package_name")

# 설치된 패키지를 사용하기 위해서 메모리에 로드
library(package_name)
require(package_name)

search()
```





---



## [기본다지기] - 데이터 IO / 기초 연산자 / 내장 메소드 / 그래프



##### 1. 데이터 타입

![dataType](img/dataType.png)







## [ + 더하기 ] - 주요 패키지(reshape2, KoNLP, dplyr, ggplot2 )

## [ 프로젝트] - 치킨집 찾기, 미세먼지 농도, 워드클라우드, 부동산

