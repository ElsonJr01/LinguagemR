#medidas de dispesão 

altura <- c(170, 165, 180, 182, 187, 155, 180, 180)
var(altura) #variancia 
sd(altura) #sd desvio padrão 

with(Cars, var(horsepower[Origin == "USA"]))
with(Cars, sd(horsepower[Origin == "USA"]))