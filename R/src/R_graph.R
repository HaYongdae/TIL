######### 파일 IO ##########

#파일 출력 경로
pdf("c:/workspceR/sample.pdf")

#출력 파일 닫기
dev.off()

############################

###### 그래프 그리기 #######

#빈도수 히스토그램
hist(Nile)

#정규분포를 따르는 난수 20개 생성해서 히스토그램 생성
hist(rnorm(20))

#밀도 기준 히스토그램
hist(Nile, freq=F)

#분포곡선 추가하기
lines(density(Nile))

#Plots영역에 표시할 그래프 개수 설정
par(mfrow=c(1,1))

############################


##########################################
# 막대 차트
##########################################

chart_data <- c(305, 450, 320, 460, 330, 480, 380, 520)
names(chart_data) <- c("2014 1분기","2015 1분기"
                       , "2014 2분기", "2015 2분기"
                       , "2014 3분기", "2015 3분기"
                       , "2014 4분기", "2015 4분기"
)
str(chart_data)
print(chart_data)


par(mfrow=c(2,2))

barplot(chart_data, ylim=c(0, 600),  col=rainbow(8),
        main="2014년도 VS 2015년도 분기별 매출현황 비교",
        ylab="매출액(단위:만원)", xlab="년도별 분기현황")

#가로 막대 차트 : horiz=TRUE
barplot(chart_data, xlim=c(0, 600), horiz=TRUE,  col=rainbow(8),
        main="2014년도 VS 2015년도 분기별 매출현황 비교",
        ylab="매출액(단위:만원)", xlab="년도별 분기현황")


#막대의 굵기와 간격 지정 : space (값이 클수록 막대의 굵기는 작아지고, 간격은 넓어진다)
#축 이름 크기 설정 : cex.names

barplot(chart_data, xlim=c(0, 600), horiz=TRUE, 
        main="2014년도 VS 2015년도 분기별 매출현황 비교",
        ylab="매출액(단위:만원)", xlab="년도별 분기현황"
        , space=2, cex.names=0.8, col=rep(c(2, 4), 4))

#색상 index값 : 검은색(1), 빨간색(2), 초록색(3), 파란색(4), 하늘색(5), 자주색(6), 노란색(7)

barplot(chart_data, xlim=c(0, 600), horiz=TRUE, 
        main="2014년도 VS 2015년도 분기별 매출현황 비교",
        ylab="매출액(단위:만원)", xlab="년도별 분기현황"
        , space=5, cex.names=0.5, col=rep(c(1, 7), 4))


data(VADeaths)
str(VADeaths)
class(VADeaths)
mode(VADeaths)
head(VADeaths, 10)

data(VADeaths)
str(VADeaths)    #5행 4열
class(VADeaths)  #matrix
mode(VADeaths)   # numeric
head(VADeaths, 10)
# VADeaths 데이터셋은 1940년 미국 버지니아주의 하위계층 사망비율을 기록한 데이터셋

par(mfrow=c(1, 2)) 
barplot(VADeaths, beside=T, col=rainbow(5), 
        main="미국 버지니아주의 하위계층 사망비율")
#범례 출력
legend(0,71, c("50-54", "55-59", "60-64", "65-69", "70-74")
       , cex=0.8, fil=rainbow(5))

#누적막대 차트
barplot(VADeaths, beside=F, col=rainbow(5) )
title(main="미국 버지니아주의 하위계층 사망비율", font.main=4)
legend(0,60, c("50-54", "55-59", "60-64", "65-69", "70-74")
       , cex=1, fil=rainbow(5))

#beside=T/F : X축 값이 측면으로 배열, F이면 하나의 막대에 누적
#font.main : 제목 글꼴 지정
#legend() : 범례 위치, 이름, 글자 크기, 색상 지정
#title() : 차트 제목, 차트 글꼴 지정


## ggplot2 사용하기

install.packages("ggplot2")
library(ggplot2)
ggplot(chart_data, aes()) + geom_bar(width = 0.5)



