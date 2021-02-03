library(shiny)
ui <- fluidPage(
    wellPanel(
        p("콘솔에서, Shiny.onInputChange('myText', '원하는 텍스트'의 형태로 입력)")
    ),
    verbatimTextOutput("txt")
)

server <- function(input, output, session) {
    output$txt <- renderPrint({
        req(input$myText)
        input$myText
    })
}

shinyApp(ui, server)
