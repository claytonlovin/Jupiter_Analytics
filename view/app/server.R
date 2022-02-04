library(shiny)
library(bs4Dash)




server = function(input, output, sesssion) {
    
    # observeEvent(input$modal, {
    #   showModal(modalDialog(
    #     title = "Important message",
    #     "This is an important message!",
    #     easyClose = FALSE
    #   ))
    # 
    # })
  
  # IMPORTAÇAO DA TABELA - RENDERPLOR NO ID 
  output$crostable <- DT::renderDataTable(
    DT::datatable(
      category_frequency,
      options = list(lengthMenu = c(5, 30, 50),
                     pageLength = 5,
                     searching = FALSE,
                     dom = "tp"),
      style="bootstrap4"
      )
    
  )
  }



#shinyApp(ui, server)