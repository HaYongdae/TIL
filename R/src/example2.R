data <- read.csv("C:/Users/student/Desktop/workshop4-data/workshop4-data/ab_test_imp.csv", header = T, stringsAsFactors = F)
data2 <- read.csv("C:/Users/student/Desktop/workshop4-data/workshop4-data/ab_test_goal.csv",header = T, stringsAsFactors = F)

View(data)
View(data2)



ab.test.imp <- merge(data, data2, by = "transaction_id", all.x=T, suffixes= c("",".g"))

ab.test.imp$click <- ifelse(is.na(ab.test.imp$log_date.g),0,1)

count <- ddply(ab.test.imp, .(test_case), summarise, click_cnt = sum(click) / length(transaction_id))

count

model <- chisq.test(count$test_case, count$click_cnt)

model

ab.test.imp.summary <-
  ddply(ab.test.imp, .(log_date, test_case), summarise,
        imp=length(user_id),
        cv=sum(click),
        cvr=sum(click)/length(user_id))

# 테스트 케이스별로 클릭율을 산출하기
ab.test.imp.summary <-
  ddply(ab.test.imp.summary, .(test_case), transform,
        cvr.avg=sum(cv)/sum(imp))
head(ab.test.imp.summary)

# 테스트 케이스별 클릭율의 시계열추이 그래프
library(ggplot2)
library(scales)

ab.test.imp.summary$log_date <- as.Date(ab.test.imp.summary$log_date)
limits <- c(0, max(ab.test.imp.summary$cvr))
ggplot(ab.test.imp.summary,aes(x=log_date,y=cvr, col=test_case,lty=test_case, shape=test_case)) +
  geom_line(lwd=1) +
  geom_point(size=4) +
  geom_line(aes(y=cvr.avg,col=test_case)) +
  scale_y_continuous(label=percent, limits=limits)



