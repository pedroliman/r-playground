as.character(state$pres12)
# Conversão de "level" para caracter.

# stocks.txt
# Leio um arquivo delimitado por espaços que contém
# Informa��es sobre os estoques.
stocks <- read.delim("stocks.txt")
# Pegando os primeiros registros deste dataframe
head(stocks, 3)
tail(stocks, 3)
#Observando a esdtrutura de uma variavel
str(stocks)
# Sum�rio dos dados. isto pode ser usado em outros tipos de objetos
# Aplicadas a qualquer tipo de dados.
summary(stocks)

head(stocks$date, 20)
# Transformando um valor em data para poder usar gr�ficos que ordenam por data!
stocks$date <- as.Date(stock$date, "%d-%b-%y")
head(stocks, 3)
# Agora consigo mostrar os dados em forma de uma tend�ncia linear:
GOOG <- subset(stocks, ticker == "GOOG")
plot(GOOG$date, GOOG$close, type="l")
