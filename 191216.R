setwd('c:/Statistics')
m <- lm(dist~speed, data=cars)
#lm: 선형회귀분석
# 물결의 왼쪽에 종속변수, 오른쪽에 독립변수

summary(m)
# summary로 보면 상세정보를 볼 수 있다. residual의 4분위수 확인가능
# coefficients의 estimate가 제일 중요. t검정을 이용해서 값이 우효한지 본다.
# 각각의 계수는 0이다라는 검정이 받아들여질지 말지 결정
유효하다!
# adjusted R-squared: 변량이 많을 때는 어떤 게 영향을 끼치는지 모른다...
# 변량이 많을수록 위의 값이 커지므로 계수
# 변량이 많을 때는 adjusted R-suqare로 평가
#변량이 하나일 때는 multiple r-squared로 평가

#결정계수가 65%...설명력이 꽤 된다는 뜻.
  
  
par(mfrow=c(1,1), mar=c(2,2,2,2))
#화면을 2행2열로 잡고 마진을 준다.
plot(m)
# 다음 그래프 보려면 ctrl+enter
residuals vs fitted : 차이 많이나는 값들->이상치...
등분산성이 있는지? 별로 패턴이 없다. 등분산성 만족한다.
잔차값들이 대략 0에 가깝게 분포돼 있다면 회귀식으로 설명 가능
Q-Q plot: 갖고있는 4분위수 y축 표준잔차, x축은 quantile. 잔차가 정규분포를 따른다.
residuals vs leverage: x축이 leverage(영향력), y축이 표준화된 잔차--->잔차에 따르는 영향력

#cook의 공식 나왔을 때 평균에 가깝게 나오는 애들은 영향력이 없다. 회귀식으로 설명가능
#뒤로 갈 수록 나오는 개별데이터들은 오차가 큰 애들. 정규분포(0.5빨간선) 범주 안에 들어오면 약간의 차이가 있어도 괜찮다. 
#x값은 모두 1~10 사이의 값. 회귀식에서 나오는 개별치들의 잔차가 정규분포 범위 안으로 들어오는지 보기. 버릴 것 버리기 위해.
#0에 가갑게 나오는 값이 많을 수록 회귀식으로 잘 설명된다.

install.packages("lmtest")
library(lmtest)
dwtest(m) # 더빈왓슨. dw값이 2에 가까울수록 상관관계가 적다.
# p-value: 0.09522 -> 0.05보다 크므로 귀무가설 기각 못한다. 오차의 앞뒤(오차 하나와 나머지) 간 상관관계가 없다.


data(iris)
# y가 범주형이어ㅑ 하고, 2가지중 하나여야 한다.
d <- subset(iris, Species=='virginica' | Species=='versicolor')
str(d)
?glm   #family=gaussian은 정규분포, 우리가 하려는 건 이항분포(이산형데이터)
m <- glm(Species~.,data=d,family='binomial') # .은 모두 사용할 때
# 만약 Species가 Factor형이 아닐 경우 Factor형으로 변환시켜서 적용해야 수치형으로 인식 안한다.
#glm: 로지스틱회귀분석
# lm일 때는 y에 수치형 데이터가 들어가야한다.
# glm은 분류형데이터로 y를 채운다.
# y가 1이 될 확률로도 볼 수 있다. 0.5보다 크면 1, 0.5보다 작으면 0
m
# 최적의 w와 b값을 리턴해준다.
fitted(m)[c(1:5,51:55)] #적합된 모델데이터 정보 확인가능. 예측모델.
# e-05: 10의 마이너스 5승
# 0 아니면 1로 수렴한다. 0하고 1사이의 값이 나왔다.
as.numeric(d$Species)
f<-fitted(m) #0~1 실패할 확률 대비 성공할 확률. 예측치
#여기서 P(Y=1)은 무엇을 의미? virginica가 될 확률
fm <- ifelse(f>.5, 1, 0)
head(fm)
is_correct <- (ifelse(f>.5, 1, 0)) == (as.numeric(d$Species)-2)
# virgicolor가 0, virginica가 1 (원래는 2,3)
# 조건을 만족하면 1, 아니면 0
head(is_correct)
sum(is_correct) #1을 기준으로 sum, 98이 나옴
# 정확도가 98%임
