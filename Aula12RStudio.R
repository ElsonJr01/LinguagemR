#regressão exponencial 
plot(USPop$year, USPop$population)
cor(USPop$year , USPPop$population)

#Para linearizar, aplique o log apenas no y 

ggplot(USPop, aes(x = year, y = log(population))) + geom_point()

#faça a regressao com a função 
expo.pop <- lm(log(population) ~ year data = USPop)
summary(expo.pop)
#coefficients(expo.pop)

ggplot(USPop, aes(x = year, y = log(population))+ geom_point() + geom_smooth(method = lm)

       #regressao de potencia 
       
ggplot(USpop, aes(x=log(year), y=log(population))) + geom_point() + geom_smooth(method = lm)