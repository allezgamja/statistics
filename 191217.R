# 예제1
setwd('c:/Statistics/data/실습데이터')
drink=read.csv('drink.csv',header=T)
drink
str(drink) # 지각예스 2, 지각노 1

library(class)
?glm
m = glm(지각여부~ 나이+결혼여부+자녀여부+체력+주량+직급+성별, family='binomial', data=drink)
# 독립변수로 범주형도 가능, 수치형은 권장일 뿐
m    
# coefficient는 어떻게 보면 되나? 독립변수항이 많을 경우 ---> x에 따른 y의 변화량 
f <- fitted(m)  # 0~1 실패할 확률 대비 성공할 확률, 예측치
fm = ifelse(f>.5,1,0)
as.numeric(drink$지각여부)
4.913e+01 #결혼여부Y, e+01은 10의1승이므로 49.13
exp(4.913e+01) # 결혼Y인 사람들이 지각을 안할확률 대비 할 확률이 


# 예제2
install.packages("aod")
library(aod)
library(ggplot2)
# view the first few rows of the data
mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
head(mydata) # 데이터의 대략적인 분포 확인
summary(mydata) # 데이터 구조 확인
str(mydata) # 변수별 표준편차 확인
sapply(mydata, sd) # contingency table : xtabs(~ x + y, data)
xtabs(~admit+rank, data=mydata) #교차table, y는 자동으로 도수, admit+rank

mydata$rank = factor(mydata$rank) # 무조건 y는 범주형이어야 한다.
mylogit = glm(admit ~ gre+gpa+rank, data=mydata, family=binomial)
summary(mylogit)
# 로그값이 양수면 x(성공할확률/실패할확률)가 1보다 크고, 음수면 x가 1보다 작음. 
# 해석: gpa가 1증가하면 admission의 non-admission에 대한 오즈비가 2.23배 증가한다. 
# rank1을 기준으로 rank2, rank3, rank4(범주형데이터)들의 값도 매겨진다. 범주형데이터는 하나 기준잡아서 서로 비교.
# 회귀계수는 오즈, 이를 exp로 자승시키면 오즈비-> 오즈비가 몇배 증가한다 감소한다로 해석
ml = read.data("https://stats.idre.ucla.edu/stat/data/hsbdemo.dt")







