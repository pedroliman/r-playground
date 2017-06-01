#' O que são Factors (Fatores)
#' ========================================================
#' Origem dos Exercícios: DataCamp: https://campus.datacamp.com/courses/free-introduction-to-r
# Um Fator é um tipo de dado que armazena variáveis categóricas

fator = "isso é um fator/categoria!"

#' Extraindo Fatores de Dados
#' ========================================================
#' Para extrair fatores de dados, usa-se a função `factor()` a partir de um vetor


gender_vector <- c("Male", "Female", "Female", "Male", "Male")
factor_gender_vector <- factor(gender_vector)
factor_gender_vector

#' Tipos de Variáveis Categóricas
#' ========================================================
#' Existem dois tipos de variáveis categóricas: Nominais e Ordinais. No R, é possível definir isto da segunte forma:
#' Por padrão, um fator é nominal, como esse:
animals_vector <- c("Elephant", "Giraffe", "Donkey", "Horse")
factor_animals_vector <- factor(animals_vector)
factor_animals_vector

#' Mas é possível criar fatores ordinais, como esse:
# Temperature
temperature_vector <- c("High", "Low", "High","Low", "Medium")
factor_temperature_vector <- factor(temperature_vector, order = TRUE, levels = c("Low", "Medium", "High"))
factor_temperature_vector
summary(factor_temperature_vector)