library(dplyr)

dataframe = cars

var = "speed"

dim(dataframe)

str(dataframe)

names(dataframe)

head(select(dataframe,speed:dist))

head(select(dataframe,-dist))


filter(dataframe, speed <= 4)

filter(dataframe, speed == 4 & dist ==2)

arrange(dataframe, speed)

tail(arrange(dataframe,speed))

# Ordenando ao Contrário
arrange(dataframe,desc(speed))


# Renomeando Funções
# rename(dataframe, novonome = speed)


# Criando novas variáveis ou Editando Variáveis

mutate(dataframe, time = speed*dist)


# Group By

# Criando uma Nova Variável

dataframe = mutate(dataframe,categoria = factor(1*(speed<=15),labels=c("rapido","lento")))


carros_agrupados <- group_by(dataframe,categoria)
carros_agrupados

summarize(carros_agrupados,mean_speed=mean(speed),mean_dist = mean(dist))



## Agrupando Operações de forma "legível"

# Pipeline Operator: Ideia: Pegar um dataset, passar por um pipeline de operações e chegar em um novo dataset


## Posso fazer tudo que fiz anteriormente usando o mutate
media = dataframe %>% 
  mutate(categoria = factor(1*(speed<=15),labels=c("rapido","lento"))) %>%
  group_by(categoria) %>%
  summarise(mean_speed = mean(speed))


## A Outra maneira seria rodar cada um deles separadamente:
## Isso é bem pior de ler, porque a sequência de operações é "inversa"

media = summarise(
  group_by(
    mutate(
      dataframe
      ,categoria = factor(1*(speed<=15),labels=c("rapido","lento")))
    ,categoria)
  ,mean_speed = mean(speed)
)

transmute

### Pode trabalhar
# dbi package
