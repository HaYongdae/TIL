################## 객체 데이터 ##################

# 생성: <- 를 통해 자료 입력
# 제거: remove, rm 메소드 사용
# 형태: str(객체) = 구조,변수개수,변수명,관찰치 개수,관찰치의 미리보기
# 조회: head(), tail()
# 차원: dim()
# 길이: length()
# 이름: names(객체) <- c(백터)  ## 기존의 값에 인댁스 이름을 지정
# 타입: class()
# 정렬: sort(객체, decreasing = TRUE/FALSE)


################## 객체 메소드 실습 ##################


## 1*n (vector) - 단일형(한가지 종류의 자료형만만 포함할 수 있음) ##

# 생성 : c(), seq(), rep()
vector_int <- c(-1,0,1)
vector_int <- seq(1,20)
vector_int <- rep(1:3,each = 3)
vector_int <- c(-1,0,"4",5:9) # 문자열로 자동 형변환
vector_str <- c("hello","hi","1")
vector_tf <- c(TRUE,FALSE,TRUE,FALSE)
vector_appendedV <- append(vector_int, 99, after=1) # after = 인덱스 값
vector_appendedV

a<- c(1:20)
b<- c(2,3,4,5)
d<- c(1:20)
e<- c(20:1)
f<- c(2:21)

# 연산
union(a,b)
setdiff(a, b)
intersect(a, b)
identical(a, e) # 두 객체의 데이터 개수, 순서가 일치하는가
setequal(a, e)  # 두 객체의 데이터가 일치하는가 (순서 상관 x)

# 접근
a[1:2]
a[c(1)]
a[-c(2:18)]


## n*n (matrix) - 단일형 ##

# 생성: matrix(data, (nrow), (ncol),(byrow),(dimnames))
x <- c(1,2,3,4,5,6)
matrix_23 <- matrix(x, nrow=2, ncol=3)
matrix_32 <- matrix(x, nrow=3, ncol=2)             # 위에서 아래로 채워감
matrix_32FLTR <- matrix(x, nrow=3, ncol=2, byrow=T)    # 왼쪽에서 오른쪽으로 채워감
matrix_32dimnames <-matrix(x, nrow=3, ncol=2, dimnames("첫째"))
matrix_T <- t(matrix_23) # 전치행렬
matrix33 <-rbind(matrix_23,c(1,2,3))
matrix_S <- solve(matrix_33)


# 변형: rbind(m1,m2), cbing(m1,m2)
matrix_33 <- rbind(matrix_23, c(1,2,3))
matrix_24 <- cbind(matrix_23, c(1,2))

# 명명: dimnames(rownames, colnames
# 조회: rownames(matrix), colnames(matrix)

rownames <- c("row1", "row2", "row3", "row4")
colnames <- c("col1", "col2", "col3")
matrix_hasNames <- matrix(c(3:14), nrow = 4, byrow = TRUE, dimnames = list(rownames, colnames))

# 접근:
matrix_23[1,3]
matrix_23[2,]  #2행 전체 요소에 접근
matrix_23[,3]   #3열 전체 요소에 접근
matrix_hasNames["row1",]  #1행 전체 요소에 접근
matrix_hasNames[,"col3"]   #3열 전체 요소에 접근
matrix_NotHasNames <- matrix(matrix_hasNames,nrow(matrix_hasNames), ncol(matrix_hasNames),F, dimnames(NULL))
matrix_NotHasNames
# 연산:

result <- matrix_23 + 10 * 2

# apply함수(행렬객체, margin(1:행,2:열),function)을 활용한 예제

f <- function(x) {  #사용자 정의 함수 
  x*c(1,2,3)
}
result <- apply(matrix_23, 1, f)
print(result)

result <- apply(matrix(1:9, ncol=3), 2, f)
print(result)

## n*n*n (array) - 단일형 ##

# 생성
y <- c(1,2,3,4,5,6)
array(y, dim = c(2,2,3), dimnames = "matrix.names 지정 가능")

# 접근
ex_array[1,3,2] #형식으로 접근

## 1*n (list) - 다중형 (여러가지 종류의 자료형을 포함할 수 있음) ##

#key가 생략된 부분은 [[n]]형식으로 출력되고 , 
#해당 key에 저장된 value는 [n]형식으로 출력되며, 
#한 개의 값이 Vector 형식으로 저장

# 생성
ex_list <- list(c(1,2,3), "hello")
list1 <- list("lee", "이순신", 95)
emp1 <- list(name='kim', address='seoul', age=30, hiredate=as.Date('2017/01/02'))

