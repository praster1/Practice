# www/js/myJS.js가 있는 상황에서 실행

library(shiny)

ui <- fluidPage(
    singleton(tags$head(tags$script(src="js/myJS.js"))),
    verbatimTextOutput("txt")
)

server <- function(input, output, session){
    output$txt <- renderPrint({
        input$myText
    })
}

shinyApp(ui, server)
