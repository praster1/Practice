library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("diamonds 데이터"),
  sidebarPanel(
    selectInput("plotType", "Plot Type",
                c(Scatter = "scatter", Histogram = "hist")
    ),
    # Only show this panel if the plot type is a histogram
    conditionalPanel(
      condition = "input.plotType == 'hist'",
      selectInput(
        "breaks", "Breaks",
        c("Sturges", "Scott", "Freedman-Diaconis", "[Custom]" = "custom")
      ),
      # Only show this panel if Custom is selected
      conditionalPanel(
        condition = "input.breaks == 'custom'",
        sliderInput("breakCount", "Break Count", min = 1, max = 50, value = 10)
      )
    )
  ),
  mainPanel(
    plotOutput("plot")
  )
)

server <- function(input, output) {
  brs <- reactive({

    if (input$breaks == "custom") {
      input$breakCount
    } else {
      input$breaks
    }
  })

  p <- reactive({
    if (input$plotType == "scatter") {
      plot(diamonds$carat, diamonds$price, col= "red")
    } else {
      hist(diamonds$carat, breaks = brs())
    }
  })

  output$plot <- renderPlot({
    p()
  })
}

shinyApp(ui, server)