# 추가/갱신

ex_list$text <- 1
emp1$age <- NULL      #리스트의 요소를 제거

# 접근
emp1[1:2]  #색인으로 데이터 값 access
emp1$age  #key로 데이터 값 access

#lapply 함수 ( list 반환)
a <- list(c(1:5))
b <- list(6:10)
result <- lapply(c(a,b),max)
result
str(result)

#sapply 함수 ( vector 반환)
result <- sapply(c(a,b),max)
str(result)

# 중첩 리스트
multi_list <- list(c1 = list(1,2,3),
                   c2 = list(10,20,30),
                   c3 = list(100,200,300))
#다차원 리스트 -> 열단위 바인딩
do.call(cbind, multi_list)


## n*n (data.frame) - 다중형 ##


###########################################################
# DataFrame - 데이터베이스의 테이블 구조와 유사
# R에서 가장 많이 사용하는 자료구조
# 컬럼 단위로 서로 다른 데이터 유형(type)을 저장 가능
# 리스트와 벡터의 혼합형으로 컬럼은 리스트, 컬럼 내의 데이터는 벡터 자료구조를 갖는다
# DataFrame 생성함수 - data.frame(), read.table(), read.csv()
# txt, excel, csv 파일로부터 DataFrame 생성
# data.frame(컬럼1=자료, 컬럼2=자료, ...컬럼n=자료)
########################################################### 
#여러 개의 벡터 객체를 이용하여 데이터프레임을 생성할 수 있다. 
#이때 모든 컬럼은 길이가 같아야 한다. 컬럼의 길이가 서로 다르면 오류가 발생한다.

# 생성
# 1.
ID <- c(1,2,3,4,5,6,7,8,9,10)
SEX <- c("F","M","F","M","F","M","F","M","F","M")
AGE <- c(50,40,28,50,27,23,56,47,20,38)
AREA <- c("서울","경기","제주","서울","서울","서울","서울","경기","서울","인천")

dataframe_ex <- data.frame(ID = ID,SEX = SEX,AGE = AGE,AREA =AREA)

# 2.
sales1 <- matrix(c(1,'Apple' ,500,5,
                   2,'Peach' ,200,2,
                   3,'Banana',100,4,
                   4,'Grape' ,50 ,7), nrow=4, byrow=T)
str(sales1)
df1 <- data.frame(sales1)
df2 <- data.frame(sales1, stringsAsFactors = FALSE)  # 값을 Factor가 아닌 chr로 만든다.
names(df2) <-c('NO','Fruit','Price','Qty')
# 내용 변환
# as.numeric()함수 사용
df2$Qty <- as.numeric(df2$Qty)
df2$Price <- as.numeric(df2$Price)
str(df2)
#data.frame 요소에 접근 : 변수명$컬럼명 형식으로 요소 접근, 결과는 벡터로 반환
print(df2$Qty) #컬럼이름으로 data.frame 의 특정 컬럼 데이터 모두 access

#데이터프레임에 새로운 열 추가
dataframe_ex$work <- c(T,T,F,F,T,F,T,T,T,F)  
str(dataframe_ex)


# subset(데이터프레임 객체, 조건) : 조건에 만족하는 행을 추출, 독립된 객체를 생성
# df1 데이터 프레임에서 수량이 5보다 큰 추출 출력
subset.df1 <- subset(df2, Qty>5)
subset.df1
str(subset.df1)

df2<-data.frame(x=c(1:5), y=seq(2, 10, 2), z=c('a', 'b', 'c', 'd', 'e'))
#summary()는 데이터프레임 객체의 데이터를 대상으로 최소값, 최대값, 중위수, 평균, 사분위수 값을 요약하여 반환
summary(df2)

df4 <- data.frame(name = c(1,2,3,4))
df5 <- data.frame(name = c(3,4,5,6))

result <- merge(df4, df5, all = T)

# 추가
dataframe_ex$tel <- "010-1111-2222"




### factor ##

gender <- c("man","woman", "woman", "man", "man")
# plot(gender) 사용이 불가능 - 차트는 수치 데이터로 생성됨

ngender <- as.factor(gender) #범주의 순서가 알파벳 순서로 정렬됨
# 범주의 빈도 확인 가능 옵션 , levels 지정 후, ordered
ogender <- factor(gender, levels<-c("woman","man") ,  ordered=T)


# 아래 코드로 비교 실습
table(ngender)
table(ogender)
par(mfrow=c(1,2))
plot(ngender)
plot(ogender)

########################################################
