# Algoritmo para conseguir calcular o MRP de um produto espec?fico:
# Observaçoes:
# Não esta funcionando com lead time de um periodo
# Nao esta funcionando a parte do lote multiplo direito.

# Fun??o CalculaLiberacaoOrdens

# Entradas da Fun??o "?nicas":
# LMIN (Lote M?nimo) - ? a quantidade m?nima do produto que pode ser produzida em um per?odo de tempo.
lmin <- 200
# LMUL (Lote M?ltiplo) - A quantidade do produto a ser produzida deve ser m?ltipla deste n?mero.
lmul <- 200
# ES (Estoque de Seguran?a) - ? a quantidade m?nima de estoque que se deseja manter para o produto considerado
es <- 400
# LT (Lead Time) - ? o n?mero de unidades de tempo necess?rio para produzir ou receber o item.
lt <- 2

# Construindo o Dataframe:
# NB - Definindo as Demandas (Necessidades Brutas) (#Input)
nb <- c(120,30,0,0,23,324,0,24,0,124,1142,12,341,241,312,0,0,123,314,13,245,134,134,234,0,0,324,1234,124,1234,12,321,312,23,123,314)
# Colocando uma necessidade bruta do periodo atual para 0 para poder ter recebimentos programados e estoque atual da do per?odo 1.
nb <- c(0,nb)
# Criando o Dataframe a partir disto:
mrp <- data.frame(nb)
rm(nb)
# NPER (N?mero de Per?odos a serem calculados) - ? o tamanho das demandas menos o leadtime.
# -1 porque o per?odo 1 corresponde ? semana atual (que n?o ter? previs?o de producao calculada.)
nper <- as.numeric(length(mrp$nb))

# RPini (Recebimento programado inicial) - ? a quantidade de material que vou receber antes do primeiro per?odo.
mrp["rp"] <- 0
# Aqui viria o #input do usu?rio indicando os recebimentos programados das primeiras semanas.
rpini <- c(0,150,0,0)
nrpini <- as.numeric(length(rpini))
mrp$rp[1:nrpini] <- rpini
rm(nrpini)
rm(rpini)
# EPD (Estoque Projetado Dispon?vel) - ? a quantidade de material que tenho no fim do per?odo considerado.
mrp["epd"] <- 0

# EPD - Estoque Aqui vem direto o #Input do Usu?rio sobre o estoque inicial
mrp$epd[1] <- 60

# PLOi (Plano de Libera??o de Ordens) - Indica qual ser? o plano de Libera??o de Ordens de Produ??o ou Compra para o per?odo i.
mrp["plo"] <- 0

# Fazendo um Loop para calcular os estoques necessarios para o calculo do primeiro periodo
# quantos estoques?
nes <- lt - 1
# S? vou fazer isso se precisar calcular algum estoque dispon?vel
if (lt >= 2){
  #
  per <- 2
  while (per <= 1 + nes ) {
    # Estoque dispo = Estoque anterior + Receb. prog - Necessidade Bruta
    mrp$epd[per] <- mrp$epd[per-1] + mrp$rp[per] - mrp$nb[per]
    per <- per + 1
  }
} 

# Voltando um periodo para fazer agora o calculo do mrp.

per <- per - 1

# Agora sim vou calcular o mrp at? o fim...

# Vou calcular o plano de libera?ao ate o ultimo periodo possivel de acordo com o lead time
while (per <= nper - lt){
  # Estoque dispon?vel antes da semana que estou olhando
  mrp$epd[per+lt-1] <- mrp$epd[per+lt-2] + mrp$rp[per+lt-1] - mrp$nb[per+lt-1]
  
  # Quanto preciso produzir ?
  # Se o que eu vou ter antes do per?odo + lead time form maior que o estoque de seguran?a
  if (mrp$epd[per+lt-1] - mrp$nb[per+lt] >= es ){
    # Eu n?o preciso produzir nada
    mrp$plo[per] <- 0
    # Mas se for menor que o estoque de seguran?a...
  }else{
    # A? eu teria que produzir exatamente O que eu terei + o meu estoque de seguran?a
    mrp$plo[per] <- es +  mrp$nb[per+lt] - mrp$epd[per+lt-1]
    
    # No caso de Produzir, eu tenho que respeitar meu lote m?nimo:
    if (mrp$plo[per] < lmin ){
        mrp$plo[per] <- lmin
  }
    # Tamb?m tenho que respeitar meu lote m?ltiplo
    # Tem que ver uma forma de garantir que seja lote multiplo, porque não esta funcionando, esta caindo aqui direto.
    if (!is.integer(mrp$plo[per]/lmul)){
      # Se deu um lote quebrado, vou produzir o m?ltiplo imediatamente superior ? quantidade necess?ria
      mrp$plo[per] <- ceiling(mrp$plo[per]/lmul)*lmul
    }
    
} 
  # Definindo o recebimento programado!
  mrp$rp[per+lt] <- mrp$plo[per]
  # indo para o proximo período:
  per <- per + 1

}