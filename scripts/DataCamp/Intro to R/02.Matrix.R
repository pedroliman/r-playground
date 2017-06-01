#' O que é uma Matriz
#' ========================================================
#' Origem dos Exercícios: DataCamp: https://campus.datacamp.com/courses/free-introduction-to-r
# In R, a matrix is a collection of elements of the same data type (numeric, character, or logical) arranged into a fixed number of rows and columns. Since you are only working with rows and columns, a matrix is called two-dimensional.
# Criando uma matriz com 9 elementos.
matrix (1:9, byrow=TRUE, nrow=3)


#' Criando uma Matriz a partir de Vetores
#' ========================================================
# Criando uma matriz a partir de três vetores
# Box office Star Wars (in millions!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# Consolidando os Vetores em um Apenas
box_office <- c(new_hope,empire_strikes,return_jedi)
  
# Construindo uma matriz só
star_wars_matrix <- matrix(box_office,byrow = TRUE, nrow=3)

# Vendo a Matriz
star_wars_matrix
  

#' Nomeando uma Matriz
#' ========================================================
#' To help you remember what is stored in star_wars_matrix, you would like to add the names of the movies for the rows. Not only does this help you to read the data, but it is also useful to select certain elements from the matrix.
#' Similar to vectors, you can add names for the rows and the columns of a matrix
# Box office Star Wars (in millions!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# Construct matrix
star_wars_matrix <- matrix(c(new_hope, empire_strikes, return_jedi), nrow = 3, byrow = TRUE)

# Vectors region and titles, used for naming
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

# Name the columns with region
rownames(star_wars_matrix) = titles

# Name the rows with titles
colnames(star_wars_matrix) = region

# Print out star_wars_matrix
star_wars_matrix

#' Realizando Calculos com a Matriz
#' ========================================================
#' As funções `rowSums()` e `colSums()` retornam vetores com somas das colunas e linhas.
# TUdo o que fiz Anteriormente poderia ser feito apenas nesses comandos:
box_office <- c(460.998, 314.4, 290.475, 247.900, 309.306, 165.8)
star_wars_matrix <- matrix(box_office, nrow = 3, byrow = TRUE,
                           dimnames = list(c("A New Hope", "The Empire Strikes Back", "Return of the Jedi"), 
                                           c("US", "non-US")))

# Calculate worldwide box office figures
worldwide_vector <- rowSums(star_wars_matrix)
worldwide_vector

#' ADicionando colunas na matriz
#' ========================================================
#' A funçao `cbind()` pode ser usada para juntar vetores e matrizes, coluna por coluna:
#' `matriz_compilada = cbind(matriz1, matriz2, vetor1, vetor2, ...)`
#' 
#' Adicionando uma nova coluna 
#' # Construct star_wars_matrix
box_office <- c(460.998, 314.4, 290.475, 247.900, 309.306, 165.8)
star_wars_matrix <- matrix(box_office, nrow = 3, byrow = TRUE,
                           dimnames = list(c("A New Hope", "The Empire Strikes Back", "Return of the Jedi"), 
                                           c("US", "non-US")))

# The worldwide box office figures
worldwide_vector <- rowSums(star_wars_matrix)

# Bind the new variable worldwide_vector as a column to star_wars_matrix
all_wars_matrix <- cbind(star_wars_matrix,worldwide_vector)
all_wars_matrix

#' Adicionando linhas na matriz
#' ========================================================
#' A função `rbind()` adiciona junta duas matrizes em suas linhas

matriz_duplicada = rbind(all_wars_matrix,all_wars_matrix)
matriz_duplicada

#' Somando Colunas na Matriz
#' ========================================================
#' A função `colSums()` soma os valores das Colunas

renda_total = colSums(matriz_duplicada)
renda_total


#' Selecionando Elementos da Matriz e Realizando Operações
#' ========================================================
#' A função `colSums()` soma os valores das Colunas
# Vamos Realizar Algumas Operações com essa matriz
matriz_duplicada

# Selecionando renda fora dos Estados Unidos.
non_us_all <- all_wars_matrix[,2]

# Média de venda fora dos estados Unidos
mean(non_us_all)

# Selecionando renda fora dos Estados Unidos dos dois primeiros filmes
non_us_some <- all_wars_matrix[1:2,2]

# Média desses filmes
mean(non_us_some)

#' Algumas Operações Aritméticas com Matrizes
#' ========================================================
#' Operações matemáticas como +, -, *, /, etc funcionam também em matrizes.
#
matriz_duplicada / 2
# Também é possível realizar operações entre matrizes
nova_matriz = matriz_duplicada * matriz_duplicada
nova_matriz
# Detalhe sobre matrizes que não entendi:
# Those who are familiar with matrices should note that this is not the standard matrix multiplication for which you should use %*% in R.

