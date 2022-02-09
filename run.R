library(shiny)
source("model/datasetting.R", local = TRUE)
runApp()



# shiny::runApp(appDir = "view/app",
#               port=getOption('shiny.port'),
#               launch.browser = getOption('shiny.launch.browser', interactive()),
#               host=getOption('shiny.host'),
#               workerId="", quiet=FALSE,
#               display.mode=c("auto", "normal", "showcase"),
#               test.mode=getOption('shiny.testmode', FALSE))