library(shiny)
ui <- fluidPage(
    sliderInput("obs", "No. of Random Numbers", min = 30, max = 100, value = 50),
    plotOutput("myPlot"),
    verbatimTextOutput("txt")
)

server <- function(input, output, session) {
    output$myPlot <- renderPlot({
        hist(rnorm(input$obs))
    })

    output$txt <- renderText({
        p_width <- paste("Plot Width:", session$clientData$output_myPlot_width)
        p_height <- paste("Plot Height:", session$clientData$output_myPlot_height)
        paste(c(p_width, p_height), collapse =  "\n")
    })
}

shinyApp(ui, server)
