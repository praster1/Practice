library(shiny)
library(shinyjs)

ui <- fluidPage(
    useShinyjs(),  # shinyjs 패키지 사용하기 위해서

    actionButton("button", "Click me"),
    textInput("text", "Text")
)

server <- function(input, output) {
    observeEvent(input$button, {
        toggle("text")  # toggle 샤이니 함수를 사용한다.
    })
}

shinyApp(ui, server)
