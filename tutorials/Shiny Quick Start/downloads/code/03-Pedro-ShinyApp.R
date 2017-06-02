library(shiny)

# Interface - Define Outputs e Inputs do Usuário
# Comece cada app com o template
# Adicione elementos como argumentos para a função fluidPage()

ui <- fluidPage(
  "Um Gerador de Números Aleatórios",
  # Funções *Input()
  # Sempre tem os argumentos inputId e label
  sliderInput(inputId = "num", #Nome Único
              label = "Escolha um Número", #Label do 
              value = 25, min = 1, max = 100,dragRange = TRUE),
  
  # Funções *Output
  plotOutput(outputId = "hist")
  
)

# 3 Regras
# 1: Salvar objetos para salvar em output$idDoOutput 
# 2: Constriuir objetos com funções render()

server <- function(input, output) {
  #TOdas as funções são renderAlgumacoisa
  output$hist = renderPlot({
    # Aqui o código que faz o que eu quero que seja renderizado
    titulo = "100 valores normais"
    hist(rnorm(input$num), main=titulo)
  })  
}

shinyApp(ui = ui, server = server)