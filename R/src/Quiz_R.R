#문> P2 matrix객체에서 2행과 4행을 제외하고 출력

result <- matrix(1:30, 5,5)[-c(2,4),]
result

#문> P2 matrix객체에서 1열과 3열을 제외하고 출력

result <- matrix(1:30, 5,5)[,-c(1,3)]
result


# 컬럼, 로우 이름 제거

rownames <- c("row1", "row2", "row3", "row4")
colnames <- c("col1", "col2", "col3")
matrix_hasNames <- matrix(c(3:14), nrow = 4, byrow = TRUE, dimnames = list(rownames, colnames))
rownames(matrix_hasNames)

matrix_NotHasNames <- matrix(matrix_hasNames,nrow(matrix_hasNames), ncol(matrix_hasNames),F, dimnames(NULL))
rownames(matrix_NotHasNames)

matrix_ <- matrix(c(3:14), nrow = 4, byrow = TRUE)
rownames(matrix_)

#문 > list 중 k3에 저장된 세번째 요소만 출력
list_data <- list(k1="RED",k2="Green",k3=c(21,32,11),k4=TRUE,k5=51.23,k6=119.1)
list_data[3][3]

          