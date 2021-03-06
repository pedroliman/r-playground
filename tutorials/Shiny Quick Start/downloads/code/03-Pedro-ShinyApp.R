library(shiny)

# Interface - Define Outputs e Inputs do Usu�rio
# Comece cada app com o template
# Adicione elementos como argumentos para a fun��o fluidPage()

ui <- fluidPage(
  "Um Gerador de N�meros Aleat�rios",
  # Fun��es *Input()
  # Sempre tem os argumentos inputId e label
  sliderInput(inputId = "num", #Nome �nico
              label = "Escolha um N�mero", #Label do 
              value = 25, min = 1, max = 100,dragRange = TRUE),
  
  # Fun��es *Output
  plotOutput(outputId = "hist")
  
)

# 3 Regras
# 1: Salvar objetos para salvar em output$idDoOutput 
# 2: Constriuir objetos com fun��es render()

server <- function(input, output) {
  #TOdas as fun��es s�o renderAlgumacoisa
  output$hist = renderPlot({
    # Aqui o c�digo que faz o que eu quero que seja renderizado
    titulo = "100 valores normais"
    hist(rnorm(input$num), main=titulo)
  })  
}

shinyApp(ui = ui, server = server)