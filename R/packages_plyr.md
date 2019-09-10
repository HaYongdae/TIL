# plyr 패키지

> 데이터 정제를 돕는 패키지
>
> 데이터 Type을 변환하는 메소드



## 1. 함수 (plyr::)

| 함수명                                                  | 기능 | 특징                                                         |
| ------------------------------------------------------- | ---- | ------------------------------------------------------------ |
| join()                                                  |      | type ="outter, inner, full"  설정 가능                       |
| apply(vec, func)                                        |      | - 결과는 벡터, 배열, 리스트                                  |
| lapply(vec,list, func)                                  |      | - 결과는  리스트                                             |
| sapply(vec , func)                                      |      | - 결과는 벡터, 배열, 행렬 반환                               |
| tapply()                                                |      | - 데이터 셋에 집단 변수(이산형 범주)를 대상으로 그룹별 함수 적용 |
| tapply(vec, 집단변수, 함수)                             |      |                                                              |
| ddply()                                                 |      | - 데이터 셋에 집단 변수(이산형 범주)를 대상으로 그룹별 함수를 여러개  적용할 수 있습니다 |
| ddply(데이터 셋, 집단변수, 요약집계, 컬럼명=함수(변수)) |      | - 결과를 data.frame타입으로 반환                             |

### 1-1. 로드

```R
install.packages("plyr")
library(plyr)
```

------



```R

x<-data.frame(id=c(1,2,3,4,5), 
              height=c(160, 171, 173, 162, 165))
y<-data.frame(id=c(5, 1, 3, 2, 4), 
              weight=c(55, 73, 60, 57, 75))

# join() : 두 데이터프레임을 merge
xyjoin <- join(x, y, by="id")
xyjoin

x<-data.frame(id=c(1,2,3,4,6), 
              height=c(160, 171, 173, 162, 165))
leftjoin <- join(x, y, by="id")   #왼쪽 데이터 프레임의 키값을 기준으로 merge
leftjoin    #키에 join할 데이터가 없으면 NA로 출력


innerjoin <- join(x, y, by="id", type="inner")
innerjoin   #innerjoin은 두 데이터프레임에서 키값이 있는 경우에만 조인을 수행


fulljoin <- join(x, y, by="id", type="full")
fulljoin   #키 값이 존재하는 전체 관측치를 대상으로 조인 수행, 키에 join할 데이터가 없으면 NA로 출력


x<-data.frame(key1=c(1,1, 2,2, 3), 
              key2=c('a', 'b', 'c','d', 'e'),
              val1 = c(10,20,30,40,50))

y<-data.frame(key1=c(3, 2, 2, 1, 1), 
              key2=c('e', 'd', 'c','b', 'a'),
              val1 = c(500,300,400,100,200))

xyjoin <- join (x, y, by=c('key1', 'key2'))
xyjoin


#apply(vec, func) - 결과는 벡터, 배열, 리스트
#lapply(vec|list, func) - 결과는  리스트
#sapply(vec , func) - 결과는 벡터, 배열, 행렬 반환
#tapply() - 데이터 셋에 집단 변수(이산형 범주)를 대상으로 그룹별 함수 적용
#tapply(vec, 집단변수, 함수)

names(iris)
unique(iris$Species)
tapply(iris$Sepal.Length, iris$Species, mean)
sd_iris <- tapply(iris$Sepal.Length, iris$Species, sd)
str(sd_iris)


#ddply() - 데이터 셋에 집단 변수(이산형 범주)를 대상으로 그룹별 함수를 여러개  적용할 수 있습니다.
#ddply(데이터 셋, 집단변수, 요약집계, 컬럼명=함수(변수)) - 결과를 data.frame타입으로 반환

avg_df <- ddply(iris, .(Species), summarise, avg=mean(Sepal.Length))
avg_df
str(avg_df)

result <-ddply(iris, .(Species), summarise, avg=mean(Sepal.Length)
                 , std = sd(Sepal.Length), max=max(Sepal.Length),
                  min=min(Sepal.Length))
result
str(result)
```