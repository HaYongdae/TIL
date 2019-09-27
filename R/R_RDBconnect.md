# RDB_connect

```R
######################################################################
OracleDB로부터 R실행환경(메모리)로 데이터 가져오기
RJDBC::JDBC("driver이름", "driver가 존재하는 클래스경로", "DB에서 문자열 처리")
dbConnect(driver객체, DB_Url, user, password)
dbGetQuery(connection객체,  select sql문장)
#######################################################################
install.packages("RJDBC")
library(RJDBC)
library(rJava)

# JDBC jar파일 필요
drv <- JDBC("oracle.jdbc.OracleDriver",
             classPath="C:/app/student/product/11.2.0/dbhome_1/jdbc/lib/ojdbc6.jar",
             identifier.quote="'")

# url, id, pwd configuration 설정
con <- dbConnect(drv, "jdbc:oracle:thin:@localhost:{port_number}:orcl", {"ID"}, {"pwd"})
# 쿼리 전송
rs <- dbGetQuery(con, "select tname from tab")
View(rs)
```

