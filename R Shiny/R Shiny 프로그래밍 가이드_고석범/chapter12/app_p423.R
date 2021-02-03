library(shiny)
library(ggplot2)
set.seed(1)

ui <- function(request) {
    fluidPage(
        sliderInput("sel", "구간의 개수", value = 0.5, min = 0.1 , max = 1),
        plotOutput("myPlot"),
        bookmarkButton()
    )
}

server <- function(input, output, session){
    output$myPlot <- renderPlot({
        df <- data.frame(x = rnorm(1000))
        ggplot(df, aes(x)) + geom_histogram(binwidth = input$sel, fill = "steelblue")
    })
}

shinyApp(ui, server, enableBookmarking = "server")
