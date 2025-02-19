
#grafico de dispersão 
ggplot(Cars93, aes(x = Cars93$Min.Price, y= Cars93Horsepower)) + geom_point()

#a função lm faz o modelo linear 

dados.reg <- lm(Cars93Horsepower ~ Cars93$Min.Price)
summary(dados.reg)
coefficients(dados.reg)

ggplot(Cars93, aes(x = Price, y=Horsepower)) + geom_point() + geom_smooth(method=lm) #ele faz uma função linear encima da linha tendo como base os dados 

#predict(dados.reg, data.frame(variavel1=c(13,15)))