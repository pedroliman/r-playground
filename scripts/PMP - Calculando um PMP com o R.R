# Estoque Inicial
estoque_inicial <- 10
# Tamanho do lote de produ��o
lote <- 20
# Tamanho do estoque de Seguran�a
estoque_seguranca <- 20
# Lead time em semanas (ou periodos)
lead <- 0
# Demandas Projetadas
demanda <- c(50, 50, 50, 50, 60, 60, 60, 60)
df <- as.data.frame(demanda)
rm(demanda)

# N�mero de meses a projetar
n <- as.numeric(length(demanda))
# Criando um Dataframe

# For loop
# x <- 

