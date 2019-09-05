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
vector_str <- c("hello","hi","1")
vector_tf <- c(TRUE,FALSE,TRUE,FALSE)

# 2*n (matrix) - 단일형

x <- c(1,2,3,4,5,6)
matrix(x, nrow=2, ncol=3)
matrix(x, nrow=3, ncol=2)             # 위에서 아래로 채워감
matrix(x, nrow=3, ncol=2, byrow=T)    # 왼쪽에서 오른쪽으로 채워감

# n*n (array) - 단일형

y <- c(1,2,3,4,5,6)
array(y, dim = c(2,2,3))

# 1*n (list) - 다중형 (여러가지 종류의 자료형을 포함할 수 있음)

ex_list <- list(c(1,2,3), "hello")

