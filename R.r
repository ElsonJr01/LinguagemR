x <- c(3,4,5) #vetores atribuidos ao X
sum(x) #soma
mean(x) #media
var(x) #variancia
capacidade <- c(14,13,14,13,16,NA,20,NA) #atribuindo valores a capacidade
#C é igual a concatenar
mean(capacidade)#media da capacidade
mean(capacidade, na.rm = TRUE)#media da capacidade e na e os dados que falta dentro do vetor que quero remover e digo que é verdadeira
somaquadrado <- function(x,y,z)#função ate return
{sumsq <- sum(c(x^2, y^2, z^2))
 return(sumsq)}
somaquadrado(2,3,4)
mome <- c("Maria", "Pedro", "Joao")
#Fatores
# 1 = amber, 2 = blue, 3 = brown, 
#4 = gray, 5 = green e 6 = haze

eye_color <- c(2,2,4,1,5,5,5,6,1,3,6,3,1,4) #atribuir valor numerico a cor dos olhos
feyer_color <- factor(eye_color)
levels(feyer_color) <- c("amber", "blue","brown", "gray", "green", "hazel")
length(eye_color)
length(empathy_score)
feyer_color #chamar a função
empathy_score <-c(15,21,45,32,61,74,53,92,83,22,67,55,42,44)
#listas
eyes_and_empathy<-list(eye_code = eye_color, eyes = feyer_color, empathy = empathy_score)

eyes_and_empathy

eyes_and_empathy$empathy
eyes_and_empathy$empathy[4]
#Data frame é igual a lista mais, mais organizado

e <- data.frame(eye_color,feyer_color,empathy_score)#define nome das colunas 
e #imprimir a lista

e$eye_color 
e[7,3]
edit(e) 

e
# cifrão chama a função ou filtra
e.blue <- e$empathy_score[e$feye_color == "blue"]
e.green<- e$empathy_score[e$feye_color == "green"]
e.hazel<- e$empathy_score[e$feye_color == "hazel"]

e.media <- c(mean(e.blue), mean(e.green), mean(e.hazel))
e.amounts <-c(length(e.blue), length(e.green), length(e.hazel))
colors<-c("blue", "green", "hazel")
e.average.frame<-data.frame(cor = colors, media = e.media, n = e.amounts)
edit(e.average.frame)

edit(Animals)
Animals$brain
mean(Animals$brain)
sort(Animals$brain)