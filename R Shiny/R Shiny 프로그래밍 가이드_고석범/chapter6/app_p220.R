library(shiny)

ui <- fluidPage(

    h2(textOutput("txt")),
    verbatimTextOutput("sum1")
)

server <- function(input, output) {
    output $ txt <- renderText({
        "mtcars를 사용한 회귀 분석"
    })
    output $ sum1 <- renderPrint({
        summary(lm(mpg ~ wt + qsec, data = mtcars))
    })
}

shinyApp(ui, server)
