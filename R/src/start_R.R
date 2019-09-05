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