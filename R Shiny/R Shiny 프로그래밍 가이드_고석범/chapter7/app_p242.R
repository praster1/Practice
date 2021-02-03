library(shiny)

ui <- fluidPage(

    textInput("myText", "텍스트 입력"),
    textOutput("result")
)

server <- function(input, output, session){
    output$result <- renderText({
        input$myText
    })
}

shinyApp(ui, server)
