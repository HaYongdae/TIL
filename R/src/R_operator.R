################## 연산자 ##################

# 타 연산자와 동일

# 특이사항 ↓

## T/F에서 다르면 FALSE, 같은면 TRUE
x < FALSE
y <- FALSE
xor(x,y)

# 비교 연산
c(TRUE,TRUE) & c(TRUE, FALSE)
# 각각의 값을 비교 => [1]  TRUE FALSE
c(TRUE,TRUE) && c(TRUE, FALSE)
# 전체 형태를 비교 => [1] TRUE
