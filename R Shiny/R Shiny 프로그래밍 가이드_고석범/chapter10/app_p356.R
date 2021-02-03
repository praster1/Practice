library(shiny)
ui <- fluidPage(
    h2("인터랙티브 플롯의 기본"),
    plotOutput("plot1"),
    h3("클릭한 위치 정보"),
    p(verbatimTextOutput("event_info"))
)

server <- function(input, output) {
    output$plot1 <- renderPlot({
        x <- mtcars$wt
        y <- mtcars$mpg
        plot(x, y)
    })
}

shinyApp(ui, server)
