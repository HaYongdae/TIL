##################################################
# function 특이 사항
##################################################

#함수의 매개변수로 함수 전달

callee <- function(x){
  print(x*2)
}
caller <- function(v, call){
  for (i in v) {
    call(i)
  }
}

print(caller(1:5, callee))


# 함수 내부 전역변수 선언

g<-"global"    #전역변수 , 글로벌 변수
f6 <- function(){ 
  local_val<-"local"    #로컬변수
  print(local)
  print(g)
}
f6()
print(g)
print(local_val) #로컬변수는 정의된 함수 스코프 외부에서 참조 가능? 불가능?

# R에서 변수 검색 Scope 순서 :
# 함수 내부에서 검색 -> 전역 메모리에서 검색 -> 에러 발생

g1 <- 1000
f7 <- function(){
  g1 <<- 100   # 전역변수로 정의
  print(g1 + g1) 
}
print(f7())
print(g1)

f8 <- function(num1){
  local <- num1
  return (function(num2) {
    return (local+num2)
  })
}
result.function <- f8(100)  #함수 리턴
str(result.function)
print(result.function(200))


vec <- c(2,3,4,1,5,2)
rank(vec)
