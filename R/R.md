# R

> [오픈소스] 통계용 프로그래밍 언어

- 객체 지향



## [시작] - 환경 설치/설정 , 단축키

###### 1. 다운로드

​	[R 다운로드](https://cran.seoul.go.kr/) - 기본 엔진 다운로드

​	[R-studio 다운로드](https://www.rstudio.com/products/rstudio/download/#download) - R IDE



###### 2. 환경설정

​	[Tools - Global Options... ] - 설정창

> => General : Default working... 설정 시 워크 스페이스 설정 가능 
> => Code : Saving : Default text encoding - change  기본 저장 형식 UTF-8 설정 가능



###### 3. 단축키 (R - studio) 

​	컨트롤+쉬프트+N = 새 스크립트 창 열기

​	실행 : ctrl+enter = 부분 / ctrl + alt + enter = 전체 / ctrl + shift + enter = 직전 명령어 재실행



###### 4. [운영 명령어](https://github.com/HaYongdae/TIL/blob/master/R/src/start_R.R)

```R
#현재 workspace 확인
getwd()
setwd("경로")

# 페키지 개수
dim(available.packages())
available.packages()

# R session
# R 프로그램 버전, 운영체제, 지원 국어, 기본 패키지
sessionInfo()

# 설치된 패키지 목록 (우하단 Packages에서도 확인 가능)
installed.packages()

# R패키지 설치
install.packages("package_name")
update.packages("package_name")
remove.packages("package_name")

# 설치 후, 사용을 위해 메모리에 로드
library(package_name)
require(package_name)

# 로드 된 자원 조회
search()

#기본 데이터셋 조회
data()

```



---



## [기초] - 연산자 / 메소드 / 그래프 / IO

**`변수 네이밍 규칙 `**

- 첫 문자는 알파벳 (대소문자 구분)
- 두 번째부터는 숫자, _(언더 바), .(콤마) 사용가능
- 예약어 사용 불가
- 변수에 저장된 값은 불가



###### 1. 자료형

 1) 자료형 TYPE

| 숫자형(Numeric) – integer, double                         |
| --------------------------------------------------------- |
| 산술   연산자 +, -, *, / , %%, ^, **                      |
| Character (문자형) – “a”, “abc”                           |
| NA   (Not Applicable)                                     |
| NULL                                                      |
| Logical – True(t), False(F)                               |
| 날짜와 시간 : Sys.Date(), Sys.time(), date(),   as.Date() |
| Object - Factor, Vector, Scalar, Metrix,   Array          |
| Collection Object – List , Data Frame                     |

2) [자료형 조회/변환 메소드](https://github.com/HaYongdae/TIL/blob/master/R/src/var_R.R)

```R
############### 변수 관련 메소드 ##################

tracemem(x) # 변수의 address값

# 변수의 class TYPE 값
class(x)
mode(x)     
typeof(x)

Re(z) #숫자형 자료의 실수부만  반환
Im(z) #숫자형 자료의 허수부만  반환


# is.형태(변수명) 으로 T/F 반환
is(x)
is.numeric(x)
is.logical(x)
is.character(x)
is.na(x)
is.list(x)
is.data.frame(x)
is.array(x)
is.matrix(x)

# as.형태(변수명) 으로 T/F 반환
as(x)
as.numeric(x)
as.logical(x)
as.character(x)
as.na(x)
as.list(x)
as.data.frame(x)
as.array(x)	
as.matrix(x)
as.integer(x)
as.double(x)
as.complex(x)
as.factor(x)
as.Date
```







###### 2. 데이터 타입

|  구분  | 1차원  |     2차원     | N차원 |
| :----: | :----: | :-----------: | :---: |
| 단일형 |  백터  |     행렬      | 배열  |
| 다중형 | 리스트 | 데이터 프레임 |  ---  |

![dataType](img/dataType.png)

```R

```











## [ 심화 ] - 주요 패키지(reshape2, KoNLP, dplyr, ggplot2 )

## [ 과제 ] - 치킨집 찾기, 미세먼지 농도, 워드클라우드, 부동산

