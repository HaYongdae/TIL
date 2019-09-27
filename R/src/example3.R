data <- read.csv("C:/Users/student/Desktop/workshop5-data/workshop5-data/ad_result.csv", header = T, stringsAsFactors = F)


View(data)
str(data)

data_TV_INS <- data[,c(2,4)]
data_MA_INS <- data[,c(3,4)]
str(data)
data_TV_INS
par(mfrow = c(2,1))
plot(x = data_TV_INS$tvcm, y = data_TV_INS$install)
k <- lm(formula = install ~ tvcm, data )
abline(k)
plot(x = data_MA_INS$magazine, y = data_MA_INS$install)

k2 <- lm(formula = install ~ magazine, data)
abline(k2)

model <- lm(formula = install ~ magazine+tvcm, data)
model



list.files(path="C:/Users/student/Desktop/서울시 상권데이터", pattern = NULL)
