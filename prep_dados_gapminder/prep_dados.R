
import_data = function (data_file, sheet_name) {
  ## Ajustando variÃ¡vel de ambiente do Java
  Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_101\\jre\\')
  
  # Carregando os Dados
  library(xlsx)
  
  dados = read.xlsx(data_file, sheetName=sheet_name)
  
  # dados = na.omit(dados)
  
  return(dados)
  
}

variaveis = import_data(paste(getSrcDirectory(import_data),"/Eventos e variaveis_final.xlsx",sep=""),"Variaveis&Dados", encoding="UTF-8")s


variaveis = import_data(paste(getSrcDirectory(import_data),"/Eventos e variaveis_final.xlsx",sep=""),"Variaveis&Dados", encoding="UTF-8")


variaveis