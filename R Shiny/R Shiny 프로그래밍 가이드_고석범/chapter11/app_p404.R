library(shiny)
ui <- fluidPage(
    useShinyjs(),
    hidden(
        textInput("text", "텍스트")
    ),
    actionButton("show", "위젯 보기")
)
server <- function(input, output) {
    observeEvent(input$show, {
        show("text")
    })
}
shinyApp(ui, server)
