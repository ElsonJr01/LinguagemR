#fazer tabela (Com as classes)

sort(Cars93$Price)

prices <- hist(Cars93$Price, plot=F, breaks = 5)
v=range(Cars93$Price) #extrair o maior e menor valordo conjunto de dados
classe <- length(prices$counts)

#amplitude da classe 

amplitude = (v[2]-v[1])/ classe
amplitude = ceiling(amplitude) #arredondar para maior valor
intervalo = seq(v[1], amplitude*classe+v[1], by = amplitude)
price.cut = cut(Cars93$Price, intervalo, right = FALSE)
price.freq = table(price.cut)
price.freq
cbind(price.freq) #tranformar linha em coluna 
tabela.final <- data.frame(price.freq)
edit(tabela.final)