chart_data, ylim=c(0, 600),  col=rainbow(8),
main="2014년도 VS 2015년도 분기별 매출현황 비교",
ylab="매출액(단위:만원)", xlab="년도별 분기현황"


##########################################

##########################################
# 산점도
##########################################

par(mfrow=c(1, 1)) 
dotchart(chart_data, color=c("black", "blue"), lcolor="blue", 
         pch=1:2, labes=names(chart_data), xlab="매출액", 
         main="2014년도 VS 2015년도 분기별 매출현황 비교"
         , cex=1.2)

##########################################


##########################################
# 파이 차트

par(mfrow=c(1, 1)) 
pie(chart_data, col=rainbow(8),  
    pch=1:2, labels=names(chart_data),   
    main="2014년도 VS 2015년도 분기별 매출현황 비교"
    , cex=1.2)

##########################################

##########################################
# 박스 플롯
##########################################


#연속변수(Continuous quantitative data)는 시간, 길이 등과 같이 연속성을 가진 변수
#boxplot은 요약 정보를 시각화하는데 효과적
#데이터의 분포 정도와 이상치 발견을 목적으로 하는 경우 유용하게 사용된다.
boxplot(VADeaths, range=0) #컬럼의 최대값과 최속밧을 점선으로 연결
#notch=T : 중위수(허리선) 비교
boxplot(VADeaths, range=0, notch=T )
#abline() : 기준선 추가(선 스타일, 선 색상)
abline(h=37, lty=3, col="red")

##########################################

##########################################
# histogram
##########################################

summary(iris$Sepal.Length) #꽃받침 길이의 요약 통계

hist(iris$Sepal.Length, xlab="iris$Sepal.Length", 
     col="magenta", main="꽃받침 길이 histogram" , xlim=c(4.0, 8.0))


##########################################
# scatter plot 
# 두 개 이상의 변수들 사이의 분포를 점으로 표시하는 그래프

##########################################


price <- runif(10, min=1, max=100)
print(price)
plot(price, col="red")
par(new=T) #차트 추가
line_chart=1:100
#x축은 생성된 난수의 순서,  y축은 
plot(line_chart, type="l", col="red", axes=F, ann=F) #대각선 추가 


#좌표평면상의 점 등을 선으로 연결
par(mfrow=c(2, 2))
plot(price, type="l")  #실선
plot(price, type="o")  #원형과 실선
plot(price, type="h")  #직선
plot(price, type="s")  #꺽은선

# 중복된 데이터의 수만큼 plot점 크기 확대
x <- c(1,2,3,4,2,4)
y <- rep(2,6)
table(x, y)

par(mfrow=c(1,1))
plot(x,y)

xy.df <- as.data.frame(table(x,y))
xy.df


plot(x, y, pch = '@', col = 'blue', cex = 0.5*xy.df$Freq, xlab = "x벡터 원소", ylab = "y벡터 원소")

install.packages("psych")
library(psych)
data(galton)

#child컬럼, parent컬럼을 대상으로 교차테이블을 생성
galtondf <- as.data.frame(table(galton$child, galton$parent))
head(galtondf)
str(galtondf)

names(galtondf) <-c("child", "parent", "freq")
head(galtondf)
parent <- as.numeric(galtondf$parent)
child <- as.numeric(galtondf$child)

plot(parent, child, pch=21, col="blue", bg="green", 
     cex=0.2*galtondf$freq, xlab="parent", ylab="child")


#################################################
# pairs() : 변수 간의 관계를 차트로 그릴 수 있다
# graphics패키지에서 제공하는 paris()는 matrix 또는 data.frame의 
# numeric 컬럼을 대상으로 변수들 사이의 비교 결과를 행렬구조의
# 분산된 그래프로 제공합니다.
#################################################
attributes(iris)  #

pairs(iris[, 1:4])
pairs(iris[iris$Species=="setosa", 1:4])
