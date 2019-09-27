install.packages("randomForest")
library(randomForest)
data(iris)

model<-randomForest(Species~., data=iris)
model
plot(model)
#Number of trees는 학습데이터(Forest)로 복원 추출 방식으로 500개 생성했다는 의미
#No, of variables tried at each split는 두 개의 변수를 이용하여 트리의 자식노드가 분류되었다는 의미 (ntree:500, mtry:2)
#error.rate는 모델의 분류정확도 오차 비율을 의미
#Confusion matrix (혼돈 메트릭스) ..
#분류 정확도는 (setosa+versicolor+virgina)/150 : 96%


model2<-randomForest(Species~., data=iris, ntree=300, mtry=4, na.action=na.omit)
model2
plot(model2)
#중요변수 생성으로 랜덤 포레스트 모델 생성

model3<-randomForest(Species~., data=iris, importance=T, na.action=na.omit)
model3
plot(model3)

#중요 변수 보기 - importance속성은 분류모델 생성하는 과정에서 입력변수 중 가장 중요한 변수가 어떤 변수인가를 알려주는 역할을 한다.

importance(model3)
#MeanDecreaseAccuracy - 분류정확도를 개선하는데 기여한 변수를 수치로 제공

#최적의 ntree, mtry 수치값 찾아내기
ntree <- c(400, 500, 600)
mtry <-c(2:4)
param <- data.frame(n=ntree, m=mtry)
param

for(i in param$n){
  cat('ntree=', i, '\n')
  for(j in param$m) {
    cat('mtry = ', j, '\n')
    model_iris <- randomForest(Species~. , data=iris, ntree=i, mtry=j, na.action=na.omit)
    print(model_iris)
  }
}

#오차 비율을 비교하여 최적의 트리와 변수의 수를 결정합니다.
#(400, 2) (400, 3), (400, 4)
#(500, 2) (500, 3), (500, 4)
#(600, 2) (600, 3), (600, 4)


###############Simple 인공신경망 모델 생성 실습##################
install.packages("nnet")
library(nnet)

#x1, x2는 입력변수, y는 출력변수로 사용할 데이터 프레임 생성
df = data.frame(x2=c(1:6), 
                x1=c(6:1), 
                y=factor(c('no', 'no','no', 'yes','yes','yes')))
str(df)

#인공신경망 모델 생성
model_net <- nnet(y~., df, size=1)
#결과는 5개의 가중치 생성 , 오차는 점차적으로 줄어드는 결과를 확인할 수 있습니다.

model_net
# 신경망(a 2-1-1)는 (경계값-입력변수-은닉층-출력변수) 형태로 5개의 가중치

summary(model_net)  #가중치 요약 정보 확인
#입력층의 경계값(b) 1개와 입력변수(i1, i2)2개가 은닉층(h1)으로 연결되는 가중치
#은닉층의 경계값(b) 1개와 은닉층의 결과값이 출력층으로 연결되는 가중치 

model_net$fitted.values  # 분류모델의 적합값 

#분류모델의 예측치 생성, 정확도 확인
#type="class"는 예측 결과를 출력변수 y의 범주('no','yes')로 분류
p <- predict(model_net, df, type="class")
table(p, df$y)



#####iris 데이터 셋에 인공신경망 모델 생성: nnet 패키지 ########
idx<-sample(1:nrow(iris), 0.7*nrow(iris))
training <- iris[idx, ]
testing <- iris[-idx, ]

model_net_iris <- nnet(Species ~ ., training, size=1)
#은닉층 1개, 11개의 가중치 , 출력값 3개


model_net_iris3 <- nnet(Species ~ ., training, size=3)
#은닉층 3개,  27개의 가중치, 출력값 3개

※ 입력변수의 값들이 일정하지 않으면 과적합(overfitting)을 피하기 위해서 정규화 과정을 수행해야 합니ㅏㄷ.

#가중치 확인
summary(model_net_iris) 
summary(model_net_iris3) 

#분류모델의 정확도 평가
table(predict(model_net_iris, testing, type="class"), testing$Species)
#정확률은 

table(predict(model_net_iris3, testing, type="class"), testing$Species)
#정확률은

#nnet 패키지에서 제공되는 인공 신경망 모델은 1개의 은닉층으로 최적화되어 있기 때문에 
은닉층의 노두 수를 3개로 늘려서 많은 연산이 수행된 반면, 분류 정확도는 크게 차이가 없다


#####iris 데이터 셋에 인공신경망 모델 생성: neuralnet 패키지 ########
install.packages("neuralnet")
library(neuralnet)
idx<-sample(1:nrow(iris), 0.7*nrow(iris))
training <- iris[idx, ]
testing <- iris[-idx, ]

※neuralnet()함수는 종속변수(출력변수y)가 수치형이어야 합니다.

training$Species2[training$Species=='setosa'] <- 1
training$Species2[training$Species=='versicolor'] <- 2
training$Species2[training$Species=='virginica'] <- 3
head(training)

testing$Species2[testing$Species=='setosa'] <- 1
testing$Species2[testing$Species=='versicolor'] <- 2
testing$Species2[testing$Species=='virginica'] <- 3
head(testing)

# 정규화 함수를 이용하여 학습데이터와 검정데이터를 정규화
# 0과 1사이의 범위로 컬럼값을 정규화 
normal <- function(x){
  return ((x-min(x))/(max(x)-min(x)))
}

