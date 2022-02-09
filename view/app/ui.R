library(shiny)
library(bs4Dash)
library(shinyWidgets)
library(DT)
# source("datasetting.R", local = TRUE)


ui <- dashboardPage(
    title = "Jupiter Analytics",
    header = dashboardHeader(
      
    ),
    sidebar = dashboardSidebar(
      fixed = TRUE,
      collapsed = TRUE,
      skin = "light",
      status = "info",
      id = "sidebar",
      customArea = fluidRow(
        actionButton("modal",
          label = NULL,
          ionicon(name="keypad"),
          width = NULL,
          status = "info",
          style = "margin: auto"
          #dashboardBadge(textOutput("btnVal"), color = "danger")
        )
      ),
      # sidebarUserPanel(
      #   image = "https://adminlte.io/themes/v3/dist/img/AdminLTELogo.png",
      #   name = "Welcome Onboard!"
      # ),
      sidebarMenu(
        id = "current_tab",
        flat = FALSE,
        compact = FALSE,
        childIndent = TRUE,
        sidebarHeader(""),
        menuItem(
          "Indicadores",
          tabName = "indicador",
          icon = icon("sliders-h")
        ),
        menuItem(
          "Financeiro",
          #badgeLabel = "New",
          badgeColor = "success",
          tabName = "financeiro",
          icon = icon("dollar-sign")
        ),
        menuItem(
          "Comercial",
          tabName = "comercial",
          icon = icon("id-card")
        ),
        menuItem(
          "Marketing",
          tabName = "marketing",
          icon = icon("layer-group")
        ),
        menuItem(
          "Recuros Humanos",
          tabName = "rh",
          icon = icon("object-ungroup")
        ),
        menuItem(
          "Diretoria",
          tabName = "diretoria",
          icon = icon("chart-area")
        ),
        sidebarHeader("Insight"),
        menuItem(
          "Buscar",
          tabName = "buscar",
          icon = icon("search")
        ),
        
        #sidebarHeader("Modulos"),
      
        
        #sidebarHeader("BS4 gallery"),
        menuItem(
          text = "IA",
          icon = icon("cubes"),
          startExpanded = FALSE,
          menuSubItem(
            text = HTML(
              paste(
                "Algoritmo 1",
                dashboardBadge(
                  "new",
                  position = "right",
                  color = "success"
                )
              )
            ),
            tabName = "algoritmo1",
            icon = icon("circle")
          ),
          menuSubItem(
            text = HTML(
              paste(
                "Algoritmo 2",
                dashboardBadge(
                  #"!",
                  position = "right",
                  color = "success"
                )
              )
            ),
            tabName = "algoritmo2"
          )
        )
      )
    ),
    
    # MENU APLICAR FILTROS
    controlbar = dashboardControlbar(
      skin = "light",
      
      sidebarMenu(
        id = "sidebar_menu",
        dateRangeInput("dd1", 
                       "Filtrar por datas",
                       language= "pt-BR",
                       separator = "até",
                       format = "dd/mm/yyyy",
                       startview =  "month"
                       ), 
        actionButton("simulate", "Aplicar Filtro!", status = "info")
      )
      
      
    ),
    footer = dashboardFooter(),
    body = dashboardBody(
      tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
      ),
      # tags$style(HTML("
      # 
      # 
      #           
      #               .info-box{
      #                 background-color: #ffffff !important;
      #               }
      # 
      #           ")),

      tabItems(

       # TELA DE EXIBIÇÃO DA HOMME 
       tabItem(tabName= "indicador",
       fluidRow(
       infoBox(
          title = "Avaliação",
          value = NULL,
          subtitle = "meanAvaliacao",
          icon = shiny::icon("chart-area", color="white"),
          color = "info",
          width = 3,
          href = NULL,
          fill = FALSE,
          gradient = FALSE,
          elevation = NULL,
          iconElevation = NULL
          
        ),
        infoBox(
          title = "Despesas",
          value = NULL,
          subtitle = "Descrição",
          icon = icon("chart-area", class = NULL, lib = "font-awesome"),
          color = "info",
          width = 3,
          href = NULL,
          fill = FALSE,  #SELECIONA COR DO ICONE PARA O TITULOS E SUB
          gradient = FALSE,
          elevation = NULL,
          iconElevation = NULL
          
        ),
       infoBox(
         title = "Receita",
         subtitle = "format_dollars(receita)",
         icon = icon("dollar-sign", class = NULL, lib = "font-awesome"),
         color = "info",
         width = 3,
         href = NULL,
         fill = FALSE,
         gradient = FALSE,
         elevation = NULL,
         iconElevation = NULL
         
       ),
       infoBox(
         title = "Lojas",
         value = NULL,
         subtitle = "nlojas",
         icon = icon("arrow-down", class = NULL, lib = "font-awesome"),
         color = "info",
         width = 3,
         href = NULL,
         fill = FALSE,
         gradient = FALSE,
         elevation = NULL,
         iconElevation = NULL
         
       ),
       
        box(
          title = "Evolução das vendas por trimestre", 
          height = 375
        ),
        box(
          title = "Vendas por categorias", 
          height = 375,
          DT::dataTableOutput("tb_vendas_categoria"))
          #box(plotOutput("plot1", height = 280))

      )
       ),
       # FIM TELA DE EXIBIÇÃO DA HOME
        tabItem(tabName = "financeiro",
          h2("Fincanceiro")
        ),
        tabItem(tabName = "comercial",
          h2("Comercial")
        ),
        tabItem(tabName = "marketing",
          h2("Marketing")
        ),
        tabItem(tabName = "rh",
          h2("Recurso Humanos")
        ),
        tabItem(tabName = "diretoria",
          h2("Diretoria")
                
        ),
        tabItem(tabName = "buscar",
                fluidRow(
                  column(3),
                  column(6,
                    searchInput(
                      inputId = "search", label = "Buscar por termos",
                      placeholder = "Desempenho financeiro",
                      btnSearch = icon("search"),
                      btnReset = icon("microphone"),
                      width = "450px"
                    )
                  )
                )
                )
      )
      
    )
  )




# server = function(input, output, sesssion) {
#     observeEvent(input$modal, {
#       showModal(modalDialog(
#         title = "Important message",
#         "This is an important message!",
#         easyClose = FALSE
#       ))

#     })
#   }



# shinyApp(ui, server, basicPage)