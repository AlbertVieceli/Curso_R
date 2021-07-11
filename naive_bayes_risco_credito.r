base= read.csv('risco_credito.csv')

install.packages('e1071')
library(e1071)

#-5 são todas as colunas menos a quinta
#treinando e gerando tabela naive bayes
classificador = naiveBayes( x=base[-5], y=base$risco)
print(classificador) #print a tabela de probabilidade

#teste, criando um dataFrame para testar o algoritmo
#c ria o vetor
historia = c('boa')
divida = c('alta')
garantias = c('nenhuma')
renda = c('acima_35')

#teste2
#historia = c('ruim')
#divida = c('alta')
#garantias = c('adequada')
#renda = c('0_15')

df = data.frame(historia, divida, garantias, renda)

previsao = predict(classificador, newdata = df, 'raw')
print(previsao)


