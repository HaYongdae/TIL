################## 객체 데이터 ##################

# 생성: <- 를 통해 자료 입력
# 제거: remove, rm 메소드 사용
# 형태: str(객체) = 구조,변수개수,변수명,관찰치 개수,관찰치의 미리보기
# 조회: head(), tail()
# 차원: dim()
# 길이: length()
# 이름: names()
# 타입: class()

################## 객체 생성실습 ##################


# 1*n (vector) - 단일형(한가지 종류의 자료형만만 포함할 수 있음)

vector_int <- c(-1,0,1)
vector_int <- seq(1,20)
vector_int <- rep(1:3,each = 3)
vector_int <- c(-1,0,"4",5:9) # 문자열로 자동 형변환
vector_str <- c("hello","hi","1")
vector_tf <- c(TRUE,FALSE,TRUE,FALSE)


# n*n (matrix) - 단일형

x <- c(1,2,3,4,5,6)
matrix(x, nrow=2, ncol=3)
matrix(x, nrow=3, ncol=2)             # 위에서 아래로 채워감
matrix(x, nrow=3, ncol=2, byrow=T)    # 왼쪽에서 오른쪽으로 채워감

# n*n*n (array) - 단일형

y <- c(1,2,3,4,5,6)
array(y, dim = c(2,2,3))

# 1*n (list) - 다중형 (여러가지 종류의 자료형을 포함할 수 있음)

ex_list <- list(c(1,2,3), "hello")

# n*n (data.frame) - 다중형

ID <- c(1,2,3,4,5,6,7,8,9,10)
SEX <- c("F","M","F","M","F","M","F","M","F","M")
AGE <- c(50,40,28,50,27,23,56,47,20,38)
AREA <- c("서울","경기","제주","서울","서울","서울","서울","경기","서울","인천")

dataframe_ex <- data.frame(ID,SEX,AGE,AREA)


### factor

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

########################## 타입 별 메소드 ######################

### vector 처리

a<- c(1:20)
b<- c(2,3,4,5)

# 합, 차, 교 집합 연산 예시
union(a,b)
setdiff(a, b)
intersect(a, b)

# index 접근 예시
a[1:2]
a[c(1)]
a[-c(2:18)]

