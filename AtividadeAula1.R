#media 
altura <- c(170, 165, 180, 182, 187, 155, 180, 180)
mean(altura) #tirar a media da altura 

edit(Cars93)
horsepower.USA <- Cars93$Horsepower[Cars93$Origin == "USA"]
mean(horsepower.USA) #tirar a media 

#Usando a função with para calcular media(pode calcular qualquer outra coisa)
#a função with dispensa o uso do sifrão ($) para chamar um conjunto de dados de um data framewar

with(Cars93, mean(horsepower.USA[Origin == "USA"]))

with(Cars93, mean(horsepower.USA[Origin == "USA" & Cylinders == 4]))

#Organizar na ordem crescente

sort(altura)
sort(altura, decreasing = TRUE)
#calcular a mediana
median(altura)

#calcular a moda. tem que instalar o pacote modest 
mfv(altura)