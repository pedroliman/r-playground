#' Criando Listas list()
#' ========================================================
#' Listas servem para armazenar diversos outros objetos de modo organizado
#' Pode ser interessante armazenar variáveis em listas para manter o escopo das variáveis organizado.
# Vector with numerics from 1 up to 10
my_vector <- 1:10 

# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]

# Construct list with these different elements:
my_list <- list(my_vector, my_matrix, my_df)

#' Definindo o Nome dos componentes das Listas
#' ========================================================
# Vector with numerics from 1 up to 10
my_vector <- 1:10 

# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]

# Adapt list() call to give the components names
my_list <- list(vec = my_vector, mat = my_matrix, df = my_df)

# Duas Formas possíveis de nomear os itens da lista
# my_list <- list(your_comp1, your_comp2)
# names(my_list) <- c("name1", "name2")

my_list


# The variables mov, act and rev are available
mov = "O homem que mudou o jogo"
act = c("Pedro Lima", "Dieter")
comments = c("Muito Bom!", "Legal!", "Mais ou Menos")
profs = c("Pedro", "Dieter", "Pedro")

rev = data.frame(comments, profs)

# Finish the code to build shining_list
shining_list <- list(moviename = mov, actors = act, reviews = rev)

#' Selecionando Elementos de uma Lista
#' ========================================================

# shining_list is already pre-loaded in the workspace

# Print out the vector representing the actors
shining_list$actors
# Ou
shining_list[[2]]

# Print the second element of the vector representing the actors
shining_list$actors

#' Adicionando Variáveis a lista com c()
#' ========================================================

# shining_list, the list containing movie name, actors and reviews, is pre-loaded in the workspace

# We forgot something; add the year to shining_list
shining_list_full <- c(shining_list, year = 2017)

# Have a look at shining_list_full
str(shining_list_full)

