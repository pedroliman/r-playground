# Carregando a biblioteca de datasets
library("datasets")
# Setando o diretorio para um lugar onde posso salvar um arquivo
setwd("D:/Google Drive/Pedro/Estudos/Engenharia de Produção/Especializacao/R Programming")
setwd(dir="E:/Google Drive")
getwd()

# Gravando dados em um arquivo csv:
states <- state.x77
write.table(x=states,file="dados.csv",sep=";")

# Lendo dados deste csv
state <- read.csv("dados.csv",sep=";")

# Observando as dimensões do arquivo
dim(state)
head(state,2)
state[2:4,5:8]
names(state)
mean(state$Population)
sd(state$Income)
mean(state$Income)
maior.pop <- subset(state, Population > 4246)
maior.pop$Population


names(state)
# Podemos usar o subset para pegar certas partes de dados de um dataframe.
subset(x=state, Population > 5000, select=c("Population","Income"))
# Não sei como fazer ainda para buscar, por exemplo, dados combinando condições de campos diferentes.
subset(x=state, state$Income > 5000  select=c("Income", "Population"))