training$Species <- NULL
testing$Species <-NULL

training_nor <- as.data.frame(lapply(training, normal))
summary(training_nor)

testing_nor <- as.data.frame(lapply(testing, normal))
summary(testing_nor)

#인공신경망 분류 모델 생성
model_net <- neuralnet(Species2 ~ Sepal.Length+ Sepal.Width+Petal.Length+Petal.Width, data=training_nor, hidden=1)
model_net
plot(model_net)

#분류모델 정확도(성능) 평가
model_result <- compute(model_net, testing_nor[c(1:4)])
model_result$net.result

#상관관계분석 : 상관계수로 두 변수 간의 선형관계의 강도 측정
#예측된 꼭 종류와 실제 관측치 사이의 상관관계 측정
cor(model_result$net.result, testing_nor$Species2)

#은닉층 2개
model_net2 <- neuralnet(Species2 ~ Sepal.Length+ Sepal.Width+Petal.Length+Petal.Width, 
                        data=training_nor, hidden=2, algorithm="backprop", learningrate=0.01)
model_net2
plot(model_net2)


#분류모델 정확도(성능) 평가
model_result2 <- compute(model_net, testing_nor[c(1:4)])
model_result2$net.result
cor(model_result2$net.result, testing_nor$Species2)



########################분류분석 연습문제 4#######################
# mpg 데이터 셋을 대상으로 7:3 비율로 학습데이터와 검정데이터로 각각 샘플링한 후
각 단계별로 분류분석을 수행하시오.
조건) 변수모델링 : x변수(displ + cyl + year), y변수(cty)

단계1 : 학습데이터와 검정 데이터 생성
idx <- sample(1: nrow(mpg), nrow(mpg) * 0.7)
train <- mpg[idx, ] # 학습데이터
dim(train)
test <- mpg[-idx, ] # 검정데이터
dim(test)

단계2 : formula 생성
# 도시 주행마일수 <- 실린더, 엔진크기, 제조년도 
formula <- cty ~ displ + cyl + year

단계3 : 학습데이터에 분류모델 적용
mpg_train <- ctree(formula, data=train)

단계4 : 검정데이터에 분류모델 적용
mpg_test <- ctree(formula, data=test)

단계5 : 분류분석 결과 시각화
plot(mpg_test)

단계6 : 분류분석 결과 해설
실린더가 5이하이면 엔진크기에 의해서 23개가 분류되고, 실린더가 5이상이고,
6이하이면 27개가 분류되고, 6을 초과한 경우 21개가 분류된다.

########################분류분석 연습문제 5##################
weather 데이터를 이용하여 다음과 같은 단계별로 분류분석을 수행하시오.
조건1) rpart() 함수 이용 분류모델 생성
조건2) 변수 모델링 :
  y변수(RainTomorrow), x변수(Date와 RainToday 변수 제외한 나머지 변수)
조건3) 비가 올 확률이 50% 이상이면 ‘Yes Rain’, 50% 미만이면 ‘No Rain’으로 범주화

단계1 : 데이터 가져오기
library(rpart)
weather = read.csv("./data/weather.csv", header=TRUE)

단계2 : 데이터 샘플링
weather.df <- weather[, c(-1,-14)]
nrow(weather.df)
idx <- sample(1:nrow(weather.df), nrow(weather.df)*0.7)
weather_train <- weather.df[idx, ]
weather_test <- weather.df[-idx, ]

단계3 : 분류모델 생성
weather_model <- rpart(RainTomorrow ~ ., data = weather.df)
weather_model # Humidity 중요변수

단계4 : 예측치 생성 : 검정데이터 이용
weater_pred <- predict(weather_model, weather_test)
weater_pred

단계5 : 예측 확률 범주화('Yes Rain', 'No Rain')
weater_class <- ifelse(weater_pred[,1] >=0.5, 'No Rain', 'Rain')

단계6 : 혼돈 행렬(confusion matrix) 생성 및 분류정확도 구하기
table(weater_class, weather_test$RainTomorrow)
# weater_class No Yes
# No Rain 83 6
# Rain 2 19
# (83 + 19) / nrow(weather_test)
# [1] 0.9272727



###################유클리디안 거리 계산 ########################
x <- matrix(1:9, nrow=3, by=T)
x
dist<-dist(x, method="euclidean")
dist

#1과 2, 2와 3은  유클리디안 거리 1과 3보다는 가깝고 

s<- sum((x[1,] - x[2,])^2)  #1행과 2행의 변량의 차의 제곱의 합
sqrt(s)  



s<- sum((x[1,] - x[3,])^2)  #1행과 3행의 변량의 차의 제곱의 합
sqrt(s) 


######## 유클리디안 거리 계산 계층적 군집 분석 1##################
install.packages("cluster")
library(cluster)

x <- matrix(1:9, nrow=3, by=T)
x
dist<-dist(x, method="euclidean")
dist

#유클리드 거리 matrix를 이용한 군집화
hc <- hclust(dist) #클러스터링 적용

plot(hc)


##########유클리디안 거리 계산 계층적 군집 분석 2 #############
interview <- read.csv("./data/interview.csv", heaer=TRUE)
names(interview)
head(interview)

#유클리디안 거리 계산
interview_df <- interview[c(2:7)]
idist <- dist(interview_df)
head(idist)

hc <- hclust(idist)







