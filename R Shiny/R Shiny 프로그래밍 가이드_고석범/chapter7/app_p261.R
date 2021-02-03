library(shiny)
ui <- fluidPage(
    actionButton("do", "실행"),
    plotOutput("histo")
)

server <- function(input, output) {
    observeEvent(input$do, {
        output$histo <- renderPlot({
            hist(rnorm(1000))
        })
    })
}

shinyApp(ui, server)
