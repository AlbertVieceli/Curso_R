#Leitura da base de dados
base = read.csv('credit_data.csv')
#apaga coluna clienteid
base$clientid = NULL
summary(base)

#valores inconsistentes
base$age = ifelse(base$age<0, media, base$age)

#valores faltantes
base$age = ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)

#Escalonamento de atributos (normalizacao ou padronizacao(preferencia essa))
#base = scale(base)
base[, 1:3] = scale(base[,1:3])

#encode da classe
base$default = factor(base$default, levels = c(0,1))

#Divisao base teste e base treinamento
library(caTools)
set.seed(1)
divisao = sample.split(base$income, SplitRatio = 0.75)
base_treinamento = subset(base, divisao == TRUE)
base_teste = subset(base, divisao == FALSE)

library(rpart)
classificador = rpart(formula = default~., data = base_treinamento)
print(classificador)
#install.packages('rpart.plot')
library(rpart.plot)
rpart.plot(classificador)

previsoes = predict(classificador, newdata = base_teste[-4], type = 'class')
matriz_confusao = table(base_teste[,4], previsoes)
print(matriz_confusao)

#install.packages('caret')
library(caret)
confusionMatrix(matriz_confusao)
