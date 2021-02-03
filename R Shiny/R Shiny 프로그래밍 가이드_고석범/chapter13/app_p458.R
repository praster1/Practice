library(shiny)
ui <- fluidPage(
    sliderInput("obs", "No. of Random Numbers", min = 30, max = 100, value = 50),
    plotOutput("myPlot")
)

server <- function(input, output, session) {
    output$myPlot <- renderPlot({
        hist(rnorm(input$obs))
    })
}

shinyApp(ui, server)
