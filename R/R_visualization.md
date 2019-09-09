# R_visualization



> **PROCESS**

```R
1. 데이터 분석의 도입부 : 전체적인 데이터의 구조를 분석하거나 분석 방향을 제시
2. 데이터 분석의 중반부 : 잘못된 처리 결과를 확인
3. 데이터 분석의 후반부 : 분석결과를 도식화하여 의사결정에 반영하기 위해서 데이터를 시각화

# 이산변수로 구성된 데이터 셋을 이용하여 막대, 점, 원형 차트를 그릴 수 있다.
# 연속변수로 구성된 데이터프레임을 대상으로 히스토그램과 산점도를 그릴 수 있다.

** 데이터 분석의 도입부에서 전체적인 데이터의 구조를 살펴보기 위해서 시각화 도구를 사용한다.
	
	- 숫자형 컬럼 1개 시각화 도구 - hist, plot, barplot
	- 범주형 컬럼 1개 시각화 도구 - pie, barplot
	- 숫자형 컬럼 2개 시각화 도구 - plot, abline, boxplot
	- 숫자형 컬럼 3개 시각화 도구 - scatterplot3d(3차원 산점도)
	- n개의 컬럼 시각화 도구 - pairs(산점도 매트릭스)
```



## 1. barplot 그리기

> 세로, 가로 막대 그래프

### 1-1. barplot 의 매개변수

> 주요 변수 : ylim(y축 범위), col(막대 색상) , main(제목)

```bash
Bar Plots
Description
Creates a bar plot with vertical or horizontal bars.

Usage
barplot(height, ...)

## Default S3 method:
barplot(height, width = 1, space = NULL,
        names.arg = NULL, legend.text = NULL, beside = FALSE,
        horiz = FALSE, density = NULL, angle = 45,
        col = NULL, border = par("fg"),
        main = NULL, sub = NULL, xlab = NULL, ylab = NULL,
        xlim = NULL, ylim = NULL, xpd = TRUE, log = "",
        axes = TRUE, axisnames = TRUE,
        cex.axis = par("cex.axis"), cex.names = par("cex.axis"),
        inside = TRUE, plot = TRUE, axis.lty = 0, offset = 0,
        add = FALSE, ann = !add && par("ann"), args.legend = NULL, ...)
```

### 1-2. barplot 실습

```R
#세로 막대 차트

chart_data <- c(305, 450, 320, 460, 330, 480, 380, 520)
names(chart_data) <- c("2014 1분기","2015 1분기"
                      , "2014 2분기", "2015 2분기"
                      , "2014 3분기", "2015 3분기"
                       , "2014 4분기", "2015 4분기"
)
str(chart_data)
print(chart_data)

# 그래프 4칸 보기설정
par(mfrow=c(2,2))

# graph (1,1) 세로 막대
barplot(chart_data, ylim=c(0, 600),  col=rainbow(8),
        main="2014년도 VS 2015년도 분기별 매출현황 비교",
        ylab="매출액(단위:만원)", xlab="년도별 분기현황")

# garph (1,2) 가로 막대 차트 : horiz=TRUE
barplot(chart_data, xlim=c(0, 600), horiz=TRUE,  col=rainbow(8),
        main="2014년도 VS 2015년도 분기별 매출현황 비교",
        ylab="매출액(단위:만원)", xlab="년도별 분기현황")

# graph (2,1)
#막대의 굵기와 간격 지정 : space (값이 클수록 막대의 굵기는 작아지고, 간격은 넓어진다)
#축 이름 크기 설정 : cex.names
barplot(chart_data, xlim=c(0, 600), horiz=TRUE, 
       main="2014년도 VS 2015년도 분기별 매출현황 비교",
        ylab="매출액(단위:만원)", xlab="년도별 분기현황"
        , space=2, cex.names=0.8, col=rep(c(2, 4), 4))

# graph (2,2)
#색상 index값 : 검은색(1), 빨간색(2), 초록색(3), 파란색(4), 하늘색(5), 자주색(6), 노란색(7)
barplot(chart_data, xlim=c(0, 600), horiz=TRUE, 
       main="2014년도 VS 2015년도 분기별 매출현황 비교",
        ylab="매출액(단위:만원)", xlab="년도별 분기현황"
        , space=5, cex.names=0.5, col=rep(c(1, 7), 4))

```

