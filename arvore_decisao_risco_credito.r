base = read.csv('risco_credito.csv')

install.packages('rpart')
library(rpart)

classificador = rpart(formula = risco ~ ., data = base, control =  rpart.control(minbucket = 1))
print(classificador)
plot(classificador)
text(classificador)
print(classificador)

install.packages('rpart.plot')
library(rpart.plot)
rpart.plot(classificador)

#teste2
historia = c('boa', 'ruim')
divida = c('alta', 'alta')
garantias = c('adequada', 'nenhuma')
renda = c('acima_35','0_15')
df = data.frame(historia, divida, garantias, renda)

previsoes = predict(classificador, newdata = df)
print(previsoes)
