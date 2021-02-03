library(shiny)
ui <- fluidPage(
    h2("인터랙티브 플롯의 기본"),
    plotOutput("plot1", click = "clicked_point"),
    h3("클릭한 위치에 근접해 있는 데이터셋"),
    p(verbatimTextOutput("event_info"))
)

server <- function(input, output) {

    output$plot1 <- renderPlot({
        plot(mtcars$wt, mtcars$mpg)
    })

    output$event_info <- renderPrint({
        nearPoints(mtcars, input$clicked_point, xvar = "wt", yvar = "mpg")
    })
}


shinyApp(ui, server)
