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

high = factor_temperature_vector[3]
medium = factor_temperature_vector[2]

#' Níveis de Fatores
#' ========================================================
# Extraindo fatores de uma Survey
survey_vector <- c("M", "F", "F", "M", "M")
factor_survey_vector <- factor(survey_vector)

# Especificando Níveis de Fatores
levels(factor_survey_vector) <- c("Female","Male")

# Observação Importante: O R atribui os fatores alfabéticamente quando nenhuma ordem é especificada a priori. Então é importante sempre lembrar de também mudar os nomes deles de modo alfabético.
factor_survey_vector

#' Usando o Summary de um Fator
#' ========================================================
# Aqui vamos Resumir Variáveis. Podemos fazer isso por variáveis ou por colunas
# Build factor_survey_vector with clean levels
survey_vector <- c("M", "F", "F", "M", "M")
factor_survey_vector <- factor(survey_vector)
levels(factor_survey_vector) <- c("Female", "Male")
factor_survey_vector

# Generate summary for survey_vector
summary(survey_vector)

# Generate summary for factor_survey_vector
summary(factor_survey_vector)

# Male
male <- factor_survey_vector[1]

# Female
female <- factor_survey_vector[2]

# Battle of the sexes: Male 'larger' than female?
male > female

#' Criando Fatores Ordenados e Mostrando o Resultado
#' ========================================================
# Criando um Vetor de Velocidades de Carros
speed_vector <- c("fast", "slow", "slow", "fast", "insane")

# Criando um fator a partir deste vetor
factor_speed_vector <- factor(speed_vector,
                              ordered = TRUE,
                              levels = c("slow", "fast", "insane")
)

# Mostrando o Fator e Seus Resumos
factor_speed_vector
summary(factor_speed_vector)

#' Comparando Fatores Ordinais
#' ========================================================
speed_vector <- c("fast", "slow", "slow", "fast", "insane")
factor_speed_vector <- factor(speed_vector, ordered = TRUE, levels = c("slow", "fast", "insane"))

# Factor value for second data analyst
da2 <- factor_speed_vector[2]

# Factor value for fifth data analyst
da5 <- factor_speed_vector[5]

# Is data analyst 2 faster than data analyst 5?
da2 > da5