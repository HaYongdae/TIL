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

