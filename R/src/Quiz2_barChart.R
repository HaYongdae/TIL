library(dplyr)
library(plyr)
dau <- read.csv("C:/Users/student/Desktop/game_ws1_datas/dau.csv", header = T, stringsAsFactors = F)
dpu <- read.csv("C:/Users/student/Desktop/game_ws1_datas/dpu.csv", header = T, stringsAsFactors = F)
install <- read.csv("C:/Users/student/Desktop/game_ws1_datas/install.csv", header = T, stringsAsFactors= F)


# DAU 데이터에 Install 데이터를 결합시키기 (merge함수)
dau.install <- merge(dau, install, by = c("user_id", "app_name"))

# 1차결합된 데이터에 DPU 데이터를 결합시키기 (merge함수)
dau.install.payment <- merge(dau.install, dpu, 
                             by = c("log_date","app_name", "user_id"), 
                             all.x = T)

# 비과금 유저의 과금액에 0을 넣기 ( data[row,col]<-0)
dau.install.payment %>% filter(is.na(payment))
dau.install.payment$payment[is.na(dau.install.payment$payment)] <- 0

# 과금 월 항목 추가   (data.frame객체$새컬럼변수 <- 추가될 데이터, mutate, cbind 등 이용)
dau.install.payment$log_month <-substr(dau.install.payment$log_date, 1, 7)
dau.install.payment$install_month <- substr(dau.install.payment$install_date, 1, 7)

# 추가된 월 항목으로 그룹핑후 과금액 집계 (ddply, aggregate, dplyr::group_by등 이용)
mau.payment <- ddply(dau.install.payment,
                     .(log_month, user_id, install_month), # 그룹화
                     summarize, # 집계 명령
                     payment = sum(payment) # payment 합계
)

# 신규 유저인지 기존 유저인지 구분하는 항목의 새 컬럼변수 추가
mau.payment$user.type <-  ifelse(mau.payment$install_month == mau.payment$log_month, "new", "old")

mau.payment.summary <- ddply(mau.payment,
                             .(log_month, user.type), # 그룹화
                             summarize, # 집계 명령어
                             total.payment = sum(payment) # payment 합계
)
head(mau.payment.summary, 10)

# 그래프로 데이터 시각화

library("ggplot2")

ggplot(mau.payment.summary, aes(x = log_month, 
                                y = total.payment,
                                fill = user.type)) + 
  geom_bar(stat="identity") 
