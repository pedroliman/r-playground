
library(shiny)
# Reactive Toolkit

#1 render*() Functions
# Fun��es render*() fazem objetos aparecer
# fun��es render*() devem ser salvas em objetos output$

renderPlot({
  # Codigo para executar. A fun��o ir� respoder a cada mudan�a em parametros reativos
  # Ele vai retornar todo o bloco de c�digo
})

#2 Modularizar o C�digo com reactive()

dados_simulados = reactive({
  #Fun��o aqui para fazer isso!
  # Ela salva um cache dos seus resultados.
  # Ela pode modularizar os resultados.
})

#3 Prevenir rea��es com isolate
# Posso usar o isolate dentro de um output!
output$objetoOutput = renderPlot({
  hist(objetotal,main=isolate(input$tituloDoGraficoTAl))
})

#4 Rodar C�digo a partir de um evento
# Posso usar um action button pra isso
# na Ui posso criar o bot�o, por exemplo

ui = fluidPage(
  actionButton(inputId = "executar", label = "Executa Alguma Coisa!")
)

# O observeEvent pode observar v�rias vari�veis ao mesmo tempo e executar o que voc� quiser no servidor. Ele executa c�digo no servidor
observeEvent(input$executar, {
  # C�digo a Executar (Aqui dentro as variaveis reativas s�o isoladas!)
  
})

#5 o Observe � parecido com o observeEvent, mas reage a todos os seus inputs
observe({
  # Linhas a executar com par�metros reativos
})

#6 Delay Reactions (s� mudar de acordo com alguns par�metros mudam!)
eventReactive(input$botao{ C�digo})

#7 Manage State: Isso simplesmente cria vari�veis reativas que n�o s�o input, e podem ser chamadas em outros lugares
valores_reativos = reactiveValues(dados = algumvalorinicial)

