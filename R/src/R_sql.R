install.packages("devtools")
install.packages("dkahle/ggmap")
library(devtools)
library(dkahle/ggmap)
googleAPIkey <- "AIzaSyAAw2hDIswlXTbTdhoZZ9hYJu3DL6edvQM"
register_google(googleAPIkey)
gg_seoul <- get_googlemap("seoul", maptype = "terrain")


install.packages("googleVis")
install.packages("sqldf")
library(sqldf)
library(googleVis)

print(Fruits)
str(Fruits)

#Apple 데이터만 추출
sqldf("select * from Fruits where Fruit = 'Apples'")

#처음부터 3개의 해안 추출
sqldf("select * from Fruits limit 3")

#Sales 컬럼변수값으로 내림차순 정렬
sqldf("selct * from Fruits order by Sales desc")

#Sales 컬럼의 누적합, 최소값, 최대값, 평균
sqldf("select sum(Sales), min(Sales), max(Sales), avg(Sales) from Fruits")

#Fruit 과일 종류별 누적합, 최소값, 최대값, 평균
sqldf("select Fruit,sum(Sales), min(Sales), max(Sales), avg(Sales)  from Fruits group by Fruit")


library(ggplot2)
?sqldf
str(mpg)

sqldf("select manufacturer, avg(cty + hwy) as total_y from mpg where class = 'suv' group by manufacturer order by avg(cty + hwy) desc limit 5")
sqldf("select manufacturer,class, count(*) from mpg where class = 'compact' group by manufacturer order by count(*) desc")
