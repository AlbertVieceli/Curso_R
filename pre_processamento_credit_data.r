base = read.csv('credit_data.csv')
base$clientid = NULL
summary(base)
# localizando idade negativa e NA e usando um filtro []
base[base$age<0 & !is.na(base$age), 1:2 ]
idade_invalida = base[base$age<0 & !is.na(base$age), ]

#Apagar coluna inteira
#base$age = NULL

#Apagar os registros com problema
#base = base[base$age > 0,]

#Calcular a media da idade
mean(base$age, na.rm = TRUE)
media = mean(base$age[base$age > 0], na.rm = TRUE)

base$age = ifelse(base$age<0, media, base$age)

#Identificando e substi os NA pela media
base[is.na(base$age),1:4]
base$age = ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)

#Escalonamento de atributos (normalizacao ou padronizacao(preferencia essa))
#base = scale(base)
base[, 1:3] = scale(base[,1:3])
