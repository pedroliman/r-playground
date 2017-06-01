#' O que é um Data Frame
#' ========================================================
#' Um Data Frame pode conter variáveis de diversos tipos (diferente de uma matriz).
# Print out built-in R data frame
mtcars 

#' Observando o "Head()" do DataFrame
#' ========================================================
# Call head() on mtcars

head(mtcars)
# Pode-se usar a função tail() também
tail(mtcars)

#' Olhando a Estrutura str() de um Data Frame
#' ========================================================
# Investigate the structure of mtcars

str(mtcars)

#' Criando um Dataframe - data.frame()
#' ========================================================
# Definition of vectors
name <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Create a data frame from the vectors
planets_df <- data.frame(name,type,diameter,rotation,rings)

planets_df

# Check the structure of planets_df

str(planets_df)

#' Selecionando Dados do Data frame
#' ========================================================
planets_df
# Print out diameter of Mercury (row 1, column 3)
planets_df[1,3]

# Print out data for Mars (entire fourth row)
planets_df[4,]

# Select first 5 values of diameter column
planets_df[1:5,"diameter"]

#' Selecionando Dados com nomes
#' ========================================================
# planets_df is pre-loaded in your workspace
str(planets_df)
# Tudo isso Significa a mesma Coisa
rings_vector <- planets_df[5]
rings_vector <- planets_df["rings"]
rings_vector <- planets_df$rings

# Print out rings_vector
rings_vector

#' Selecionando Dados com vetor de booleanos
#' ========================================================
# planets_df and rings_vector are pre-loaded in your workspace

# Selecionando Todos os Planetas com Rings!! (Selecionando)
planets_df[rings_vector,]

# A função subset faz a mesma coisa (e parece mais natural)
subset(planets_df, rings)

#' Selecionando Dados com subset()
#' ========================================================
# Selecionando Plantes com Diametro < 1
subset(planets_df, subset= diameter < 1)

#' Ordenando DataFrames com order()
#' ========================================================
# Play around with the order function in the console
a = c(1000,100,23,4,1,3,4,5,2,2,34)

# Esta função retorna a posição no ranking de cada item
order(a)

# E assim podemos retornar o objeto a ordenado
a[order(a)]

#' Ordenando o Dataframe por uma dimensão
#' ========================================================
# planets_df is pre-loaded in your workspace

# Use order() to create positions
positions <-  order(planets_df$diameter)

# Use positions to sort planets_df
planets_df[positions,]

#ou simplesmente
planets_df[order(planets_df$diameter),]