
library(shiny)
# Reactive Toolkit

#1 render*() Functions
# Funções render*() fazem objetos aparecer
# funções render*() devem ser salvas em objetos output$

renderPlot({
  # Codigo para executar. A função irá respoder a cada mudança em parametros reativos
  # Ele vai retornar todo o bloco de código
})

#2 Modularizar o Código com reactive()

dados_simulados = reactive({
  #Função aqui para fazer isso!
  # Ela salva um cache dos seus resultados.
  # Ela pode modularizar os resultados.
})

#3 Prevenir reações com isolate
# Posso usar o isolate dentro de um output!
output$objetoOutput = renderPlot({
  hist(objetotal,main=isolate(input$tituloDoGraficoTAl))
})

#4 Rodar Código a partir de um evento
# Posso usar um action button pra isso
# na Ui posso criar o botão, por exemplo

ui = fluidPage(
  actionButton(inputId = "executar", label = "Executa Alguma Coisa!")
)

# O observeEvent pode observar várias variáveis ao mesmo tempo e executar o que você quiser no servidor. Ele executa código no servidor
observeEvent(input$executar, {
  # Código a Executar (Aqui dentro as variaveis reativas são isoladas!)
  
})

#5 o Observe é parecido com o observeEvent, mas reage a todos os seus inputs
observe({
  # Linhas a executar com parâmetros reativos
})

#6 Delay Reactions (só mudar de acordo com alguns parâmetros mudam!)
eventReactive(input$botao{ Código})

#7 Manage State: Isso simplesmente cria variáveis reativas que não são input, e podem ser chamadas em outros lugares
valores_reativos = reactiveValues(dados = algumvalorinicial)

