setwd("C:/Arquivos/Google Drive/Pedro/Estudos/Engenharia de Produção/Especializacao/R Programming/Scripts")

dados <- read.csv(file="dados/lista_de_tarefas.csv",header=TRUE,sep=",")
dados <- subset(x=dados,select=c("description", "notes", "tags", "date.completed"))

dados <- as.data.frame(dados)