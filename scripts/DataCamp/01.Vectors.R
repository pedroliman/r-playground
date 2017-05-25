numeric_vector <- c(1, 10, 49)
character_vector <- c("a", "b", "c")


#' c() = Combine Function - Cria um vetor!
# Complete the code for boolean_vector
boolean_vector <- c(TRUE, FALSE, TRUE)

#' Montando Vetores

# Poker winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)

# Roulette winnings from Monday to Friday
roulette_vector <-  c(-24, -50, 100, 350, 10)

poker_vector

#' Nomeando as Variáveis de um Vetor
# Poker winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)

# Roulette winnings from Monday to Friday
roulette_vector <- c(-24, -50, 100, -350, 10)

# The variable days_vector
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# Assign the names of the day to roulette_vector and poker_vector
names(poker_vector) <-   days_vector
names(roulette_vector) <- days_vector

dia = "Monday"

roulette_vector[dia]

#' Somando Vetores
A_vector <- c(1, 2, 3)
B_vector <- c(4, 5, 6)

# Take the sum of A_vector and B_vector
total_vector <- B_vector + A_vector

# Print out total_vector
total_vector


# Assign to total_daily how much you won/lost on each day
total_daily <- poker_vector + roulette_vector
total_daily

#' Outra maneira seria somar os vetores antes
# Total winnings with poker
total_poker <- sum(poker_vector)

# Total winnings with roulette
total_roulette <-  sum(roulette_vector)

# Total winnings overall
total_week <- total_poker + total_roulette

# Print out total_week
total_week

#' Comparando as Somas
# Check if you realized higher total gains in poker than in roulette 
total_poker > total_roulette

#' Selecionando uma variável
# Define a new variable based on a selection
poker_wednesday <- poker_vector["Wednesday"]
poker_wednesday

#' Selecionando vários elementos dentro de um vetor:
poker_midweek = poker_vector[c(2,3,4)]
poker_midweek

#' Uma forma mais elegante de fazer isso é usar a notação i:j, por exemplo:
#' Selecionando vários elementos dentro de um vetor:
poker_midweek = poker_vector[2:4]
poker_midweek

# Define a new variable based on a selection
roulette_selection_vector <- roulette_vector[2:4]

