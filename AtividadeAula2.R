#fazer tabela (Com as classes)

sort(Animals$body)

body <- hist(Animals$body, plot=F, breaks = 6)
v=range(Animals$body) #extrair o maior e menor valordo conjunto de dados
classe <- length(body$counts)
classe

#amplitude da classe 

amplitude = (v[2]-v[1])/ classe
amplitude = ceiling(amplitude) #arredondar para maior valor
intervalo = seq(v[1], amplitude*classe+v[1], by = amplitude)
body.cut = cut(Animals$body, intervalo, right = FALSE)
body.freq = table(body.cut)
body.freq
cbind(body.freq) #tranformar linha em coluna 
tabela.final <- data.frame(body.freq)
edit(tabela.final)
edit(Animals)
