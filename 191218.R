install.packages("rpart")
library(rpart)

help(rpart)

# CART: 목적변수가 범주형(지니지수), 연속형(분삭이용)

m <- rpart(Species~ ., data = iris)
m

plot(m, margin=.2)
text(m, cex = 0.6)
# 조건 부 분류규칙이 제일 상단부에 올라옴 

install.packages("rpart.plot")
library(rpart.plot)
prp(m, type=4, extra=2, digits = 3)

# 분류규칙이 어떻게 바뀌는게 좋다는 것이 p-value ?


# CTREE
 # 속성 30개 이하만 가능하다. 

install.packages("party")
library(party)

m2 <-ctree(Species~ ., data = iris)
m2
plot(m2)
