library(shiny)
library(bs4Dash)
library(shinyWidgets)
library(DT)
source("model/datasetting.R", local = TRUE)



server = function(input, output, sesssion) {
    # MODAL PRINCIPAL, CHAMA O MODAL DE PESQUISA POR AUDIO
    observeEvent(input$modal, {
      showModal(modalDialog(
        title = "Important message",
        "This is an important message!",
        easyClose = FALSE
      ))

    })
  
  # HOME
  # IMPORTAÇAO DA TABELA - RENDERPLOR NO ID 
  output$tb_vendas_categoria <- DT::renderDataTable(
    DT::datatable(
      category_frequency,
      options = list(lengthMenu = c(5, 30, 50),
                     pageLength = 5,
                     searching = FALSE,
                     dom = "tp",
                     columns = list(
                       list(title = ""),
                       list(title = "Categoria"),
                       list(title = "Numero de vendas"),
                       list(title = "Valor em R$")
                     )),
      style="bootstrap4"
      )
    
  )
  }



#shinyApp(ui, server)