![barplot_ex](img/barplot_ex.png)

```R
# 누적 barplot

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
```

![barplot_ex2](img/barplot_ex2.png)

---



## 2. plot 그리기

> 산점도

### 2-1. plot 의 매개변수

> 주요 변수: labels : 점 설명, cex : 점 크기, pch : 점 모양 [원(1), 삼각형(2),.,], color : 색상, lcolor : 선 색상

```bash
**Arguments**

x	- the coordinates of points in the plot. Alternatively, a single plotting structure, 		function or any R object with a plot method can be provided.

y	- the y coordinates of points in the plot, optional if x is an appropriate structure.

type - what type of plot should be drawn. Possible types are

"p" for points,
"l" for lines,
"b" for both,
"c" for the lines part alone of "b",
"o" for both ‘overplotted’,
"h" for ‘histogram’ like (or ‘high-density’) vertical lines,
"s" for stair steps,
"S" for other steps, see ‘Details’ below,
"n" for no plotting.

main 	- an overall title for the plot: see title.
sub 	- a sub title for the plot: see title.
xlab 	- a title for the x axis: see title.
ylab 	- a title for the y axis: see title.
asp 	- the y/x aspect ratio, see plot.window.
```

### 2-2 plot 실습

```R
par(mfrow=c(1, 1)) 
dotchart(chart_data, color=c("geen", "yellow"), lcolor="blue", 
        pch=1:2, labes=names(chart_data), xlab="매출액", 
        main="2014년도 VS 2015년도 분기별 매출현황 비교"
        , cex=1.2)
```

![plot_ex](img/plot_ex.png)

---



## 3. pieChart 그리기

> 원형 그래프

### 3-1. pieChart 의 매개변수

```bash
**Usage**

pie(x, labels = names(x), edges = 200, radius = 0.8,
    clockwise = FALSE, init.angle = if(clockwise) 90 else 0,
    density = NULL, angle = 45, col = NULL, border = NULL,
    lty = NULL, main = NULL, ...)
```

### 3-2 pieChart 실습

```R
par(mfrow=c(1, 1)) 
pie(chart_data, col=rainbow(8),  
        pch=1:2, labels=names(chart_data),   
        main="2014년도 VS 2015년도 분기별 매출현황 비교"
        , cex=1.2)
```

![pie_ex](img/pie_ex.png)

## 4. boxplot 그리기

> 아래처럼 데이터의 특징을 한 눈에 살펴볼 수 있는 그래프



![boxplot](img/boxplot.jpg)



### 4-1. boxplot 의 매개변수

```R
Usage
boxplot(x, ...)

## S3 method for class 'formula'
boxplot(formula, data = NULL, ..., subset, na.action = NULL,
        xlab = mklab(y_var = horizontal),
        ylab = mklab(y_var =!horizontal),
        add = FALSE, ann = !add, horizontal = FALSE,
        drop = FALSE, sep = ".", lex.order = FALSE)

## Default S3 method:
boxplot(x, ..., range = 1.5, width = NULL, varwidth = FALSE,
        notch = FALSE, outline = TRUE, names, plot = TRUE,
        border = par("fg"), col = NULL, log = "",
        pars = list(boxwex = 0.8, staplewex = 0.5, outwex = 0.5),
         ann = !add, horizontal = FALSE, add = FALSE, at = NULL)
```

### 4-2. boxplot 실습

```R
#연속변수(Continuous quantitative data)는 시간, 길이 등과 같이 연속성을 가진 변수
#boxplot은 요약 정보를 시각화하는데 효과적
#데이터의 분포 정도와 이상치 발견을 목적으로 하는 경우 유용하게 사용된다.
boxplot(VADeaths, range=0) #컬럼의 최대값과 최속밧을 점선으로 연결
#notch=T : 중위수(허리선) 비교
boxplot(VADeaths, range=0, notch=T )
#abline() : 기준선 추가(선 스타일, 선 색상)
abline(h=37, lty=3, col="red")
```

