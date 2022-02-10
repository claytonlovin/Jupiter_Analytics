library(shiny)
library(bs4Dash)
library(shinyWidgets)
library(DT)
library(dplyr)
library(ggplot2)
library(plotly)
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
  
  # PLOTAGEM DE GÁFICO DE BARRAS
  output$bar <- renderPlotly(
    ggplotly(
      ggplot(teste, aes(x = product_category_name, y = frequencia))+
        geom_bar(stat = "identity", width=0.7, fill="#17a2b8",
                 show.legend = NA)+
        ylab("")+xlab("")+
    
        theme(
              plot.margin=margin(0, 0, 0.5, 0, "cm"),
              panel.background = element_rect(
                fill = "white",
                colour = "transparent", 
                size = 1),
                axis.text.x = element_text(angle = 20, vjust = 0.5, hjust=1)
                #axis.text.x = element_blank()
      )
    )%>%config(
      displaylogo = FALSE,
      modeBarButtonsToRemove = c("zoomIn2d", "zoomOut2d","sendDataToCloud  "))
  )
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