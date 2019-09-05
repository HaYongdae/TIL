#기준시간 현재 위치 시간으로 변경
Sys.setlocale(category = "LC_ALL", locale = "")
#locale = "국가명" -> ex_ "Korean_Korea" , "English_US", "Japanese_Japan" 
Sys.getlocale()

#현재 workspace 확인
getwd()
setwd("경로")

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

# 로드된 자원 조회
search()

#기본 데이터셋 조회
data()

# 메모리에 케시된 모든 데이터 목록
ls()

# help 또는 ? : 도움말 시스템을 호출
# help.search 또는 ?? : 주어진 문자열이 포함된 문서 검색
# help.start : 시스템 전반에 대한 도움말
# example : topic의 도움말에 있는 Examples 섹션 실행
# args(함수) : 함수의 파라미터 형식 조회