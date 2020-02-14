# t검정을 통해 모집단의 평균 구하기
# df = degree freedom, 자유도 
# 오류 = 유의수준 5% (0~1 사이)
# p-value -> 1종오류를 줄이는 쪽으로.귀무가설을 기각했을 댑 발생할 오류

install.packages("t.text")
library(t.text)
xdata <- c(1196, 1340, 1232, 1184, 1295,
           1247, 1201, 1182, 1192, 1287,
           1159, 1160, 1243, 1264, 1276)
t.text(xdata.mu=1220)

# 단일검정
getwd()
setwd('c:/Rstudy/data/Part-III')
# \는 두개, /는 한개
data <- read.csv("one_sample.csv", header=TRUE)
head(data)
x<- data$survey
str(x)
class(x)
summary(x)  # 결측치 있는지 확인해보려고
summary(as.factor(x)) # 범주형으로 바꿔주면 summary로 table 효과 낸다.
summary(data)
table(x)  # 각 범주별 개수 체크. table은 들어오는 값을 자동으로 범주형으로 간주.
length(x) # 총 개수 체크

data$survey <- as.factor(data$survey)
summary(data)
# 문자열 데이터라면 먼저 수치화한 후 벡터화하는 작업부터 해줘야 한다.


install.packages("prettyR")
library(prettyR)
freq(x) # 비율까지 나온다
# 양측검정 -> 귀무가설(H0: 만족비율이 80%이다.) 대립가설(만족비율이 80%가 아니다.)
# 단측검정(크다,작다) -> H0(만족비율이 80%이다.) 대립가설(만족비율이 80% 이상이다.)
# ---> 양측/단측은 대립가설에 영향을 준다. 

binom.test(c(136,14), p = 0.8) # 136은 150의 80%일 것이다.

#단측검정
binom.test(c(136,14), p = 0.8, alternative = "greater", conf.level = 0.95) # 136은 80%보다 크다.
binom.test(c(14,136), p = 0.2, alternative = "less", conf.level = 0.95)
# greater와 less는 둘다 돌려봐야 한다



